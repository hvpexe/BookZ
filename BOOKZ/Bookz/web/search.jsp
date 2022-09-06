
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Searching..</title>
        <c:import url="index.html"></c:import>
        </head>
        <body>
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
                <c:set value="${BookListn.size()/8>0?BookListn.size()/8+1.001:1}" var="listSize1"/>
                <c:set value="${BookLista.size()/8>0?BookLista.size()/8+1.001:1}" var="listSize2"/>
                <!--${listSize1} ${listSize2} ${BookLista.size()}-->
                <c:set value="${param.p1>1?param.p1:1}" var="p1" />
                <c:set value="${pageScope.p1>listSize1?listSize1:p1}" var="p1"/>
                <c:set value="${param.p2>1?param.p2:1}" var="p2" />
                <c:set value="${pageScope.p2>listSize1?listSize1:p2}" var="p2"/>
                <div class="top_title">
                    <div class="section_title text-center ">
                        <i class="fa-book fa-solid"></i> Books we found
                    </div>
                    <div class="book_list row grid-content">

                        <c:forEach items="${BookListn}" begin="${p1*8-8}" end="${p1*8-1}" var="cc" > 
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
                </div>
                <br>
                <c:if test="${listSize1>1}" > 
                    <c:set var="search" scope="session" value="${param.search}"/>
                    <nav class="d-flex col-12" aria-label="Page navigation example">
                        <ul class="pagination m-auto">
                            <li class="page-item ${p1-1<1?"disabled":""}">
                                <form class="page-link" ${p1-1<1?"":"onclick='submit()'"}>
                                    Previous
                                    <input type="hidden" name="p" value="${p1-1}">
                                    <input type="hidden" name="search" value="${search}">

                                </form>
                            </li>                   
                            <c:if test="${p1-3 > 1}" >
                                <li class="page-item">
                                    <form class="page-link ${c.index == p1 ? "orange-active":""}"  onclick="submit()">
                                        1
                                        <input type="hidden" name="p1" value="${1}">
                                        <input type="hidden" name="p2" value="${p2}">
                                        <input type="hidden" name="search" value="${search}">

                                    </form>
                                </li>
                                <li class="page-item">
                                    <form class="btn disabled "  >
                                        ...
                                    </form>
                                </li>
                            </c:if>
                            <c:forEach begin="${p1-3>=1?p1-3:1}" end="${listSize1}" varStatus="c" step="1">
                                <c:if test="${c.count<=7}">
                                    <li class="page-item">
                                        <form class="page-link ${c.index == p1 ? "orange-active":""}"  ${c.index==p1?"":"onclick='submit()'"}>
                                            ${c.index}
                                            <input type="hidden" name="p1" value="${c.index}">
                                            <input type="hidden" name="p2" value="${p2}">
                                            <input type="hidden" name="search" value="${search}">
                                        </form>
                                    </li>
                                    <c:set var="listSize1" value="${c.end}"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${p1+3 <listSize1 &&listSize1>7}" >
                                <li class="page-item">
                                    <form class="btn disabled "  >
                                        ...
                                    </form>
                                </li>
                                <li class="page-item">
                                    <form class="page-link ${c.index == p1 ? "orange-active":""}"  onclick="submit()">
                                        ${listSize1}
                                        <input type="hidden" name="p1" value="${listSize1}">
                                        <input type="hidden" name="p2" value="${p2}">
                                        <input type="hidden" name="search" value="${search}">
                                    </form>
                                </li>
                            </c:if>

                            <li class="page-item ${p1+1>listSize1?"disabled":""}">
                                <form class="page-link " ${p1+1>listSize1?"":"onclick='submit()'"} >
                                    Next
                                    <input type="hidden" name="p1" value="${p1+1}">
                                    <input type="hidden" name="p2" value="${p2}">
                                    <input type="hidden" name="search" value="${search}">
                                </form>
                            </li>
                        </ul>
                    </nav>
                </c:if>
                <c:if test="${param.search!=''}">
                    <div class="top_title">
                        <div class="section_title text-center ">
                            <i class="fa-book fa-solid"></i> Book By Author
                        </div>
                        <div class="book_list row grid-content">
                            <c:forEach items="${BookLista}" begin="${p2*8-8}" end="${p2*8-1}" var="cc" > 
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
                    </div>
                    <c:if test="${listSize2>1}" > 
                        <c:set var="search" scope="session" value="${param.search}"/>
                        <nav class="d-flex col-12" aria-label="Page navigation example">
                            <ul class="pagination m-auto">
                                <li class="page-item ${p2-1<1?"disabled":""}">
                                    <form class="page-link" ${p2-1<1?"":"onclick='submit()'"}>
                                        Previous
                                        <input type="hidden" name="p1" value="${p1}">
                                        <input type="hidden" name="p2" value="${p2-1}">
                                        <input type="hidden" name="search" value="${search}">

                                    </form>
                                </li>                   
                                <c:if test="${p2-3 > 1}" >
                                    <li class="page-item">
                                        <form class="page-link ${c.index == p2 ? "orange-active":""}"  onclick="submit()">
                                            1
                                            <input type="hidden" name="p1" value="${p1}">
                                            <input type="hidden" name="p2" value="${1}">
                                            <input type="hidden" name="search" value="${search}">

                                        </form>
                                    </li>
                                    <li class="page-item">
                                        <form class="btn disabled "  >
                                            ...
                                        </form>
                                    </li>
                                </c:if>
                                <c:forEach begin="${p2-3>=1?p2-3:1}" end="${listSize2}" varStatus="c" step="1">
                                    <c:if test="${c.count<=7}">
                                        <li class="page-item">
                                            <form class="page-link ${c.index == p2 ? "orange-active":""}"  ${c.index==p2?"":"onclick='submit()'"}>
                                                ${c.index}
                                                <input type="hidden" name="p1" value="${p1}">
                                                <input type="hidden" name="p2" value="${c.index}">
                                                <input type="hidden" name="search" value="${search}">

                                            </form>
                                        </li>
                                        <c:set var="listSize2" value="${c.end}"/>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${p2+3 <listSize2 && listSize2>7}" >
                                    <li class="page-item">
                                        <form class="btn disabled "  >
                                            ...
                                        </form>
                                    </li>
                                    <li class="page-item">
                                        <form class="page-link ${c.index == p2 ? "orange-active":""}"  onclick="submit()">
                                            ${listSize2}
                                            <input type="hidden" name="p1" value="${p1}">
                                            <input type="hidden" name="p2" value="${listSize2}">
                                            <input type="hidden" name="search" value="${search}">

                                        </form>
                                    </li>
                                </c:if>
                                <li class="page-item ${p2+1>listSize2?"disabled":""}">
                                    <form class="page-link " ${p2+1>listSize2?"":"onclick='submit()'"} >
                                        Next
                                        <input type="hidden" name="p1" value="${p1}">
                                        <input type="hidden" name="p2" value="${p+1}">
                                        <input type="hidden" name="search" value="${search}">
                                    </form>
                                </li>
                            </ul>
                        </nav>
                    </c:if>
                </c:if>
            </div>

        </div>


    </div>
    <script src="assets/js/setup.js"></script>
</body>
</html>
