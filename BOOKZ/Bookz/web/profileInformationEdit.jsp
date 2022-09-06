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
                    <img src="${sessionScope.login.avatar}"
                         alt="" id="user_avatar">
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
                    <form action="UpdateInformationController" method="post" enctype="multipart/form-data">
                        <div class="infor-detail">
                            <div class="row">
                                <div class="col-md-3">Firstname</div>
                                <div class="col-md-9">
                                    <input type="text" name="firstname" value="${sessionScope.login.firstname}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Lastname</div>
                                <div class="col-md-9">
                                    <input type="text" name="lastname" value="${sessionScope.login.lastname}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Birthday</div>
                                <div class="col-md-9">
                                    <input type="date" name="birthday" value="${sessionScope.login.birthday}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Gender</div>
                                <div class="col-md-9">
                                    <select name="gender">
                                        <option value="Male" ${sessionScope.login.gender == 'Male'? 'selected': ''}>Male</option>
                                        <option value="Female" ${sessionScope.login.gender == 'Female'? 'selected': ''}>Female</option>
                                        <option value="Other" ${sessionScope.login.gender == 'Other'? 'selected': ''}>Other</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Avatar</div>
                                <div class="col-md-9">
                                    <input type="file" name='avatar' value="${sessionScope.login.avatar}">
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="memberID" value="${sessionScope.login.memberID}">
                        <input class="info-submit" type="submit" value="Submit information">

                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>
        <script src="assets/js/setup.js"></script>
        <script src="assets/js/uploadBook.js"></script>
    </body>
</html>


