/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.demo.DTOs;

/**
 *
 * @author Admin
 */
public class RatingStarCount {

    private int s1;
    private int s2;
    private int s3;
    private int s4;
    private int s5;

    private int sTotal;
    private int sTotalSize;
    private float outOfFive;


    public RatingStarCount() {
        this(0, 0, 0, 0, 0);
    }

    public RatingStarCount(int s1, int s2, int s3, int s4, int s5) {
        this.s1 = s1;
        this.s2 = s2;
        this.s3 = s3;
        this.s4 = s4;
        this.s5 = s5;
        this.sTotal = (s1 + s2 + s3 + s4 + s5) * 5;
        this.sTotalSize = (s1 * 1 + s2 * 2 + s3 * 3 + s4 * 4 + s5 * 5);
        this.outOfFive = Math.round((float)sTotalSize/sTotal*5*100)/100;
    }

    public int getS1() {
        return s1;
    }

    public void setS1(int s1) {
        this.s1 = s1;
    }

    public int getS2() {
        return s2;
    }

    public void setS2(int s2) {
        this.s2 = s2;
    }

    public int getS3() {
        return s3;
    }
    public int getsTotalSize() {
        return sTotalSize;
    }

    public void setsTotalSize(int sTotalSize) {
        this.sTotalSize = sTotalSize;
    }

    public void setS3(int s3) {
        this.s3 = s3;
    }

    public int getS4() {
        return s4;
    }

    public void setS4(int s4) {
        this.s4 = s4;
    }

    public int getS5() {
        return s5;
    }

    public float getOutOfFive() {
        return outOfFive;
    }

    public void setOutOfFive(float outOfFive) {
        this.outOfFive = outOfFive;
    }

    public void setS5(int s5) {
        this.s5 = s5;
    }

    public int getsTotal() {
        return sTotal;
    }

    public void setsTotal(int sTotal) {
        this.sTotal = sTotal;
    }

    @Override
    public String toString() {
        return "s1=" + s1 + ", s2=" + s2 + ", s3=" + s3 + ", s4=" + s4 + ", s5=" + s5 + ", sTotal=" + sTotal;
    }

}
