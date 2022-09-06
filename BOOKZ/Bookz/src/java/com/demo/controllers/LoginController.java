/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.controllers;

import com.demo.DAOS.MemberDAO;
import com.demo.DTOs.Member;
import com.demo.utils.Tools;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
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
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = (String) request.getParameter("action");
        if (action.equals("login")) {
            String email;
            String password;
            email = request.getParameter("email");
            password = request.getParameter("password");

            Member member = new MemberDAO().login(email, password);
            HttpSession session = request.getSession();

            if (member != null&& !member.getRole().equals("banned")) {
                session.setAttribute("login", member);
                System.out.println("avatar:" + member.getAvatar() + ",");
            } else {
                session.setAttribute("fail_login", "Wrong Username or Password");
                if (email.equals("")) {
                    session.setAttribute("fail_login", "Mail Empty");
                }
                if(member != null&& member.getRole().equals("banned")) {
                    session.setAttribute("fail_login", "User Banned");
                }
            }
            response.sendRedirect("home.jsp");
        }
        if (action.equals("register")) {
            String email = request.getParameter("email");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            firstname = Tools.toUTF8(firstname);
            lastname = Tools.toUTF8(lastname);
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");
            Part part = request.getPart("avatar");
            String gender = request.getParameter("gender");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            Member member = null;
            Date currentDate = new Date(System.currentTimeMillis());
            if (MemberDAO.checkDuplicateEmail(email)) {
                request.setAttribute("fail_register", "Email alreadly exist!");
            } else if (password.length() < 8) {
                request.setAttribute("fail_register", "password must be at least 8 characters!");
            } else if (!cpassword.equals(password)) {
                request.setAttribute("fail_register", "Confirmation mismatched");
            } else if (birthday.after(currentDate)) {
                request.setAttribute("fail_register", "You cannot enter a date in the future!");
            } else {
                String newID = MemberDAO.getMaxID();
                String avatar = MemberDAO.saveAvatar("img_" + newID, part, getServletContext());
                MemberDAO.insertUser(newID, email, password, avatar, gender, birthday, firstname, lastname);
                member = MemberDAO.login(email, password);
                request.setAttribute("login", member);
            }
            request.getRequestDispatcher("home.jsp").forward(request, response);
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
