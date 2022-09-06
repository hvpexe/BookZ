<%-- 
    Document   : profileSectionLeft
    Created on : Jul 17, 2022, 10:02:51 AM
    Author     : PhuHV
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- SECTION LEFT -->
<div class="col-md-12 col-lg-3 ">
    <div class="profile-img">
        <img src="${sessionScope.login.avatar}"
             alt="">
        <div class="file btn">
            Change avatar
            <input type="file" name="file" />
        </div>
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
        <li onclick="window.location = './profileChangePassword.jsp'" class="list-group-item list-group-item-action">
            Change password
        </li>
        <li onclick="window.location = 'logout'" class="list-group-item list-group-item-action">
            Logout
        </li>
    </ul>

</div>
