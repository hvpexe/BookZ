/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.DAOS;

import com.demo.DTOs.Category;
import com.demo.DTOs.Member;
import com.demo.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    private static final String CATEGORY_SQL = "SELECT [CategoryID],[CategoryName]\n"
            + "  FROM [BookZ].[dbo].[Category]";
    private static final String CATEGORY_SEARCH_SQL = CATEGORY_SQL + " WHERE CategoryName like ?";

    public static List<Category> cateList() {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(CATEGORY_SQL);
            ResultSet rs = ps.executeQuery();
            List<Category> list = new ArrayList<Category>();
            while (rs.next()) {
                Category cateDTO = new Category(rs.getString(1), rs.getString(2));
                list.add(cateDTO);

            }
            return list;
        } catch (SQLException ex) {
            System.out.println("Query Member error!" + ex.getMessage());
        }
        return null;
    }

    public static String getCategoryName(String categoryID) {
        String sql = "SELECT CategoryName"
                + " FROM Category"
                + " WHERE CategoryID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, categoryID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("CategoryName");
            }
        } catch (SQLException ex) {
            System.out.println("Query name category error!" + ex.getMessage());
        }
        return null;
    }

    public static List<Category> cateList(String category) {
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(CATEGORY_SEARCH_SQL);
            category = category == null ? "" : category;
            ps.setString(1, "%" + category + "%");
            ResultSet rs = ps.executeQuery();
            List<Category> list = new ArrayList<Category>();
            while (rs.next()) {
                Category cateDTO = new Category(rs.getString(1), rs.getString(2));
                list.add(cateDTO);
            }
            return list;
        } catch (SQLException ex) {
            System.out.println("Query Member error!" + ex.getMessage());
        }
        return null;
    }
    public static void main(String[] args) {
        System.out.println(cateList("Tôn giáo - Triết học").get(0).getCategoryName());
    }
}
