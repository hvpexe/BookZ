/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.DAOS;

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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
public class MemberDAO {

    private static final String SELECT_USER_SQL = "SELECT MemberID, Email, Password, Avatar, "
            + " Role, FirstName, LastName, Birthday, noUploadedBook, Gender\n"
            + " FROM Member\n";
    private static final String SELECT_USER_ID_SQL = "SELECT MemberID, Email, Password, Avatar, "
            + " Role, FirstName, LastName, Birthday, noUploadedBook, Gender\n"
            + " FROM Member\n" + " WHERE MemberID = ? ";
    private static final String SELECT_USER_EMAIL_SQL = "SELECT MemberID, Email, Password, Avatar, "
            + " Role, FirstName, LastName, Birthday, noUploadedBook, Gender\n"
            + " FROM Member\n"
            + " WHERE Email = ? ";
    private static final String SELECT_USER_WITH_ROLE_SQL = "SELECT * FROM (SELECT *\n"
            + " ,(FirstName+' '+ LastName )AS FULLNAME_1\n"
            + " ,(LastName +' '+ FirstName)AS FULLNAME_2 FROM Member) M\n"
            + " WHERE (M.FULLNAME_1 LIKE ? or M.FULLNAME_2 LIKE ?)"
            + " AND role = ? ";

    private static final String USER_COUNT_SQL = "SELECT COUNT(MemberID) "
            + " FROM Member";
    private static final String USER_RANKING_SQL = "SELECT TOP 10 MemberID, Email, Password, Avatar, "
            + " Role, FirstName, LastName, Birthday, noUploadedBook, Gender\n"
            + " FROM Member\n"
            + " ORDER BY noUploadedBook DESC";
    private static final String LOGIN_SQL = SELECT_USER_EMAIL_SQL + " AND Password = ? ";
    private static final String MAXID_SQL = " SELECT MAX(MemberID) ID_MAX FROM Member ";
    private static final String INSERT_USER = "INSERT INTO [Member] ([MemberID],[Email],[Password]\n"
            + "           ,[Avatar],[Role],[FirstName],[LastName]\n"
            + "           ,[NoUploadedBook],[Gender],[Birthday]) VALUES\n"
            + "           (?,?,?,?,?,?,?,?,?,?);";

    public static Member login(String email, String password) {

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(LOGIN_SQL);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Member userDTO = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getDate(8), rs.getInt(9), rs.getString(10));
                return userDTO;

            }
        } catch (SQLException ex) {
            System.out.println("Query Member Login error!" + ex.getMessage());
        }
        return null;
    }

    public static boolean checkDuplicateEmail(String email) {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_USER_SQL);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("checkDuplicateEmail error!" + ex.getMessage());
        }
        return false;
    }

    public static String getMaxID() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(MAXID_SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String maxID = Tools.newIDformat(rs.getString(1));
                return maxID;
            }
        } catch (SQLException ex) {
            System.out.println("Query get MAXID error!" + ex.getMessage());
        }
        return null;
    }

    public static void insertUser(String id, String email, String password, String avatar, String gender, Date birthday, String firstname, String lastname) {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(INSERT_USER);
            if (id != null) {
                ps.setString(1, id);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, avatar);
                ps.setString(5, "user");
                ps.setString(6, firstname);
                ps.setString(7, lastname);
                ps.setInt(8, 0);
                ps.setString(9, gender);
                ps.setDate(10, birthday);
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            System.out.println("Query Insert Member error!" + ex.getMessage());
        }
    }

    public static String saveAvatar(String id, Part part, ServletContext sc) {

        try {
            String fileName = part.getSubmittedFileName();
            if (fileName.isEmpty()) {
                return null;
            }
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            id += fileName.substring(fileName.indexOf('.'), fileName.length());
            String absoluteFilepath = sc.getRealPath("/" + Member.IMG_PATH);
//            System.out.println(absoluteFilepath);
            //D:\learning in FPT\Tools\UploadFile\build\web\images
            String webFilepath = absoluteFilepath.replace("\\build", "");
            Tools.getFolderUpload(absoluteFilepath);
            Tools.getFolderUpload(webFilepath);
//        D:\learning in FPT\Tools\UploadFile\web\assets\images
            part.write(absoluteFilepath + id);
            part.write(webFilepath + id);
            return id;
        } catch (IOException ex) {
            System.out.println("Error Cant Save Avatar!" + ex.getMessage());
        }
        return null;
    }

    public static String replaceAvatar(String id, Part part, ServletContext sc) {
        try {
            String fileName = part.getSubmittedFileName();
            if (fileName.isEmpty()) {
                return null;
            }
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            id += fileName.substring(fileName.indexOf('.'), fileName.length());
            String absoluteFilepath = sc.getRealPath("/" + Member.IMG_PATH);
//            System.out.println(absoluteFilepath);
            //D:\learning in FPT\Tools\UploadFile\build\web\images
            String webFilepath = absoluteFilepath.replace("\\build", "");
            Tools.getFolderUpload(absoluteFilepath);
            Tools.getFolderUpload(webFilepath);
//        D:\learning in FPT\Tools\UploadFile\web\assets\images
            part.write(absoluteFilepath + id);
            part.write(webFilepath + id);
            return id;
        } catch (IOException ex) {
            System.out.println("Error Cant Replace Avatar!" + ex.getMessage());
        }
        return null;
    }

    public static List<Member> getUserRanking() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(USER_RANKING_SQL);
            ResultSet rs = ps.executeQuery();
            List<Member> list = new ArrayList<>();
            while (rs.next()) {
                Member userDTO = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getDate(8), rs.getInt(9), rs.getString(10));
                list.add(userDTO);
            }
            return list;
        } catch (Exception e) {
            System.out.println("getUserRanking Query Error! " + e.getMessage());
        }
        return null;
    }

    public static int getSumMember() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(USER_COUNT_SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("getUserRanking Query Error! " + e.getMessage());
        }
        return 0;
    }
    public static final String Role_USER = "user";
    public static final String Role_ADMIN = "admin";
    public static final String Role_BANNED = "banned";
    public static final String Role_ALL = "ALL";

    /**
     * SELECT * FROM (SELECT * ,(FirstName+' '+ LastName )AS FULLNAME_1
     * ,(LastName +' '+ FirstName)AS FULLNAME_2 FROM Member) M WHERE
     * (M.FULLNAME_1 LIKE '%%' or M.FULLNAME_2 LIKE '%%')
     *
     * @return List of member who have the same role and search value
     */
    public static List<Member> getUserRole(String role, String search) {
        String SQL = SELECT_USER_WITH_ROLE_SQL;
        if (role.equals(Role_ALL)) {
            SQL = SQL.replace(" AND role = ? ", "");
        } 
        System.out.println(SQL);
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL);
            int i = 1;
            search = "%" + (search != null ? search : "") + "%";
            ps.setString(i++, search);
            ps.setString(i++, search);
            if (!role.equals(Role_ALL)) {
                ps.setString(i++, role);
            }
            ResultSet rs = ps.executeQuery();
            List<Member> list = new ArrayList<>();
            while (rs.next()) {
                Member obj = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getDate(8), rs.getInt(9), rs.getString(10));
                list.add(obj);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("getUserRole Query Error!" + ex.getMessage());
        }
        return null;
    }
    

    public static boolean changePassword(String memberID, String password) {
        String sql = "UPDATE Member "
                + " SET Password = ?"
                + " WHERE MemberID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, memberID);
            boolean check = ps.executeUpdate() > 0;
            if (check) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error at changePassword: " + e.toString());
        }
        return false;
    }

    public static boolean checkOldPassword(String memberID, String password) {
        String sql = "SELECT MemberID "
                + " FROM Member "
                + " WHERE MemberID = ? AND Password = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, memberID);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error at checkOldPassword: " + e.toString());
        }
        return false;
    }

    public static boolean updateInfo(Member member) {
        String sql = "UPDATE [dbo].[Member]\n"
                + "   SET [Email] = ?\n"
                + "      ,[Password] = ?\n"
                + "      ,[Avatar] = ?      \n"
                + "	  ,[Role] = ?\n"
                + "      ,[FirstName] = ?\n"
                + "      ,[LastName] = ?\n"
                + "      ,[Birthday] = ?\n"
                + "      ,[NoUploadedBook] = ?\n"
                + "      ,[Gender] = ?\n"
                + " WHERE [MemberID] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            int i = 1;
            System.out.println(member.getAvatar());
            ps.setString(i++, member.getEmail());
            ps.setString(i++, member.getPassword());
            ps.setString(i++, member.getAvatarToDB());
            ps.setString(i++, member.getRole());
            ps.setString(i++, member.getFirstname());
            ps.setString(i++, member.getLastname());
            ps.setDate(i++, member.getBirthday());
            ps.setInt(i++, member.getnoUploadBook());
            ps.setString(i++, member.getGender());
            ps.setString(i++, member.getMemberID());

            boolean check = ps.executeUpdate() > 0;
            if (check) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error at updateInfo: " + e.toString());
        }
        return false;
    }

    public static Member getUserByID(String memberid) {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SELECT_USER_ID_SQL);
            ps.setString(1, memberid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Member userDTO = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getDate(8), rs.getInt(9), rs.getString(10));
                return userDTO;
            }
        } catch (SQLException ex) {
            System.out.println("Query Member Login error!" + ex.getMessage());
        }
        return null;
    }
}
