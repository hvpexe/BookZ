/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demo.DAOS;

import com.demo.DTOs.RatingMember;
import com.demo.DTOs.Book;
import com.demo.DTOs.Member;
import com.demo.DTOs.Rating;
import com.demo.DTOs.RatingProfile;
import com.demo.DTOs.RatingStarCount;
import com.demo.utils.DBUtils;
import com.demo.utils.Tools;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RatingDAO {

    public static List<RatingProfile> getRatingProfileList(String memberID) {
        String sql = "SELECT R.RatingID, R.Comment, R.Star, R.DateRating, B.BookID, B.Cover "
                + " FROM Rating R "
                + " LEFT JOIN Book B "
                + " ON R.BookID = B.BookID "
                + " WHERE R.Deleted = 0 AND R.MemberID = ? "
                + " ORDER BY R.DateRating DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, memberID);
            List<RatingProfile> list = new ArrayList<RatingProfile>();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RatingProfile rating = new RatingProfile(
                        rs.getString("RatingID"),
                        rs.getString("Comment"),
                        rs.getInt("Star"),
                        rs.getDate("DateRating"),
                        rs.getString("BookID"),
                        rs.getString("Cover"));
                list.add(rating);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getRatingProfileList Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static RatingStarCount getStars(String id) {
        String SQL = "SELECT Star FROM Rating "
                + " WHERE Deleted = 0 AND BookID = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, id);
            int s, s1 = 0, s2 = 0, s3 = 0, s4 = 0, s5 = 0;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s = rs.getInt(1);
                s1 = 1 == s ? s1 + 1 : s1;
                s2 = 2 == s ? s2 + 1 : s2;
                s3 = 3 == s ? s3 + 1 : s3;
                s4 = 4 == s ? s4 + 1 : s4;
                s5 = 5 == s ? s5 + 1 : s5;
            }
            RatingStarCount rsc = new RatingStarCount(s1, s2, s3, s4, s5);
            return rsc;
        } catch (SQLException ex) {
            System.out.println("get Query Error!" + ex.getMessage());
        }
        return null;
    }

    /**
     * SELECT R.*,M.* FROM Rating R JOIN Member B ON B.MemberID= R.MemberID
     * WHERE BookID = ?
     */
    public static List<RatingMember> getCommentFromBook(String bookid) {
        String SQL = "SELECT R.*,M.* FROM Rating R JOIN Member M ON M.MemberID= R.MemberID "
                + " WHERE BookID = ?"
                + " AND Deleted = 0"
                + " ORDER BY DateRating DESC";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, bookid);
            List<RatingMember> list = new ArrayList<>();
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RatingMember ratingMember = new RatingMember();
                int i = 0;
                ratingMember.setRating(new Rating(
                        rs.getString(++i),
                        rs.getInt(++i),
                        rs.getString(++i),
                        rs.getDate(++i),
                        rs.getDate(++i),
                        rs.getString(++i),
                        rs.getString(++i))
                );
                i++;
                ratingMember.setMember(new Member(
                        rs.getString(++i),
                        rs.getString(++i),
                        rs.getString(++i),
                        rs.getString(++i),
                        rs.getString(++i),
                        rs.getString(++i),
                        rs.getString(++i),
                        rs.getDate(++i),
                        rs.getInt(++i),
                        rs.getString(++i)));
                list.add(ratingMember);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getCommentFromBook Query Error!" + ex.getMessage());
        }
        return null;
    }

    public static boolean insertComment(String memberID, String bookID, int star, String comment) {

        String maxIDSQL = "SELECT MAX(RatingID) as ID FROM Rating ";
        String SQL = " INSERT INTO Rating"
                + " (RatingID,Star,Comment,DateRating,LastDateEdit,BookID,MemberID,Deleted) "
                + " VALUES "
                + " (?,?,?,?,?,?,?,0)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(maxIDSQL);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String ratingID = rs.getString(1);
            int i = 0;
            ratingID = Tools.newIDformat(ratingID);
            ps = conn.prepareStatement(SQL);
            ps.setString(++i, ratingID);//1
            ps.setInt(++i, star);//2
            ps.setString(++i, comment);//3
            ps.setTimestamp(++i, Tools.getCurrentDateTime());//4
            ps.setString(++i, null);//5
            ps.setString(++i, bookID);//6
            ps.setString(++i, memberID);//7
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println("insertComment Query Error!" + ex.getMessage());
        }
        return false;
    }

    public static boolean deleteRating(String ratingID) {

        String SQL = "UPDATE Rating "
                + " SET Deleted = 1 "
                + " WHERE RatingID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, ratingID);

            if (ps.executeUpdate() > 0) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("deleteRating Query Error!" + ex.getMessage());
        }
        return false;
    }

    public static Rating getCommentByID(String ratingid) {
        String SQL = "SELECT * FROM Rating \n"
                + " WHERE RatingID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, ratingid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int i = 0;
                Rating rate = new Rating(
                        rs.getString(++i),
                        rs.getInt(++i),
                        rs.getString(++i),
                        rs.getDate(++i),
                        rs.getDate(++i),
                        rs.getString(++i),
                        rs.getString(++i),
                        rs.getBoolean(++i)
                );
                return rate;
            }
        } catch (Exception ex) {
            System.out.println("getCommentByID Query Error!" + ex.getMessage());

        }
        return null;
    }

    public static void updateComment(Rating comment) {
        String SQL = "UPDATE [dbo].[Rating]\n"
                + "   SET [Star] = ?\n"
                + "      ,[Comment] = ?\n"
                + "      ,[DateRating] = ?\n"
                + "      ,[LastDateEdit] = ?\n"
                + "      ,[BookID] = ?\n"
                + "      ,[MemberID] = ?\n"
                + "      ,[Deleted] = ?\n"
                + " WHERE [RatingID] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            int i = 1;
            ps.setInt(1, comment.getStar()); //1
            ps.setString(2, comment.getComment());//2
            ps.setDate(3, comment.getDateRating());//3
            ps.setDate(4, comment.getLastDateEdit());//4
            ps.setString(5, comment.getBookID());//5
            ps.setString(6, comment.getMemberID());//6
            ps.setBoolean(7, comment.isDeleted());//7
            ps.setString(8, comment.getRatingID());//8
            ps.executeUpdate();
            System.out.println("Update Rating Success");
        } catch (Exception ex) {
            System.out.println("Query Update Rating  error!" + ex.getMessage());
        }
    }
}
