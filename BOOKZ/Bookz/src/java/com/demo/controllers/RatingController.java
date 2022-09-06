/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.demo.controllers;

import com.demo.DAOS.RatingDAO;
import com.demo.DTOs.Member;
import com.demo.DTOs.Rating;
import com.demo.DTOs.RatingMember;
import com.demo.utils.Tools;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "RatingController", urlPatterns = {"/rate"})
public class RatingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String url = "";
        Member login = (Member) session.getAttribute("login");
        if (action.equals("loadcomment")) {
            String bookid = request.getParameter("bookid");
            List<RatingMember> ratingMemberList = RatingDAO.getCommentFromBook(bookid);
            request.setAttribute("ratmem_list", ratingMemberList);
            return;
            //this is a include action
        } else {
            if (action.equals("comment")) {
                url = "book?action=watch";
                String bookid = request.getParameter("bookid");
                url += "&bookid=" + bookid;
//            System.out.println(request.getClass().getName());
                int star = Integer.parseInt(request.getParameter("rate"));
                String comment = Tools.toUTF8(request.getParameter("comment"));
                try {
                    RatingDAO.insertComment(login.getMemberID(), bookid, star, comment);
                } catch (Exception e) {
                    System.out.println("Error at RatingController: " + e.toString());
                } finally {
                    System.out.println(url);
                    response.sendRedirect(url);
                    return;
                }
            } else if (action.equals("deletecomment")) {
//          rate?memberid=M0002&rateid=R00031&action=deletecomment
                url = "book?action=watch";
                String bookid = request.getParameter("bookid");
                url += "&bookid=" + bookid;
                String rateid = request.getParameter("rateid");
                String memberid = request.getParameter("memberid");
                if (memberid.equals(login.getMemberID()) || login.getRole().equals("admin")) {
                    Rating comment = RatingDAO.getCommentByID(rateid);
                    comment.setDeleted(true);
                    RatingDAO.updateComment(comment);
                }
            } else if (action.equals("editcomment")) {
//          rate?memberid=M0001&rateid=R00043&action=editcomment&edit=hiiiiii
                url = "book?action=watch";
                String bookid = request.getParameter("bookid");
                url += "&bookid=" + bookid;
                String rateid = request.getParameter("rateid");
                String edit = request.getParameter("edit");
                String memberid = request.getParameter("memberid");
                if (memberid.equals(login.getMemberID())) {
                    Rating comment = RatingDAO.getCommentByID(rateid);
                    comment.setComment(edit);
                    comment.setLastDateEdit(new Date(System.currentTimeMillis()));
                    RatingDAO.updateComment(comment);
                }
            }
            request.getRequestDispatcher(url).forward(request, response);
        }
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
