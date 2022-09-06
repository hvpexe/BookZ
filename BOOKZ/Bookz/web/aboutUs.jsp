<%-- 
    Document   : aboutUs
    Created on : Jul 8, 2022, 6:54:51 PM
    Author     : PhuHV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>About Us</title>
        <c:import url='index.html'/>
        <link rel="stylesheet" type="text/css" href="./assets/css/aboutUs.css">
    </head>

    <body id="page-top">
        <c:import url="header.jsp"/>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome To Our Library - BookZ!</div>
                <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
                <a class="btn btn-main-color btn-xl text-uppercase" href="#services">Tell Me More</a>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">ABOUT OUR WEBSITE</h2>
                    <h3 class="section-subheading text-muted">Of the reader, by the reader, for the reader.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-main-color"></i>
                            <i class="fas fa-piggy-bank fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Non-profit</h4>
                        <p class="text-muted">
                            The "BookZ" system is a non-profit online library project of free ebook,
                            developed and designed to allow users to upload their books, download books,
                            rating books.
                        </p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-main-color"></i>
                            <i class="fas fa-people-group fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Audiance</h4>
                        <p class="text-muted">
                            Project BookZ's target audiance is every Vietnamese who interested in book
                            and wanted to share their books to other users who use this website.
                        </p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-main-color"></i>
                            <i class="fas fa-bullseye fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Target</h4>
                        <p class="text-muted">
                            Website have books from all category for self-studying, entertaining,
                            motivation,...; provide all the neccessary material for any readers
                            that seeking for knowledge for free.
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Team-->
        <section class="page-section bg-side-color" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">Alone we can do so little, together we can do so much.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/images/webimage/phu.jpg" alt="..." />
                            <h4>Huỳnh Vạn Phú</h4>
                            <p class="text-muted">Lead Designer</p>
                            <a target="_blank" class="btn btn-dark btn-social mx-2"
                               href="https://www.facebook.com/phu.huynhvan.923/"><i class="fab fa-facebook-f"></i></a>
                            <a target="_blank" class="btn btn-dark btn-social mx-2" href="https://github.com/hvpexe"><i
                                    class="fab fa-github"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/images/webimage/binh_ver2.jpg" alt="..." />
                            <h4>Nguyễn Thanh Bình</h4>
                            <p class="text-muted">Lead Developer</p>
                            <a target="_blank" class="btn btn-dark btn-social mx-2"
                               href="https://www.facebook.com/loveyou4365"><i class="fab fa-facebook-f"></i></a>
                            <a target="_blank" class="btn btn-dark btn-social mx-2"
                               href="https://github.com/mcgamewebsite"><i class="fab fa-github"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="assets/images/webimage/kiet.jpg" alt="..." />
                            <h4>Chu Tuấn Kiệt</h4>
                            <p class="text-muted">Lead Marketer</p>
                            <a target="_blank" class="btn btn-dark btn-social mx-2"
                               href="https://www.facebook.com/trau.chu.31"><i class="fab fa-facebook-f"></i></a>
                            <a target="_blank" class="btn btn-dark btn-social mx-2" href="https://github.com/kaolaa20"><i
                                    class="fab fa-github"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Donate -->
        <section class="page-section">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">DONATE</h2>
                    <h3 class="section-subheading text-muted">Our website maintenance depends on your donations.</h3>
                    <div class="text-center">
                        <p class="donate-para">
                            We're a non-profit that depends on donations to stay online and thriving, but 98% of our 
                            readers don't give; they simply look the other way. If everyone who uses BookZ gave 
                            just a little, we could keep BookZ thriving for years to come. The price of a cup of coffee is all we ask.
                        </p>
                        <div class="donate-medium">Momo : 0398550944 – HUYNH VAN PHU</div>
                        <div class="donate-medium">TPBANK : 0396 0016 401 – HUYNH VAN PHU</div>
                        <img class="mx-auto donate-img" src="assets/images/webimage/momo.jpg" alt="..." />
                    </div>
                </div>
                <div class="border">
                    <img class="mx-auto" src="./assets/img/momo.jpg" alt="">
                </div>
            </div>
        </section>

        <!-- SITE FOOTER -->
        <jsp:include page="footer.jsp"/>
        <script src="./assets/js/setup.js"></script>
    </body>

</html>
