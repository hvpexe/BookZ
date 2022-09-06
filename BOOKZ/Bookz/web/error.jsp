<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Error</title>
        <c:import url='index.html'/>
    </head>
    <body>
        <c:import url="header.jsp"/>

        <section class="section container">
            <div class="col-4 m-auto"><img class="d-block m-auto w-100" src="assets/images/mainavt/normal_avt.png" alt="Smart As Cat"/>
            </div>
            <div class="fa-4x col-12 text-center">
                ERROR!!! WE HAVEN'T PROGRAMMED FOR THIS SITUATION
            </div>
            <a class="fa-5x col-12 text-center" href="/Bookz/">Let's Go Home</a>

        </section>

        <!-- SITE FOOTER -->
        <jsp:include page="footer.jsp"/>
        <script src="./assets/js/setup.js"></script>

    </body>
</html>
