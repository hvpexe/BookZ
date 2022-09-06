/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.DTOs;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Book {

    public static final String COVER_PATH = "assets/images/bookCover/";
    public static final String PDF_PATH = "assets/pdfs/";
    public static final String EPUB_PATH = "assets/epubs/";

    private String bookID;
    private String title;
    private String author;
    private String publisher;
    private String language;
    private String cover;
    private String description;
    private int noDownloads;
    private String filePDF;
    private String fileEpub;
    private boolean isAccepted;
    private Date dateUpload;
    private Date lastDateEdit;

    private String memberUpload;
    private String memberLastEdit;

    private String categoryID;

    public Book() {
    }

    public Book(String bookID, String title, String author, String publisher, String language, String cover, String description, int noDownloads, String filePDF, String fileEpub, boolean isAccepted, Date dateUpload, Date lastDateEdit, String memberUpload, String memberLastEdit, String categoryID) {
        this.bookID = bookID;
        this.title = title;
        this.author = author;
        this.publisher = publisher;
        this.language = language;
        this.cover = cover;
        this.description = description;
        this.noDownloads = noDownloads;
        this.filePDF = filePDF;
        this.fileEpub = fileEpub;
        this.isAccepted = isAccepted;
        this.dateUpload = dateUpload;
        this.lastDateEdit = lastDateEdit;
        this.memberUpload = memberUpload;
        this.memberLastEdit = memberLastEdit;
        this.categoryID = categoryID;
    }
    
    

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
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

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNoDownloads() {
        return noDownloads;
    }

    public void setNoDownloads(int noDownloads) {
        this.noDownloads = noDownloads;
    }

    public String getFilePDF() {
        return filePDF;
    }

    public void setFilePDF(String filePDF) {
        this.filePDF = filePDF;
    }

    public String getFileEpub() {
        return fileEpub;
    }

    public void setFileEpub(String fileEpub) {
        this.fileEpub = fileEpub;
    }

    public boolean isIsAccepted() {
        return isAccepted;
    }

    public void setIsAccepted(boolean isAccepted) {
        this.isAccepted = isAccepted;
    }

    public Date getDateUpload() {
        return dateUpload;
    }

    public void setDateUpload(Date dateUpload) {
        this.dateUpload = dateUpload;
    }

    public Date getLastDateEdit() {
        return lastDateEdit;
    }

    public void setLastDateEdit(Date lastDateEdit) {
        this.lastDateEdit = lastDateEdit;
    }

    public String getMemberUpload() {
        return memberUpload;
    }

    public void setMemberUpload(String memberUpload) {
        this.memberUpload = memberUpload;
    }

    public String getMemberLastEdit() {
        return memberLastEdit;
    }

    public void setMemberLastEdit(String memberLastEdit) {
        this.memberLastEdit = memberLastEdit;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

}
