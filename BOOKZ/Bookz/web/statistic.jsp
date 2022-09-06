
<%@page import="com.demo.DAOS.MemberDAO"%>
<%@page import="com.demo.DAOS.BookDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--<jsp:include page="statistic.jsp"/>--%>
<%
    int noBook = BookDAO.getSumBook();
    int noMember = MemberDAO.getSumMember();
%>

<div class="statistic_detail">
    <div class="statistic_element">
        <div class="statistic_logo">
            <i class="fa-solid fa-book"></i>
        </div>
        <div class="statistic_number"><%= noBook%></div>
        <div class="statistic_title">Number of Books</div>
    </div>
    <div class="statistic_element">
        <div class="statistic_logo">
            <i class="fa-solid fa-user"></i>
        </div>
        <div class="statistic_number"><%= noMember%></div>
        <div class="statistic_title">Number of Members</div>
    </div>
</div>