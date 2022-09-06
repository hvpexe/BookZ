<%-- 
    Document   : category.jsp
    Created on : Jul 5, 2022, 10:57:16 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.demo.DAOS.CategoryDAO"%>
<%@page import="com.demo.DTOs.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:import url="index.html"/>
        <style>
            .link_all_category {
                color: #FFF !important;
                text-decoration: none !important;
            }
            .link_all_category:hover {
                font-weight: 700 !important;
            }
        </style>
    </head>
    <body>
        <div id="category">
            <div class="category_title">
                <a class="link_all_category" href="CategorySectionController"><i class="fa-solid fa-bars"></i> CATEGORY</a>
            </div>
                <c:set var="cateID" value="${param.cateid}"/>
            <div class="category_element list-unstyled list-group ">
                <% List<Category> catelist = CategoryDAO.cateList();
                %>
                <c:forEach items="<%=catelist%>" var="cate" >
                    <a class="list-group-item list-group-item-action ${cate.categoryID==cateID?"orange-active":""} " 
                       onclick="this.nextElementSibling.submit()">
                        <c:out value="${cate.categoryName}"/></a>
                    <form action="CategorySectionController" style="position: absolute; left: -99999;"  >
                        <input type="hidden" value="${cate.categoryID}" name="cateid">
                    </form>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
