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
public class Member{


    public static final String IMG_PATH = "assets/images/mainavt/";
    private static final String MAIN_AVT = "normal_avt.png";  
    private String memberID;
    private String email;
    private String password;
    private String avatar;
    private String role;
    private String firstname;
    private String lastname;
    private Date birthday;
    private int noUploadBook;
    
    private String gender;
    public Member() {
        this.avatar = MAIN_AVT;
    }
    public Member(String memberID, String email, String password, String avatar, String role,
            String firstname, String lastname, Date birthday, int noUploadBook, String gender) {
        this.memberID = memberID;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
        if (avatar == null || avatar.isEmpty()) {
            this.avatar = MAIN_AVT;
        }
        this.role = role;
        this.firstname = firstname;
        this.lastname = lastname;
        this.birthday = birthday;
        this.noUploadBook = noUploadBook;
        this.gender = gender;
    }
    public Member(String memberID, String email, String password, String avatar, String role, String firstname, String lastname, Date birthday, int noUploadBook, String gender, Date dateReport, String detail, String ratingID, String reportStateID) {
        this.memberID = memberID;
        this.email = email;
        this.password = password;
        this.avatar = avatar;
        if (avatar == null || avatar.isEmpty()) {
            this.avatar = MAIN_AVT;
        }
        this.role = role;
        this.firstname = firstname;
        this.lastname = lastname;
        this.birthday = birthday;
        this.noUploadBook = noUploadBook;
        this.gender = gender;
    }

    public String getMemberID() {
        return memberID;  
    }
    public void setMemberID(String memberID) {
        this.memberID = memberID;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getAvatar() {
        return IMG_PATH + avatar;
    }
    public String getAvatarToDB() {
        return avatar;
    }
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
    public String getFirstname() {
        return firstname;
    }
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }
    public String getLastname() {
        return lastname;
    }
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }
    public Date getBirthday() {
        return birthday;
    }
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    public int getnoUploadBook() {
        return noUploadBook;
    }
    public void setnoUploadBook(int noUploadBook) {
        this.noUploadBook = noUploadBook;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
}