<%-- 
    Document   : index
    Created on : Jun 22, 2022, 10:10:00 AM
    Author     : Admin
--%>

<%@page import="com.demo.DAOS.BookDAO"%>
<%@page import="com.demo.DTOs.Book"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core">
    <!--    <head>
    <jsp:include page="index.html" />
    <title>Being Fancy</title>
</head>-->




    <body>
        <%
            List<Book> list = BookDAO.getMostRecentBook();
            request.setAttribute("MostRecentBook", list);
        %>

        <div class="book_list row grid-content">
            <c:forEach items="${MostRecentBook}" var="cc" > 
                <form action="book" class="col-md-4 col-lg-3 d-flex align-content-center">
                    <div class="book card list-group-item-action" onclick="this.parentNode.submit()">
                        <div class="book_cover">
                            <img src="${cc.cover}" alt="">
                        </div>
                        <div class="book_info">
                            <div class="title">
                                <a onclick="this.parentNode.submit()" >${cc.title}</a>
                            </div>
                            <div class="author">${cc.author}</div>
                            <div class="rating">
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="action" value="watch">
                    <input type="hidden" name="bookid" value="${cc.bookID}">
                </form>
            </c:forEach>
        </div>
    </body>
</html>