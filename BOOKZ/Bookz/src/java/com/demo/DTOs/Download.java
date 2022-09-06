/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.DTOs;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Download {

    private Date dateDownload;

    private String memberID;
    private String bookID;

    public Download(Date dateDownload, String memberID, String bookID) {
        this.dateDownload = dateDownload;
        this.memberID = memberID;
        this.bookID = bookID;
    }

    public Download() {
    }

    public Date getDateDownload() {
        return dateDownload;
    }

    public void setDateDownload(Date dateDownload) {
        this.dateDownload = dateDownload;
    }

    public String getMemberID() {
        return memberID;
    }

    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }



    public Download(Date dateDownload) {
        this.dateDownload = dateDownload;
    }
}
