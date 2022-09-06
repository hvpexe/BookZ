/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.DTOs;

import java.util.Date;

/**
 *
 * @author PhuHV
 */
public class BookProfile {

    private String bookID;
    private String cover;
    private String title;
    private String author;
    private Date dateUpload;
    private Date dateDownload;

    public BookProfile() {
    }

    public BookProfile(String bookID, String cover, String title, String author, Date dateUpload, Date dateDownload) {
        this.bookID = bookID;
        this.cover = cover;
        this.title = title;
        this.author = author;
        this.dateUpload = dateUpload;
        this.dateDownload = dateDownload;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getDateUpload() {
        return dateUpload;
    }

    public void setDateUpload(Date dateUpload) {
        this.dateUpload = dateUpload;
    }

    public Date getDateDownload() {
        return dateDownload;
    }

    public void setDateDownload(Date dateDownload) {
        this.dateDownload = dateDownload;
    }

}