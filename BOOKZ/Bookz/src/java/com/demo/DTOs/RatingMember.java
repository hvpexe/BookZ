/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demo.DTOs;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class RatingMember {
//rating
    private Rating rating;
//member
    private Member member;

    public RatingMember(Rating rating, Member member) {
        this.rating = rating;
        this.member = member;
    }

    public RatingMember() {
    }
    public Rating getRating() {
        return rating;
    }

    public void setRating(Rating rating) {
        this.rating = rating;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }
    
}
