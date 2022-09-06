/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.DAOS;

import com.demo.DTOs.Book;
import com.demo.DTOs.BookProfile;
import com.demo.DTOs.Category;
import com.demo.DTOs.Member;
import com.demo.utils.DBUtils;
import com.demo.utils.Tools;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;
import org.apache.catalina.core.ApplicationPart;

/**
 *
 * @author Admin
 */
public class BookDAO {

    private static final String SELECT_BOOK_SQL = "SELECT TOP 12 BookID, Title, Author, Publisher, "
            + "Language, Cover, Description, NoDownload, FilePDF, FileEpub, isAccepted, "
            + "DateUpload, LastDateEdit, MemberUpload, MemberLastEdit, CategoryID "
            + "FROM Book "
            + "WHERE isAccepted = 1 AND isDeleted = 0 ";
    private static final String SELECT_MOST_DOWNLOAD_SQL = SELECT_BOOK_SQL.replace("12", "8") + " ORDER BY NoDownload DESC";
    private static final String SELECT_MOST_RECENT_SQL = SELECT_BOOK_SQL + " ORDER BY DateUpload DESC";
    private static final String SELECT_ALL_BOOK_SQL = SELECT_BOOK_SQL.replace("TOP 12", "");
    private static final String SEARCH_BOOK_SQL = SELECT_ALL_BOOK_SQL + " AND Title LIKE ?";
    private static final String SEARCH_AUTHOR_BOOK_SQL = SELECT_ALL_BOOK_SQL + " AND Author LIKE ?";
    private static final String SEARCH_AUTHOR_AND_TITLE_BOOK_SQL = SELECT_ALL_BOOK_SQL + " AND (Author LIKE ? or Title LIKE ?)"
            + " ORDER BY DateUpload DESC";
    private static final String SELECT_NON_ACCEPTED_BOOK = SELECT_ALL_BOOK_SQL.replace("= 1", "= 0");
    private static final String SELECT_COUNT_BOOK_SQL = "SELECT COUNT(BookID) "
            + " FROM Book "
            + "WHERE isAccepted = 1 AND isDeleted = 0";
    private static final String INSERT_BOOK_USER_SQL = "INSERT INTO Book(BookID, "
            + "Title, Author, Publisher, Language, Cover, Description, NoDownload, "
            + "FilePDF, FileEpub, IsAccepted, DateUpload, LastDateEdit, MemberUpload, "
            + "MemberLastEdit, CategoryID, isDeleted) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
    private static final String UPDATE_ACCEPT = " UPDATE Book SET IsAccepted = 1 WHERE BookID = ?";
    private static final String UPDATE_NOT_ACCEPT = UPDATE_ACCEPT.replace("IsAccepted = 1", "IsAccepted = 0");
    private static final String UPDATE_DELETE = UPDATE_ACCEPT.replace("IsAccepted = 1", "isDeleted = 1");

    public static List<Book> getAllBook() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_ALL_BOOK_SQL);
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getAllBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static List<Book> getNonAcceptBook() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_NON_ACCEPTED_BOOK);
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getNonAcceptBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static List<Book> getAcceptedBook() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_ALL_BOOK_SQL);
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getAcceptedBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static List<Book> getMostDownloadBook() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_MOST_DOWNLOAD_SQL);
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getMostDownloadBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static List<Book> getMostRecentBook() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_MOST_RECENT_SQL);
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getMostDownloadBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static List<Book> getSearchedBook(String search) {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SEARCH_BOOK_SQL);
//            System.out.println("%"+search+"%'");

            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getSearchedBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static List<Book> getSearchedBookForManager(String search, int check) {
        String SQL = SEARCH_AUTHOR_AND_TITLE_BOOK_SQL.replace("1", "" + check);
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            search = "%" + (search != null ? search : "") + "%";
            System.out.println(search + SQL);
            ps.setString(1, search);
            ps.setString(2, search);
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getSearchedBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static List<Book> getSearchBookByAuthor(String search) {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SEARCH_AUTHOR_BOOK_SQL);
            System.out.println("%" + search + "%'");
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getSearchedBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static List<Book> getRandomBook() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_ALL_BOOK_SQL);
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getTodayBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static String getMaxID() {
        try {
            String sql = "select MAX(BookID) from Book";
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String maxID = rs.getString(1);
                return maxID;
            }
        } catch (SQLException ex) {
            System.out.println("Query get MAXID error!" + ex.getMessage());
        }
        return null;
    }

    /**
     * aaveFile
     *
     * @param id is the file name to save File
     * @param part is the part of the file that's submitted
     * @param sc is ther servlet context
     * @param path if the path of the folder that @param id will save to
     * @return the path of the file Saved
     */
    public static String saveFile(String id, Part part, ServletContext sc, String path) {
        try {
            String fileName = part.getSubmittedFileName();
            if (fileName.isEmpty()) {
                return null;
            }
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            id += fileName.substring(fileName.indexOf('.'), fileName.length());
            String absoluteFilepath = sc.getRealPath("/" + path);
            //D:\learning in FPT\Tools\UploadFile\build\web\images
            String webFilepath = absoluteFilepath.replace("\\build", "");
//            Tools.getFolderUpload(absoluteFilepath);
//            Tools.getFolderUpload(webFilepath);
//            System.out.println(id + "\n-" + absoluteFilepath + id + "\n-" + webFilepath + id);
//        C:\Users\Admin\Documents\Github2\prj301-se1609-05\BOOKZ\Bookz\build\web\assets\images\bookCover\
            part.write(absoluteFilepath + id);
            part.write(webFilepath + id);
            System.out.println("path: " + path + id);
            return path + id;
        } catch (IOException ex) {
            System.out.println("Error Cant Save to " + path + id + "! " + ex.getMessage());
        }
        return null;
    }

    /**
     * "INSERT INTO Book(" + "BookID, Title, Author, Publisher, Language, Cover,
     * Description, NoDownload, " + "FilePDF, FileEpub, IsAccepted, DateUpload,
     * LastDateEdit, MemberUpload, " + "MemberLastEdit, CategoryID) " + "VALUES
     * (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
     */
    public static boolean insertBookForUser(String id, String memberID, String cover, String pdf, String epub, String title, String author, String publisher, String language, String category, String description) {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(INSERT_BOOK_USER_SQL);
            if (id != null && (pdf != null || epub != null)) {
                ps.setString(1, id);
                ps.setString(2, title.trim());
                ps.setString(3, author.trim());
                ps.setString(4, publisher.trim());
                ps.setString(5, language);
                ps.setString(6, cover);
                ps.setString(7, description.trim());
                ps.setInt(8, 0);
                ps.setString(9, pdf);
                ps.setString(10, epub);
                ps.setInt(11, 0);
                ps.setString(12, Tools.getTodayDate());
                ps.setString(13, null);
                ps.setString(14, memberID);
                ps.setString(15, null);
                ps.setString(16, category);
                ps.executeUpdate();
            } else {
                throw new Exception("PDF and EPUB IS NULL");
            }
            return true;
        } catch (Exception ex) {
            System.out.println("Query Insert Book For User error!" + ex.getMessage());
        }
        return false;
    }

    public static Book getBookByID(String bookID) {
        String query = "SELECT * from Book "
                + " WHERE BookID = ?"
                + " AND isDeleted = 0";
        try {
            Connection conn = new DBUtils().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, bookID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
            }
        } catch (Exception ex) {
            System.out.println("Query Get Book By ID error!" + ex.getMessage());
        }
        return null;
    }

    public static int getSumBook() {
        try {
            Connection conn = new DBUtils().getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_COUNT_BOOK_SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Query Get Sum Book error!" + e.getMessage());
        }
        return 0;
    }

    public static List<Book> getBookByCategoryAndSort(String categoryID, String typeSort) {
        String sql = "SELECT BookID, Title, Author, Publisher, "
                + "Language, Cover, Description, NoDownload, FilePDF, FileEpub, isAccepted, "
                + "DateUpload, LastDateEdit, MemberUpload, MemberLastEdit, CategoryID "
                + " FROM Book "
                + " WHERE isAccepted = 1 ";
        if (categoryID != null) {
            if (!categoryID.isEmpty()) {
                sql += " and CategoryID = ? ";
            }
        }
        if (typeSort == null) {
            typeSort = "NoDownload";
        }
        sql += " ORDER BY " + typeSort + " DESC ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            if (categoryID != null) {
                if (!categoryID.isEmpty()) {
                    ps.setString(1, categoryID);
                }
            }
            ResultSet rs = ps.executeQuery();
            List<Book> list = new ArrayList<Book>();
            while (rs.next()) {
                Book book = new Book(rs.getString("BookID"), rs.getString("Title"), rs.getString("Author"),
                        rs.getString("Publisher"), rs.getString("Language"), rs.getString("Cover"),
                        rs.getString("Description"), rs.getInt("NoDownload"), rs.getString("FilePDF"),
                        rs.getString("FileEpub"), rs.getBoolean("isAccepted"), rs.getDate("DateUpload"),
                        rs.getDate("LastDateEdit"), rs.getString("MemberUpload"), rs.getString("MemberLastEdit"),
                        rs.getString("CategoryID"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getBookByCategoryAndSort Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static boolean acceptBook(String id, boolean accept) {
        String SQL = UPDATE_NOT_ACCEPT;
        if (accept) {
            SQL = UPDATE_ACCEPT;
        }
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            if (id != null) {
                ps.setString(1, id);
                ps.executeUpdate();
            }
            return true;
        } catch (Exception ex) {
            System.out.println("Query " + (accept ? "" : "Stop") + " Accept Book For User error!" + ex.getMessage());
        }
        return false;
    }

    public static boolean deleteBook(String id) {
        String SQL = UPDATE_DELETE;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            if (id != null) {
                ps.setString(1, id);
                ps.executeUpdate();
            }
            return true;
        } catch (Exception ex) {
            System.out.println("Query Delete Book For User error!" + ex.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(getBookByID("B00000").getBookID());
    }

    public static void updateBook(Book book) {
        String SQL = "UPDATE [dbo].[Book]\n"
                + "   SET \n"
                + "      [Title] = ?\n"
                + "      ,[Author] = ?\n"
                + "      ,[Publisher] = ?\n"
                + "      ,[Language] = ?\n"
                + "      ,[Cover] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[NoDownload] = ?\n"
                + "      ,[IsAccepted] = ?\n"
                + "      ,[DateUpload] = ?\n"
                + "      ,[LastDateEdit] = ?\n"
                + "      ,[MemberUpload] = ?\n"
                + "      ,[MemberLastEdit] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + " WHERE [BookID] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            int i = 1;
            ps.setString(i++, book.getTitle());
            ps.setString(i++, book.getAuthor());
            ps.setString(i++, book.getPublisher());
            ps.setString(i++, book.getLanguage());
            ps.setString(i++, book.getCover());
            ps.setString(i++, book.getDescription());
            ps.setInt(i++, book.getNoDownloads());
            ps.setBoolean(i++, book.isIsAccepted());
            ps.setTimestamp(i++, Tools.dateToTimestamp(book.getDateUpload()));
            ps.setTimestamp(i++, Tools.dateToTimestamp(book.getLastDateEdit()));
            ps.setString(i++, book.getMemberUpload());
            ps.setString(i++, book.getMemberLastEdit());
            ps.setString(i++, book.getCategoryID());
            ps.setString(i++, book.getBookID());
            ps.executeUpdate();
            System.out.println("Update Book Success");
        } catch (Exception ex) {
            System.out.println("Query Update Book  error!" + ex.getMessage());
        }
    }

    public static boolean updateBook(String id, String title, String author, String publisher,
            String language, String category, String description, String cover, String pdf, String epub, String memberid) {
        String SQL = "UPDATE Book "
                + "	SET Title = ?,Author = ?,Publisher = ?, Language = ?, CategoryID = ? ,Description = ?, Cover = ?"
                + "     ,FilePDF = ? , FileEpub = ?"
                + "     ,MemberLastEdit = ? , LastDateEdit = getdate()"
                + "	WHERE BookID = ?";
        try {
            if (cover == null) {
                SQL = SQL.replace(", Cover = ?", "");
            }
            if (pdf == null) {
                SQL = SQL.replace(",FilePDF = ? ", "");

            }
            if (epub == null) {
                SQL = SQL.replace(", FileEpub = ?", "");

            }
            System.out.println(id + title + author + publisher + cover + memberid);
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            if (id != null) {
                int i = 1;
                ps.setString(i++, title);
                ps.setString(i++, author);
                ps.setString(i++, publisher);
                ps.setString(i++, language);
                ps.setString(i++, category);
                ps.setString(i++, description);
                if (cover != null) {
                    ps.setString(i++, cover);
                }
                if (pdf != null) {
                    ps.setString(i++, pdf);
                }
                if (epub != null) {
                    ps.setString(i++, epub);
                }
                ps.setString(i++, memberid);
                ps.setString(i++, id);
                ps.executeUpdate();
                System.out.println("Update Book Success");
            }
            return true;
        } catch (Exception ex) {
            System.out.println("Query Update Book For User error!" + ex.getMessage());
        }
        return false;
    }

    public static List<BookProfile> getProfileBookDownload(String memberID) {
        String sql = "SELECT Download.BookID, Cover, Title, Author, DateDownload"
                + " FROM Download"
                + " LEFT JOIN Book"
                + " ON Download.BookID = Book.BookID"
                + " WHERE MemberID = ? AND IsAccepted = 1 AND isDeleted = 0 "
                + " ORDER BY DateDownload DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, memberID);
            ResultSet rs = ps.executeQuery();
            List<BookProfile> list = new ArrayList<BookProfile>();
            while (rs.next()) {
                BookProfile book = new BookProfile(rs.getString("BookID"), rs.getString("Cover"), rs.getString("Title"),
                        rs.getString("Author"), null, rs.getDate("DateDownload"));
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getProfileBookDownload Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static List<BookProfile> getProfileBookUpload(String memberID) {
        String sql = "SELECT BookID, Cover, Title, Author, DateUpload "
                + " FROM Book "
                + " WHERE MemberUpload = ? AND IsAccepted = 1 AND isDeleted = 0 "
                + " ORDER BY DateUpload DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, memberID);
            ResultSet rs = ps.executeQuery();
            List<BookProfile> list = new ArrayList<BookProfile>();
            while (rs.next()) {
                BookProfile book = new BookProfile(rs.getString("BookID"), rs.getString("Cover"), rs.getString("Title"),
                        rs.getString("Author"), rs.getDate("DateUpload"), null);
                list.add(book);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getProfileBookUpload Query Error!" + ex.getMessage());
        }
        return null;
    }

}
