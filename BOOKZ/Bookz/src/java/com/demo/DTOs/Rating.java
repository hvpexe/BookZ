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
public class Rating {

    private String ratingID;
    private int star;
    private String comment;
    private Date dateRating;
    private Date lastDateEdit;
    private String bookID;
    private String memberID;
    private boolean deleted;

    public Rating() {
    }

    public Rating(String ratingID, int star, String comment, Date dateRating, Date lastDateEdit, String bookID, String memberID, boolean deleted) {
        this.ratingID = ratingID;
        this.star = star;
        this.comment = comment;
        this.dateRating = dateRating;
        this.lastDateEdit = lastDateEdit;
        this.bookID = bookID;
        this.memberID = memberID;
        this.deleted = deleted;
    }
    
     public Rating(String ratingID, int star, String comment, Date dateRating, Date lastDateEdit, String bookID, String memberID) {
        this.ratingID = ratingID;
        this.star = star;
        this.comment = comment;
        this.dateRating = dateRating;
        this.lastDateEdit = lastDateEdit;
        this.bookID = bookID;
        this.memberID = memberID;
    }

    public String getRatingID() {
        return ratingID;
    }

    public void setRatingID(String ratingID) {
        this.ratingID = ratingID;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDateRating() {
        return dateRating;
    }

    public void setDateRating(Date dateRating) {
        this.dateRating = dateRating;
    }

    public Date getLastDateEdit() {
        return lastDateEdit;
    }

    public void setLastDateEdit(Date lastDateEdit) {
        this.lastDateEdit = lastDateEdit;
    }

    public String getBookID() {
        return bookID;
    }

    public void setBookID(String bookID) {
        this.bookID = bookID;
    }

    public String getMemberID() {
        return memberID;
    }

    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }

}
