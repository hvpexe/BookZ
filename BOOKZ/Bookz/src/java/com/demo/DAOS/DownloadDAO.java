/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demo.DAOS;

import com.demo.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class DownloadDAO {

    public static boolean insertDownload(String bookID, String memberID) {
        String SQL_InsertDownload = "INSERT INTO Download\n"
                + " (DateDownload,BookID,MemberID)\n"
                + " VALUES (?,?,?)";
        String SQL_CheckDownloaded = " SELECT * FROM Download\n"
                + " WHERE MemberID = ? AND BookID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(SQL_CheckDownloaded);
            try{
                ps.setString(1, memberID);
                ps.setString(2, bookID);
                
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    System.out.println("User Had Downloaded The Book");
                    return false;
                }
            }catch (Exception e){
                System.out.println("insertDownload Select Error! "+ e.getMessage());
            }
             ps = conn.prepareStatement(SQL_InsertDownload);
            ps.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            ps.setString(2, bookID);
            ps.setString(3, memberID);
            ps.executeUpdate();
            System.out.println("Insert Download Success");
            return true;
        } catch (Exception ex) {
            System.out.println("Query INSERT DOWNLOAD error!" + ex.getMessage());
        }
        return false;
    }

}
