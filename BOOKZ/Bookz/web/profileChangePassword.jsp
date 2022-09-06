<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <jsp:include page="index.html" flush="true" />
        <title>Change password</title>
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
                         alt="">
                </div>
                <div class="profile-name">${sessionScope.login.lastname} ${sessionScope.login.firstname}</div>
                <ul id="profile-function" class="list-group">
                    <li onclick="window.location = './profileInformation.jsp'" class="list-group-item list-group-item-action">
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
                    <li onclick="window.location = './profileChangePassword.jsp'" class="function-select list-group-item list-group-item-action">
                        Change password
                    </li>
                    <li onclick="window.location = 'logout'" class="list-group-item list-group-item-action">
                        Logout
                    </li>
                </ul>

            </div>
            <!-- SECTION RIGHT -->

            <div class="section_right col-md-12 col-lg-9">
                <div id="profile-change-password">
                    <div class="profile-header">
                        <h1 class="info-title">Change password: </h1>
                    </div>
                    <div class="card card-outline-secondary">
                        <div class="card-body">
                            <form action="ProfileChangePasswordController" class="form" role="form" autocomplete="off">
                                <div class="form-group">
                                    <label for="inputPasswordOld">Current Password</label>
                                    <input type="password" name="passwordOld" class="form-control" id="inputPasswordOld" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNew">New Password</label>
                                    <input type="password" name="passwordNew" class="form-control" id="inputPasswordNew" required="">
                                    <span class="form-text small text-muted">
                                        password must be at least 8 characters.
                                    </span>
                                </div>
                                <div class="form-group">
                                    <label for="inputPasswordNewVerify">Verify</label>
                                    <input type="password" name="passwordNewVerify" class="form-control" id="inputPasswordNewVerify" required="">
                                    <span class="form-text small text-muted">
                                        To confirm, type the new password again.
                                    </span>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="memberID" value="${sessionScope.login.memberID}">
                                    <button type="submit" class="btn btn-main-theme btn-lg float-left">Save</button>
                                    <c:if test="${not empty requestScope.PASSWORD_ERROR}"><span class="pass-error">${requestScope.PASSWORD_ERROR}</span></c:if>
                                    <c:if test="${not empty requestScope.PASSWORD_SUCCESS}"><span class="pass-success">${requestScope.PASSWORD_SUCCESS}</span></c:if>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    <jsp:include page="footer.jsp"/>

</html>
