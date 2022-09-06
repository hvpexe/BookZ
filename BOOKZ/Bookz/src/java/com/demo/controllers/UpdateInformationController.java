/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.controllers;

import com.demo.DAOS.MemberDAO;
import com.demo.DTOs.Member;
import com.demo.utils.Tools;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/UploadFileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class UpdateInformationController extends HttpServlet {

    private static final String ERROR = "profileInformationEdit.jsp";
    private static final String SUCCESS = "profileInformation.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Member member = null;
            Member memberLogin = (Member) session.getAttribute("login");
            
            String memberID = request.getParameter("memberID");
            member = MemberDAO.getUserByID(memberID);
            String firstname = Tools.toUTF8(request.getParameter("firstname"));
            String lastname = Tools.toUTF8(request.getParameter("lastname"));
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String gender = request.getParameter("gender");
            Part part = request.getPart("avatar");
            member.setFirstname(firstname);
            member.setLastname(lastname);
            member.setBirthday(birthday);
            member.setGender(gender);
            String avatar = null;
            if (!part.getSubmittedFileName().isEmpty()) {
                avatar = MemberDAO.saveAvatar(member.getMemberID(), part, getServletContext());
            }
            if (avatar != null) {
                member.setAvatar(avatar);
            }
            System.out.println("avatar:"+avatar);
            if (MemberDAO.updateInfo(member)) {
                session.setAttribute("login", member);
                url = SUCCESS;
            }
        } catch (Exception e) {
            System.out.println("Error at UpdateInformationController: " + e.toString());
        } finally {
            response.sendRedirect(url);
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
