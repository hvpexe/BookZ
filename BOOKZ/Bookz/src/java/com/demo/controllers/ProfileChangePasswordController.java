/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.controllers;

import com.demo.DAOS.MemberDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PhuHV
 */
public class ProfileChangePasswordController extends HttpServlet {

    private static final String ERROR = "profileChangePassword.jsp";
    private static final String SUCCESS = "profileChangePassword.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String memberID = request.getParameter("memberID");
            String passwordOld = request.getParameter("passwordOld");
            String passwordNew = request.getParameter("passwordNew");
            String passwordNewVerify = request.getParameter("passwordNewVerify");

            if (!MemberDAO.checkOldPassword(memberID, passwordOld)) {
                request.setAttribute("PASSWORD_ERROR", "Old password wrong!");
            } else if (passwordNew.length() < 8) {
                request.setAttribute("PASSWORD_ERROR", "password must be at least 8 characters!");
            } else if (!passwordNew.equals(passwordNewVerify)) {
                request.setAttribute("PASSWORD_ERROR", "Confirmation mismatched");
            } else if (!passwordNew.equals(passwordNewVerify)) {
                request.setAttribute("PASSWORD_ERROR", "Confirmation mismatched");
            } else if (MemberDAO.changePassword(memberID, passwordNew)) {
                request.setAttribute("PASSWORD_SUCCESS", "Change password successfully");
                url = SUCCESS;
            }

        } catch (Exception e) {
            System.out.println("Error at ProfileChangePasswordController: " + e.toString());
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
