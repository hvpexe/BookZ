<%@page import="com.demo.DAOS.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.demo.DAOS.BookDAO"%>
<%@page import="com.demo.DTOs.Book"%>
<%@page import="com.demo.DAOS.CategoryDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.DTOs.Category"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>BookZ - Learn, Lead, Success</title>
        <c:import url='index.html'/>
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

                <!-- CAROUSEL -->
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block center-block" src="assets/images/webimage/long1.png" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block mx-auto" src="./assets/images/webimage/long2.png" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block mx-auto" src="./assets/images/webimage/long3.png" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>

                <!-- MOST DOWNLOAD -->
                <c:url var="mostDownload" value="CategorySectionController">
                    <c:param name="action" value="Most Download"></c:param>
                </c:url>
                <div id="most_download">
                    <div class="top_title">
                        <div class="section_title">MOST DOWNLOAD</div>
                        <div class="seemore"><a href="${mostDownload}">See more ></a></div>
                    </div>
                    <c:import url="mostDownloadBook.jsp"/>
                </div>

                <!-- RECENTLY ADDED -->
                <c:url var="recentlyAdded" value="CategorySectionController">
                    <c:param name="action" value="Recently Added"></c:param>
                </c:url>
                <div id="recently_added">
                    <div class="top_title">
                        <div class="section_title">RECENTLY ADDED</div>
                        <div class="seemore"><a href="${recentlyAdded}">See more ></a></div>
                    </div>
                    <c:import url="mostRecentBook.jsp"/>
                </div>
            </div>

        </div>

        <!-- SITE FOOTER -->
        <jsp:include page="footer.jsp"/>

    </body>
</html>
