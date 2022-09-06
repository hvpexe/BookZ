/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.controllers;

import com.demo.DAOS.BookDAO;
import com.demo.DTOs.BookProfile;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PhuHV
 */
public class ProfileBookUploadController extends HttpServlet {

    private static final String ERROR = "profileBookUpload.jsp";
    private static final String SUCCESS = "profileBookUpload.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("check");
        String url = ERROR;
        try {
            String memberID = request.getParameter("memberID");
            System.out.println(memberID);

            List<BookProfile> list = BookDAO.getProfileBookUpload(memberID);
            if (list != null) {
                if (!list.isEmpty()) {
                    request.setAttribute("BOOK_UPLOAD_LIST", list);
                    url = SUCCESS;
                } else {
                    request.setAttribute("NO_UPLOAD", "You haven't uploaded any book yet.");
                    url = ERROR;
                }
            } else {
                request.setAttribute("NO_UPLOAD", "You haven't uploaded any book yet.");
                url = ERROR;
            }
        } catch (Exception e) {
            System.out.println("Error at profileBookUploadController: " + e.toString());
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
