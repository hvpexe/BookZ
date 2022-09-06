/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.controllers;

import com.demo.DAOS.BookDAO;
import com.demo.DAOS.CategoryDAO;
import com.demo.DTOs.Book;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PhuHV
 */

@WebServlet(name = "CategorySectionController", urlPatterns = {"/CategorySectionController"})
public class CategorySectionController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "categorySection.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action == null || action.equals("Most Download") || action.equals("NoDownload")) {
                action = "NoDownload";
            } else if (action.equals("Recently Added") || action.equals("DateUpload")) {
                action = "DateUpload";
            }
            String categoryID = request.getParameter("cateid");
            String categoryName = null;
            List<Book> list = BookDAO.getBookByCategoryAndSort(categoryID, action);
            if (categoryID == null || categoryID.isEmpty()) {
                categoryName = "All Categories";
            } else {
                categoryName = CategoryDAO.getCategoryName(categoryID);
            }
            request.setAttribute("BOOK_BY_CATEGORY", list);
            request.setAttribute("CATEGORY_NAME", categoryName);
            url = SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
