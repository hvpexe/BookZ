<%-- 
    Document   : error404
    Created on : Jul 19, 2022, 4:07:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>404 URL Not Found</title>
        <jsp:include page="index.html"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <section class="section container">
            <div class="col-4 m-auto"><img class="d-block m-auto w-100" src="assets/images/mainavt/normal_avt.png" alt="Smart As Cat"/>
            </div>
            <div class="fa-5x col-12 text-center">You Got Error 404</div>
            <a class="fa-5x col-12 text-center" href="/Bookz/">Let's Go Home</a>

        </section>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
