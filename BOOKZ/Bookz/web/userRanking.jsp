<%@page import="com.demo.DAOS.MemberDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.DTOs.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body>
    <%
        List<Member> list = MemberDAO.getUserRanking();
        request.setAttribute("UserRanking", list);
    %>
    <div class="user_list">
        <table class="table">
            <tbody>
                <c:forEach items="${UserRanking}" var="cc"> 
                    <tr>
                        <td>
                            <div class="profile-picture">
                                <img src="${cc.avatar}"
                                     alt="">
                            </div>
                        </td>
                        <td><div class="user-info"><strong>${cc.lastname} ${cc.firstname}</strong></div></td>
                        <td><div class="point-badge badge badge-dark">${cc.noUploadBook} books</div></td>
                    </tr>
                </c:forEach>   
            </tbody>
        </table>
    </div>
</body>
