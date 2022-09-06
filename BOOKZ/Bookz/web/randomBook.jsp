
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.demo.DAOS.BookDAO"%>
<%@page import="com.demo.DTOs.Book"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--    <head>
    <c:import url="index.html" />
    <title>Being Fancy</title>
</head>-->
    <body>
        <% List<Book> list = BookDAO.getRandomBook();
            Random rand = new Random();
            Book book = list.get(rand.nextInt(list.size() - 1));
            request.setAttribute("cc", book);
        %>
       <form action="book" class="m-3">
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
    </body>
</html>
