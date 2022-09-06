/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.DTOs;

import java.sql.Date;

/**
 *
 * @author PhuHV
 */
public class RatingProfile {
    private String ratingID;
    private String comment;
    private int star;
    private Date dateRating;
    private String bookID;
    private String cover;

    public RatingProfile() {
    }

    public RatingProfile(String ratingID, String comment, int star, Date dateRating, String bookID, String cover) {
        this.ratingID = ratingID;
        this.comment = comment;
        this.star = star;
        this.dateRating = dateRating;
        this.bookID = bookID;
        this.cover = cover;
    }

    public String getRatingID() {
        return ratingID;
    }

    public void setRatingID(String ratingID) {
        this.ratingID = ratingID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public Date getDateRating() {
        return dateRating;
    }

    public void setDateRating(Date dateRating) {
        this.dateRating = dateRating;
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
    
    
}
