/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.DAOS;

import com.demo.DTOs.Book;
import com.demo.DTOs.ReportBook;
import com.demo.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PhuHV
 */
public class ReportBookDAO {

    private static final String SELECT_REPORTED_BOOK = "SELECT rb.* FROM ReportBook RB WHERE Detail like ? "
            + " ORDER BY DateReport DESC ";

    public static List<ReportBook> getReportBookList(String search) {
        String SQL = SELECT_REPORTED_BOOK;
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            search = "%" + (search == null ? "" : search) + "%";
            ps.setString(1, search);
            ResultSet rs = ps.executeQuery();
            List<ReportBook> list = new ArrayList<>();
            while (rs.next()) {
                ReportBook obj = new ReportBook(rs.getInt(1), rs.getTimestamp(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                String bookid = rs.getString(6);
                String memberid = rs.getString(7);
                obj.setMemberID(memberid);
                obj.setBookID(bookid);
                obj.setMember(MemberDAO.getUserByID(memberid));
                obj.setBook(BookDAO.getBookByID(bookid));
                list.add(obj);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("get User Report Book Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static boolean createReportBook(ReportBook reportbook) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO ReportBook(DateReport, ReportType, Detail, ReportState, BookID, MemberID) VALUES "
                        + " (?, ?, ?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setTimestamp(1, reportbook.getDateReport());
                ps.setString(2, reportbook.getReportType());
                ps.setString(3, reportbook.getDetail());
                ps.setString(4, reportbook.getReportState());
                ps.setString(5, reportbook.getBookID());
                ps.setString(6, reportbook.getMemberID());
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("Error at createReportBook: " + e.toString());
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }

    public static boolean updateStateReport(int id, String stateReport) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE ReportBook"
                        + " set ReportState = ?"
                        + " WHERE ReportID = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, stateReport);
                ps.setInt(2, id);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("Error at updateStateReport: " + e.toString());
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }
}
