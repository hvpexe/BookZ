<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <jsp:include page="index.html" flush="true" />
        <title>Book upload</title>
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
                    <li onclick="window.location = '${upload}'" class="function-select list-group-item list-group-item-action">
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
                <!-- Book Uploaded -->
                <div id="profile-book-Uploaded">
                    <div class="profile-header">
                        <h1 class="info-title">Book Uploaded: </h1>
                    </div>
                    <c:if test="${not empty requestScope.BOOK_UPLOAD_LIST}">
                        <div class="book-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Cover</th>
                                        <th>Title</th>
                                        <th>Author</th>
                                        <th>Date upload</th>
                                        <th>Detail</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set value="${BOOK_UPLOAD_LIST.size()/10>0?BOOK_UPLOAD_LIST.size()/10+1.001:1}" var="listSize"/>
                                    <c:set value="${param.p > 1 ? param.p : 1}" var="p" />
                                    <c:set value="${pageScope.p > listSize ? listSize : p}" var="p"/>
                                    <c:forEach var="book" items="${requestScope.BOOK_UPLOAD_LIST}" begin="${p*10-10}" end="${p*10-1}">
                                        <tr>
                                            <td><img class="book-item-img"
                                                     src="${book.cover}" alt="">
                                            </td>
                                            <td>
                                                ${book.title}
                                            </td>
                                            <td>
                                                ${book.author}
                                            </td>
                                            <td>
                                                ${book.dateUpload}
                                            </td>
                                            <td>
                                                <button onclick="location.href = 'book?action=watch&bookid=${book.bookID}'">Detail</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${listSize>1}"> 
                                <nav class="d-flex col-12" aria-label="Page navigation example">
                                    <ul class="pagination m-auto">
                                        <li class="page-item ${p-1<1?"disabled":""}">
                                            <form action="ProfileBookUploadController"  class="page-link" ${p-1<1?"":"onclick='submit()'"}>
                                                Previous
                                                <input type="hidden" name="memberID" value="${sessionScope.login.memberID}">
                                                <input type="hidden" name="p" value="${p-1}">
                                            </form>
                                        </li>                   
                                        <c:if test="${p-3 > 1}" >
                                            <li class="page-item">
                                                <form action="ProfileBookUploadController"  class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                                    1
                                                    <input type="hidden" name="memberID" value="${sessionScope.login.memberID}">
                                                    <input type="hidden" name="p" value="${1}">
                                                </form>
                                            </li>
                                            <li class="page-item">
                                                <form action="ProfileBookUploadController"  class="btn disabled "  >
                                                    ...
                                                </form>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="${p-3>0?p-3:1}" end="${listSize}" varStatus="c" >
                                            <c:if test="${c.count<=7}">
                                                <li class="page-item">
                                                    <form action="ProfileBookUploadController"  class="page-link ${c.index == p ? "orange-active":""}"  ${c.index==p?"":"onclick='submit()'"}>
                                                        ${c.index}
                                                        <input type="hidden" name="memberID" value="${sessionScope.login.memberID}">
                                                        <input type="hidden" name="p" value="${c.index}">
                                                    </form>
                                                </li>
                                                <c:set var="listSize" value="${c.end}"/>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${p+3 < listSize}" >
                                            <li class="page-item">
                                                <form action="ProfileBookUploadController"  class="btn disabled "  >
                                                    ...
                                                </form>
                                            </li>
                                            <li class="page-item">
                                                <form action="ProfileBookUploadController"  class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                                    ${listSize}
                                                    <input type="hidden" name="memberID" value="${sessionScope.login.memberID}">
                                                    <input type="hidden" name="p" value="${listSize}">
                                                </form>
                                            </li>
                                        </c:if>
                                        <li class="page-item ${p+1>listSize?"disabled":""}">
                                            <form action="ProfileBookUploadController"  class="page-link " ${p+1>listSize?"":"onclick='submit()'"} >
                                                Next
                                                <input type="hidden" name="memberID" value="${sessionScope.login.memberID}">
                                                <input type="hidden" name="p" value="${p+1}">
                                            </form>
                                        </li>
                                    </ul>
                                </nav>
                            </c:if>
                        </div>
                    </c:if>
                    <div class="empty-book">
                        ${requestScope.NO_UPLOAD}
                    </div>
                </div>
            </div>
        </div>
        <!-- SITE FOOTER -->
        <jsp:include page="footer.jsp"/>
    </body>
</html>


