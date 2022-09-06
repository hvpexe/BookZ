<%@page import="com.demo.DTOs.Book"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Category</title>
        <c:import url='index.html'/>
        <link rel="stylesheet" type="text/css" href="./assets/css/categorySection.css">

    </head>
    <body class="position-relative">
        <c:import url="header.jsp"/>

        <div class="section container row">
            <!-- SECTION LEFT -->
            <div class="section_left col-md-12 col-lg-3 ">
                <!-- CATEGORY -->
                <c:import url="category.jsp"/>

                <!-- RANDOM BOOK -->
                <div id="today_book">
                    <div class="top_title">
                        <div class="section_title">RANDOM BOOK</div>
                    </div>
                    <c:import url="randomBook.jsp"/>
                </div>

                <!-- USER RANKING -->
                <div id="user_ranking">
                    <div class="top_title">
                        <div class="section_title">TOP UPLOADER</div>
                    </div>
                    <c:import url="userRanking.jsp"/>
                </div>
                <!-- STATISTIC -->
                <div class="statistic">
                    <div class="top_title">
                        <div class="section_title">STATISTIC</div>
                    </div>
                    <c:import url="statistic.jsp"/>
                </div>
            </div>
            <!-- SECTION RIGHT -->
            <div class="section_right col-md-12 col-lg-9">
                <div class="category_section">
                    <h1 class="category_name">Category: ${CATEGORY_NAME}</h1>
                </div>
                <form action="CategorySectionController" class="category_sort">
                    <input type="hidden" name="cateid" value="${param.cateid}">
                    <input class="${param.action == null || param.action == "Most Download" ? "category_sort_select" : "category_sort_nonselect" }" type="submit" name="action" value="Most Download" >
                    <input class="${param.action == "Recently Added" ? "category_sort_select" : "category_sort_nonselect" }" type="submit" name="action" value="Recently Added">
                </form>
                <c:set var="p" value="${param.p != null? param.p : 1}"/>

                <%
                    List<Book> list = (List<Book>) request.getAttribute("BOOK_BY_CATEGORY");
                    int size = list.size() / 12;
                    if ((list.size() % 12) != 0) {
                        size = size + 1;
                    }
//                  listsize phai la so nguyen, dung taglib loi hoai nen buoc phai dung code java o day
%>
                <c:set var="listSize" value="<%= size%>"/>
                <div class="book_list row grid-content">
                    <c:forEach items="${BOOK_BY_CATEGORY}" var="cc" begin="${p*12-12}" end="${p*12-1}"> 
                        <form action="book" class="col-md-4 col-lg-3 list-group-item-action d-flex align-content-center">
                            <div class="book card" onclick="this.parentNode.submit()">
                                <div class="book_cover">
                                    <img src="${cc.cover}" alt="">
                                </div>
                                <div class="book_info">
                                    <div class="title">
                                        <a onclick="this.parentNode.submit()" >${cc.title}</a>
                                    </div>
                                    <div class="author">${cc.author} </div>
                                    <div class="rating">
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="action" value="watch">
                            <input type="hidden" name="bookid" value="${cc.bookID}">
                        </form>
                    </c:forEach>
                    <br>
                    <c:if test="${listSize>1}" > 
                        <c:set var="cateid" scope="session" value="${param.cateid}"/>
                        <nav class="d-flex col-12" aria-label="Page navigation example">
                            <ul class="pagination m-auto">
                                <li class="page-item ${p-1<1?"disabled":""}">
                                    <form class="page-link" ${p-1<1?"":"onclick='submit()'"}>
                                        Previous
                                        <input type="hidden" name="p" value="${p-1}">
                                        <input type="hidden" name="action" value="${param.action == null || param.action == "Most Download" ? "Most Download": "Recently Added"}">
                                        <input type="hidden" name="cateid" value="${cateid}">

                                    </form>
                                </li>                   
                                <c:if test="${p-3 > 1}" >
                                    <li class="page-item">
                                        <form class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                            1
                                            <input type="hidden" name="p" value="${1}">
                                            <input type="hidden" name="action" value="${param.action == null || param.action == "Most Download" ? "Most Download": "Recently Added"}">

                                            <input type="hidden" name="cateid" value="${cateid}">

                                        </form>
                                    </li>
                                    <li class="page-item">
                                        <form class="btn disabled "  >
                                            ...
                                        </form>
                                    </li>
                                </c:if>
                                <c:forEach begin="${p-3>0?p-3:1}" end="${listSize}" varStatus="c" >
                                    <c:if test="${c.count<=7}">
                                        <li class="page-item">
                                            <form class="page-link ${c.index == p ? "orange-active":""}"  ${c.index==p?"":"onclick='submit()'"}>
                                                ${c.index}
                                                <input type="hidden" name="p" value="${c.index}">
                                                <input type="hidden" name="cateid" value="${cateid}">
                                                <input type="hidden" name="action" value="${param.action == null || param.action == "Most Download" ? "Most Download": "Recently Added"}">

                                            </form>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${p+3 <listSize}" >
                                    <li class="page-item">
                                        <form class="btn disabled "  >
                                            ...
                                        </form>
                                    </li>
                                    <li class="page-item">
                                        <form class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                            ${listSize}
                                            <input type="hidden" name="p" value="${listSize}">
                                            <input type="hidden" name="action" value="${param.action == null || param.action == "Most Download" ? "Most Download": "Recently Added"}">

                                            <input type="hidden" name="cateid" value="${cateid}">

                                        </form>
                                    </li>
                                </c:if>
                                <li class="page-item ${p+1>listSize?"disabled":""}">
                                    <form class="page-link " ${p+1>listSize?"":"onclick='submit()'"} >
                                        Next
                                        <input type="hidden" name="p" value="${p+1}">
                                        <input type="hidden" name="action" value="${param.action == null || param.action == "Most Download" ? "Most Download": "Recently Added"}">

                                        <input type="hidden" name="cateid" value="${cateid}">


                                    </form>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </div>

            </div>

        </div>

        <!-- SITE FOOTER -->
        <jsp:include page="footer.jsp"/>
        <script src="./assets/js/setup.js"></script>

    </body>
</html>
