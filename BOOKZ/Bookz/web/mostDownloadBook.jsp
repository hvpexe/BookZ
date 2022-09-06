<%-- 
    Document   : mostDownloadBook
    Created on : Jun 28, 2022, 3:02:25 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="com.demo.DAOS.BookDAO"%>
<%@page import="com.demo.DTOs.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="./assets/images/webimage/icon_bookz.png" type="image/x-icon">

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="./assets/css/web/bootstrap-4.3.1.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/fontawesome-free-6.1.1-web/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" type="text/css" href="./assets/css/styles.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/header.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/footer.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/login.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/book_item.css">

        
        <script src="./assets/js/mycode.js"></script>
    </head>
    <body>  
        <c:set value="<%= BookDAO.getMostDownloadBook()%>" var="BookList"/>
        <div class="book_list row grid-content">
            <c:forEach items="${BookList}" var="cc" > 
                <form action="book" class="col-md-4 col-lg-3  d-flex align-content-center">
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
