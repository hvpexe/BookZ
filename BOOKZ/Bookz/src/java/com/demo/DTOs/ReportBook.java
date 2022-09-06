/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.demo.DTOs;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class ReportBook {

    private int reportID;
    private Timestamp dateReport;
    private String reportType;
    private String detail;
    private String reportState;
    private String memberID;
    private String bookID;
    private Member member;
    private Book book;

    public ReportBook() {
    }

    public ReportBook(Timestamp dateReport, String reportType, String detail, String reportState, String memberID, String bookID) {
        this.dateReport = dateReport;
        this.reportType = reportType;
        this.detail = detail;
        this.reportState = reportState;
        this.memberID = memberID;
        this.bookID = bookID;
    }
    
    public ReportBook(int reportID, Timestamp dateReport, String reportType, String detail, String reportState, Member member, Book book) {
        this.reportID = reportID;
        this.dateReport = dateReport;
        this.detail = detail;
        this.reportType = reportType;
        this.reportState = reportState;
        this.member = member;
        this.book = book;
    }

    public ReportBook(int reportID, Timestamp dateReport, String reportType, String detail, String reportState, String memberID, String bookID) {
        this.reportID = reportID;
        this.dateReport = dateReport;
        this.reportType = reportType;
        this.detail = detail;
        this.reportState = reportState;
        this.memberID = memberID;
        this.bookID = bookID;
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
    }

    public String getReportState() {
        return reportState;
    }

    public void setReportState(String reportState) {
        this.reportState = reportState;
    }

    public Timestamp getDateReport() {
        return dateReport;
    }

    public void setDateReport(Timestamp dateReport) {
        this.dateReport = dateReport;
    }

    public String getDetail() {
        return detail;
    }

    public String getReportType() {
        return reportType;
    }

    public void setReportType(String reportType) {
        this.reportType = reportType;
    }

    public void setDetail(String detail) {
        this.detail = detail;
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

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

}
