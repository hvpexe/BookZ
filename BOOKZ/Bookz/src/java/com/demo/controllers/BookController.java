/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.demo.controllers;

import com.demo.DAOS.BookDAO;
import com.demo.DAOS.DownloadDAO;
import com.demo.DAOS.MemberDAO;
import com.demo.DAOS.RatingDAO;
import com.demo.DAOS.ReportBookDAO;
import com.demo.DTOs.Book;
import com.demo.DTOs.Member;
import com.demo.DTOs.RatingStarCount;
import com.demo.DTOs.ReportBook;
import com.demo.utils.Tools;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 100, // 50MB
        maxFileSize = 1024 * 1024 * 100, // 50MB
        maxRequestSize = 1024 * 1024 * 100) // 50MB
public class BookController extends HttpServlet {

    private static String BOOK = "1";
    private static String NABOOK = "2";
    private static String USER = "3";
    private static String RBOOK = "4";
    private static String RRATING = "5";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Member memberLogin = (Member) session.getAttribute("login");
        String action = request.getParameter("action");
        String url = "";
        try {
            if (memberLogin == null && "upload".equals(action)) {
                url = "home.jsp";
                session.setAttribute("fail_login", "You need to login to Upload Book");
                response.sendRedirect(url);
                return;
            }
            if (action.equals("upload")) {
                url = "uploadBook.jsp";
                if (memberLogin.getRole().equals("admin")) {
                    url = "manage.jsp";
                    List<Book> bookList = null;
                    List<Member> userList = null;
                    List<ReportBook> reportList = null;
                    String tab = request.getParameter("tab");
                    String p = request.getParameter("p");
                    String search = request.getParameter("search");
                    //set tab
                    tab = tab == null ? BOOK : tab;
                    session.setAttribute("tab", tab);
                    //set p
                    p = p == null ? "1" : p;
                    session.setAttribute("p", p);
                    Double listSize = 0.0;
                    if (tab.equals(BOOK)) {
                        bookList = BookDAO.getSearchedBookForManager(search, 1);
                        listSize = Math.ceil((double) bookList.size() / 10);
                    } else if (tab.equals(NABOOK)) {
                        bookList = BookDAO.getSearchedBookForManager(search, 0);
                        listSize = Math.ceil((double) bookList.size() / 10);
                    } else if (tab.equals(USER)) {
                        userList = MemberDAO.getUserRole(MemberDAO.Role_ALL, search);
                        listSize = Math.ceil((double) userList.size() / 10);
                    } else if (tab.equals(RBOOK)) {
                        reportList = ReportBookDAO.getReportBookList(search);
                        listSize = Math.ceil((double) reportList.size() / 10);
                    } //getReported book
                    session.setAttribute("userList", userList);
                    session.setAttribute("bookList", bookList);
                    session.setAttribute("reportList", reportList);
                    session.setAttribute("listSize", listSize.intValue());
                }
                session.setAttribute("action", "create");
                request.getRequestDispatcher(url).forward(request, response);
            } else if (action.equals("create")) {
                url = "uploadBook.jsp?action=create";
                Member loginMember = (Member) session.getAttribute("login");
                String newID = Tools.newIDformat(BookDAO.getMaxID());//Lấy ID Trước khi thêm sách
                boolean check = this.createBook(request, response, memberLogin);

                // If the loginMember is admin change url to action accept
                if (loginMember.getRole().equals("admin")) {
                    url = "book?action=accept&bookid=" + newID;
                }
                request.getRequestDispatcher(url).forward(request, response);
            } else if (action.equals("watch")) {
                String bookid = request.getParameter("bookid");
                Book b = BookDAO.getBookByID(bookid);
                if (b == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                RatingStarCount rsc = RatingDAO.getStars(bookid);
                request.setAttribute("bookdetail", b);
                request.setAttribute("rsc", rsc);
                if (b != null) {
                    request.getRequestDispatcher("bookDetail.jsp").forward(request, response);
                }
            } else if (action.equals("edit")) {
                url = "uploadBook.jsp";
                String bookid = request.getParameter("bookid");
                session.setAttribute("action", "update");
                session.removeAttribute("coverimg");
                session.removeAttribute("update_status");
                Book b = BookDAO.getBookByID(bookid);
                request.setAttribute("cc", b);
                session.setAttribute("coverimg", b.getCover());
                request.getRequestDispatcher(url).forward(request, response);
            } else if (action.equals("update")) {
                url = "uploadBook.jsp";
                updateBook(request, response);
                response.sendRedirect(url);
//            session.removeAttribute("cc");
//            session.removeAttribute("update_status");
            } else if (action.equals("download")) {
                url = "book?action=watch&bookid=";
                String bookid = request.getParameter("bookid");
                url += bookid;
                Book book = BookDAO.getBookByID(bookid);
                book.setNoDownloads(book.getNoDownloads() + 1);
                BookDAO.updateBook(book);
                Member member = (Member) session.getAttribute("login");
                DownloadDAO.insertDownload(bookid, member.getMemberID());//chua them
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                String tab = (String) session.getAttribute("tab");
                String p = (String) session.getAttribute("p");
                if (action.equals("accept")) {
                    /**
                     * accept
                     * if this is admin then they can accept book
                     * change member id number Upload Book +1
                     * redirect back to upload
                     */
                    String id = request.getParameter("bookid");
                    String memberID=  BookDAO.getBookByID(id).getMemberUpload();
                    Member member = MemberDAO.getUserByID(memberID);
                    member.setnoUploadBook(member.getnoUploadBook()+1);
                    MemberDAO.updateInfo(member);
                    BookDAO.acceptBook(id, true);
                    url = "book?action=upload";
                } else if (action.equals("decline")) {
                    String id = request.getParameter("bookid");
                    BookDAO.acceptBook(id, false);
                    url = "book?action=upload";
                } else if (action.equals("delete")) {
                    String id = request.getParameter("bookid");
                    BookDAO.deleteBook(id);
                    url = "book?action=upload";
                } else if (action.equals("Approved") || action.equals("Denied")) { //phan nay cua phu
                    int reportID = Integer.parseInt(request.getParameter("reportID"));
                    ReportBookDAO.updateStateReport(reportID, action);
                    url = "book?action=upload";
                }
                if (tab != null) {
                    url += "&tab=" + tab;
                }
                if (p != null) {
                    url += "&p=" + p;
                }
                System.out.println(url);
                request.getRequestDispatcher(url).forward(request, response);

            }
        } catch (Exception e) {
            System.out.println("Error at BookController: " + e.toString());
        }
    }

    private boolean createBook(HttpServletRequest request, HttpServletResponse response, Member member) throws IOException {
        try {
            //        ?cover=&filepdf=Nhóm_3.pdf&fileepub=&title=a&author=b&publisher=c&language=VI&category=C00&description=d&action=create
            Part coverPart = request.getPart("cover");
            Part pdfPart = request.getPart("filepdf");
            Part epubPart = request.getPart("fileepub");
            String title = Tools.toUTF8(request.getParameter("title"));
            String author = Tools.toUTF8(request.getParameter("author"));
            String publisher = Tools.toUTF8(request.getParameter("publisher"));
            String language = request.getParameter("language");
            String category = request.getParameter("category");
            String description = Tools.toUTF8(request.getParameter("description"));
            if (author.isEmpty() || title.isEmpty()) {
                throw new Exception("Author or Title is Empty");
            }
            ServletContext sc = request.getServletContext();
            String newID = Tools.newIDformat(BookDAO.getMaxID());
            String cover = BookDAO.saveFile(newID, coverPart, sc, Book.COVER_PATH);
            String pdf = BookDAO.saveFile(newID, pdfPart, sc, Book.PDF_PATH);
            String epub = BookDAO.saveFile(newID, epubPart, sc, Book.EPUB_PATH);
            System.out.println(cover + " " + pdf + " " + epub);
            if (BookDAO.insertBookForUser(newID, member.getMemberID(), cover, pdf, epub, title, author, publisher, language, category, description)) {
                return true;
            }
        } catch (Exception ex) {
            System.out.println("createBook Error!" + ex.getMessage());
        }
        return false;
    }

    private boolean updateBook(HttpServletRequest request, HttpServletResponse response) {
        try {
            String bookid = request.getParameter("bookid");
            System.out.println("bookid=" + bookid);
            Part coverPart = request.getPart("cover");
            Part pdfPart = request.getPart("filepdf");
            Part epubPart = request.getPart("fileepub");
            String title = Tools.toUTF8(request.getParameter("title"));
            String author = Tools.toUTF8(request.getParameter("author"));
            String publisher = Tools.toUTF8(request.getParameter("publisher"));
            String language = request.getParameter("language");
            String category = request.getParameter("category");
            String description = Tools.toUTF8(request.getParameter("description"));
            HttpSession session = request.getSession();
            String src = (String) session.getAttribute("coverimg");
            Member member = (Member) session.getAttribute("login");
            ServletContext sc = request.getServletContext();

            String cover = BookDAO.saveFile(bookid, coverPart, sc, Book.COVER_PATH);
            String pdf = BookDAO.saveFile(bookid, coverPart, sc, Book.PDF_PATH);
            String epub = BookDAO.saveFile(bookid, coverPart, sc, Book.EPUB_PATH);

            if (member != null && BookDAO.updateBook(bookid, title, author, publisher, language, category, description, cover,pdf,epub,member.getMemberID())) {
                session.setAttribute("coverimg", src);
                session.setAttribute("update_status", "<center>Update Success</center>");
            } else {
                session.setAttribute("update_status", "<center>Update Failed</center>");
            }
            session.setAttribute("cc", BookDAO.getBookByID(bookid));
            session.setAttribute("action", "update");
            return true;
        } catch (Exception ex) {
            System.out.println("BookController updateBook " + ex);
        }
        return false;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
