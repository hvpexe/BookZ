<%-- 
    Document   : profileInformation
    Created on : Jul 17, 2022, 10:05:03 AM
    Author     : PhuHV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <jsp:include page="index.html" flush="true" />
        <title>Your information</title>
        <link rel="stylesheet" type="text/css" href="./assets/css/web/bootstrap-4.3.1.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/fontawesome-free-6.1.1-web/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/styles.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/header.css">
        <link rel="stylesheet" type="text/css" href="./assets/css/footer.css">
        <link rel="stylesheet" href="./assets/css/profile.css">

    </head>

    <body>
        <jsp:include page="header.jsp" />
        <div class="section container row">
            <!-- SECTION LEFT -->
            <div class="col-md-12 col-lg-3 ">
                <div class="profile-img">
                    <img class="border border-dark p-2" src="${sessionScope.login.avatar}" alt="User Avt">
                </div>
                <div class="profile-name">${sessionScope.login.lastname} ${sessionScope.login.firstname}</div>
                <ul id="profile-function" class="list-group">
                    <li onclick="window.location = './profileInformation.jsp'" class="function-select list-group-item list-group-item-action">
                        Your information
                    </li>
                    <c:url var="download" value="ProfileBookDownloadController">
                        <c:param name="memberID" value="${sessionScope.login.memberID}"></c:param>
                    </c:url>
                    <li onclick="window.location = '${download}'" class="list-group-item list-group-item-action">
                        Book downloaded
                    </li>
                    <c:url var="upload" value="ProfileBookUploadController">
                        <c:param name="memberID" value="${sessionScope.login.memberID}"></c:param>
                    </c:url>
                    <li onclick="window.location = '${upload}'" class="list-group-item list-group-item-action">
                        Book uploaded
                    </li>
                    <c:url var="rating" value="ProfileRatingController">
                        <c:param name="memberID" value="${sessionScope.login.memberID}"></c:param>
                    </c:url>
                    <li onclick="window.location = '${rating}'" class="list-group-item list-group-item-action">
                        Your rating
                    </li>
                    <li onclick="window.location = './profileChangePassword.jsp'" class="list-group-item list-group-item-action">
                        Change password
                    </li>
                    <li onclick="window.location = 'logout'" class="list-group-item list-group-item-action">
                        Logout
                    </li>
                </ul>

            </div>
            <!-- SECTION RIGHT -->
            <div class="section_right col-md-12 col-lg-9">
                <!-- Your information -->
                <div id="profile-information">
                    <div class="profile-header">
                        <h1 class="info-title">Your information: </h1>
                    </div>
                    <div class="infor-detail">
                        <div class="row">
                            <div class="col-md-3">User ID</div>
                            <div class="col-md-9">${sessionScope.login.memberID}</div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">Fullname</div>
                            <div class="col-md-9">${sessionScope.login.lastname} ${sessionScope.login.firstname}</div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">Email</div>
                            <div class="col-md-9">${sessionScope.login.email}</div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">Role</div>
                            <div class="col-md-9">${sessionScope.login.role}</div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">Birthday</div>
                            <div class="col-md-9">${sessionScope.login.birthday}</div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">Gender</div>
                            <div class="col-md-9">${sessionScope.login.gender}</div>
                        </div>
                    </div>
                    <button onclick="location.href = 'profileInformationEdit.jsp'" class="info-submit">Edit information</button>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>


