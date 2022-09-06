/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demo.utils;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class Tools {

    public static String newIDformat(String maxID) {
        String s = maxID.split("\\d")[0];
        String ss = maxID.replace(s, "");
        System.out.println("---" + s + ss);
        int newID = Integer.parseInt(ss);
        newID++;
        int seperator = ("" + maxID.substring(s.length())).length();
        if ((newID + "").length() >= seperator) {
            seperator = (newID + "").length();
        }
        String format = String.format(s + "%0" + seperator + "d", newID);
        return format;
    }

    public static String toUTF8(String firstname) {
        try {
            String result = URLEncoder.encode(firstname, "ISO-8859-1");
            result = URLDecoder.decode(result, "UTF-8");
            return result;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public static File getFolderUpload(String filePath) {
        File folderUpload = new File(filePath);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }

    public static String getTodayDate() {
        return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }
    public static Timestamp getCurrentDateTime() {
        return new Timestamp(System.currentTimeMillis());
    }
    public static Timestamp dateToTimestamp(Date date) {
        return new Timestamp(date.getTime());
    }
    public static void main(String[] args) {
        PrintWriter pw = new PrintWriter(System.out, true);
        pw.println(toUTF8("Nguá»?n"));
    }
}
