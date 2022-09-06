<%-- 
    Document   : manage
    Created on : Jul 6, 2022, 11:45:03 PM
    Author     : Admin
--%>
<%@page import="com.demo.DTOs.Book"%>
<%@page import="com.demo.DAOS.BookDAO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <c:if test="${login==null||login.role!='admin'}" scope="session" var="ss">
        <jsp:forward page="home.jsp"></jsp:forward>
    </c:if>
    <head>
        <jsp:include page="index.html" flush="true"/>
        <title>Book Management</title>
        <link rel="stylesheet" href="./assets/css/manage.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="section row">
            <div class="section_left col-12 ">

                <ul id="admin_manage_links" class="list-group list-group-horizontal ">
                    <form action="book" onclick="submit()" class="list-group-item m-3 list-group-item-action cursor-pointer">
                        Book Management
                        <input type="hidden" name="tab" value="1">
                        <input type="hidden" name="action" value="upload">
                    </form>
                    <form action="book" onclick="submit()" class="list-group-item m-3 list-group-item-action cursor-pointer">
                        Book Request By User
                        <input type="hidden" name="tab" value="2">
                        <input type="hidden" name="action" value="upload">
                    </form>
                    <form action="book" onclick="submit()" class="list-group-item m-3 list-group-item-action cursor-pointer">
                        User Management
                        <input type="hidden" name="tab" value="3">
                        <input type="hidden" name="action" value="upload">
                    </form>
                    <form action="book" onclick="submit()" class="list-group-item m-3 list-group-item-action cursor-pointer">
                        Book Report
                        <input type="hidden" name="tab" value="4">
                        <input type="hidden" name="action" value="upload">
                    </form>
                    <!--                    <form action="book" onclick="submit()" class="list-group-item m-3 list-group-item-action cursor-pointer">
                                            Rating Report
                                            <input type="hidden" name="tab" value="5">
                                            <input type="hidden" name="action" value="upload">
                                        </form>-->
                    <script>
                        let tab = ${tab};
                        document.querySelector('#admin_manage_links form input[value="' + tab + '"]').parentElement.classList.add('orange-active');
                    </script>    
                </ul>
            </div>

            <div class="section_right col-12 ">
                <c:set var="p" value="${p>1?p:1}"/>
                <c:set var="search" value="${param.search}"/>
                <c:set var="p" value="${p>listSize&&listSize>0?listSize:p}"/>
                <c:set var="tab" value="${tab>=1?tab:1}"/>
                <c:catch var="ex">
                    <c:choose>
                        <c:when test="${tab<3}">
                            <div id="admin_manage_content" > 
                                <div class="top_title row d-flex flex-wrap mt-0">
                                    <form class="col-md-8 col-12 row" id="search" action="book">
                                        <input class="col-9" type="text" name="search" value="${search}">
                                        <input type="hidden" name="tab" value="${tab}">
                                        <input type="hidden" name="action" value="upload">
                                        <input class="col" type="submit" value="Search">
                                    </form>

                                    <button class="col" onclick='location.replace("uploadBook.jsp");'>Add New Book</button> 
                                </div>
                                <div style="width: 100%" >
                                    <table class="bookz_list table table-bordered table-striped p-0" >
                                        <tr class="text-center bg-dark text-light ">
                                            <th>No.</th>
                                            <th class="col-1">Cover</th>
                                            <th >
                                                <div> Title</div>                                        
                                            </th>   
                                            <th><div> Author</div></th>
                                            <th>
                                                <div> Publisher</div>
                                            </th>
                                            <c:if test="${tab ==4}">
                                                <th>    
                                                    Detail
                                                </th>
                                            </c:if>
                                            <th><div> Language</div></th>
                                            <th><div> Upload Date</div></th>
                                            <th><div> Latest Edit Date</div></th>

                                            <th class="table-secondary text-dark">Book Details</th>
                                                <c:if test="${tab==2}">
                                                <th class="bg-success text-dark">Accept</th>
                                                </c:if>
                                            <th class="table-light text-dark">Delete</th>
                                            <th class="table-warning text-dark">Update</th>
                                        </tr>
                                        <c:forEach items="${bookList}" var="cc" varStatus="c" begin="${p*10-10}" end="${p*10-1}" >
                                            <tr class="col-12 ml-auto mr-auto col " >
                                                <td class="align-middle text-center ">${c.index+1}</td>
                                                <td class="col-1"><img class=" align-self-center w-100 border border-dark" src="${cc.cover}"style="aspect-ratio: 190 / 285;" alt=""></td>
                                                <td class="align-middle col-2">
                                                    <div> ${cc.title}</div>                                        
                                                </td>   
                                                <td class="align-middle align-items-center col-1"><div> ${cc.author}</div></td>
                                                <td class="align-middle align-items-center col-1">
                                                    <c:if test="${cc.publisher != null}">
                                                        <div> ${cc.publisher}</div>
                                                    </c:if>
                                                </td>
                                                <td class="align-middle align-items-center col-1"><div> ${cc.language}</div></td>
                                                <td class="align-middle align-items-center col-1 text-nowrap"><div> ${cc.dateUpload}</div></td>
                                                <td class="align-middle align-items-center col-1 text-nowrap"><div> ${cc.lastDateEdit}</div></td>
                                                <td class="align-middle col-1">
                                                    <!--neu muon Chinh button thi cho form bao lai de edit--> 
                                                    <form action="book">
                                                        <button class="bg-side-color" style="width: max-content;">Book Details</button>
                                                        <input type="hidden" name="bookid" value="${cc.bookID}">
                                                        <input type="hidden" name="action" value="watch">
                                                    </form>
                                                </td>

                                                <c:if test="${!cc.isIsAccepted()}">
                                                    <td class="align-middle text-center">
                                                        <form action="book" >
                                                            <button class="bg-success">Accept</button>
                                                            <input type="hidden" name="bookid" value="${cc.bookID}">
                                                            <input type="hidden" name="action" value="accept">
                                                        </form>
                                                    </td>
                                                </c:if>
                                                <td class="  align-middle text-center">

                                                    <form action="book">
                                                        <button class="bg-white">Delete</button>
                                                        <input type="hidden" name="bookid" value="${cc.bookID}">
                                                        <input type="hidden" name="action" value="delete">
                                                    </form>
                                                </td>
                                                <td class="  align-middle text-center">

                                                    <form action="book">
                                                        <button class="bg-warning">Update</button>
                                                        <input type="hidden" name="bookid" value="${cc.bookID}">
                                                        <input type="hidden" name="action" value="edit">
                                                    </form>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <c:if test="${listSize>1}" > 
                                        <nav class="d-flex col-12" aria-label="Page navigation example">
                                            <ul class="pagination m-auto">
                                                <li class="page-item ${p-1<1?"disabled":""}">
                                                    <form class="page-link" ${p-1<1?"":"onclick='submit()'"}>
                                                        Previous
                                                        <input type="hidden" name="p" value="${p-1}">
                                                        <input type="hidden" name="tab" value="${tab}">
                                                        <input type="hidden" name="search" value="${search}">
                                                        <input type="hidden" name="action" value="upload">
                                                    </form>
                                                </li>                   
                                                <c:if test="${p-3 > 1}" >
                                                    <li class="page-item">
                                                        <form class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                                            1
                                                            <input type="hidden" name="p" value="${1}">
                                                            <input type="hidden" name="tab" value="${tab}">
                                                            <input type="hidden" name="search" value="${search}">
                                                            <input type="hidden" name="action" value="upload">
                                                        </form>
                                                    </li>
                                                    <li class="page-item">
                                                        <form class="btn disabled "  >
                                                            ...
                                                        </form>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="${p-3>0?p-3:1}" end="${listSize}" varStatus="c" >
                                                    <c:if test="${c.count<=7}">
                                                        <li class="page-item">
                                                            <form class="page-link ${c.index == p ? "orange-active":""}"  ${c.index==p?"":"onclick='submit()'"}>
                                                                ${c.index}
                                                                <input type="hidden" name="p" value="${c.index}">
                                                                <input type="hidden" name="tab" value="${tab}">
                                                                <input type="hidden" name="search" value="${search}">
                                                                <input type="hidden" name="action" value="upload">
                                                            </form>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${p+3 <listSize}" >
                                                    <li class="page-item">
                                                        <form class="btn disabled "  >
                                                            ...
                                                        </form>
                                                    </li>
                                                    <li class="page-item">
                                                        <form class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                                            ${listSize}
                                                            <input type="hidden" name="p" value="${listSize}">
                                                            <input type="hidden" name="search" value="${search}">
                                                            <input type="hidden" name="tab" value="${tab}">
                                                            <input type="hidden" name="action" value="upload">
                                                        </form>
                                                    </li>
                                                </c:if>
                                                <li class="page-item ${p+1>listSize?"disabled":""}">
                                                    <form class="page-link " ${p+1>listSize?"":"onclick='submit()'"} >
                                                        Next
                                                        <input type="hidden" name="p" value="${p+1}">
                                                        <input type="hidden" name="tab" value="${tab}">
                                                        <input type="hidden" name="search" value="${search}">
                                                        <input type="hidden" name="action" value="upload">
                                                    </form>
                                                </li>
                                            </ul>
                                        </nav>
                                    </c:if>
                                </div>
                            </div>
                        </c:when>
                        <c:when test="${tab==4}">

                            <div id="admin_manage_content" > 
                                <div style="width: 100%" >
                                    <table class="bookz_list table table-bordered table-striped p-0" >
                                        <tr class="text-center bg-dark text-light ">
                                            <th>No</th>
                                            <th class="col-1">Cover</th>
                                            <th><div> Title</div></th>   
                                            <th><div> Report Type</div></th>
                                            <th><div> Detail</div></th>
                                            <th><div> Date Report</div></th>
                                            <th><div> Member Report</div></th>
                                            <th><div> Report State</div></th>
                                            <th><div> Book Function</div></th>
                                            <th><div> Report Function</div></th>
                                        </tr>
                                        <c:forEach items="${reportList}" var="rb" varStatus="c" begin="${p*10-10}" end="${p*10-1}">
                                            <c:set value="${rb.book}" var="cc"/>
                                            <c:set value="${rb.member}" var="u"/>
                                            <tr class="col-12 ml-auto mr-auto col " >
                                                <td class="align-middle text-center ">${c.index+1}</td>
                                                <td class="col-1">
                                                    <c:if test="${cc.cover!=null}">
                                                        <img class=" align-self-center w-100 border border-dark" src="${cc.cover}"style="aspect-ratio: 190 / 285;" alt="">
                                                    </c:if>
                                                </td>
                                                <td class="align-middle col-2"><div> ${cc.title==null?"<em>This Book Had Been Delete</em>":cc.title}</div></td>   
                                                <td class="align-middle text-center col-1"><div> ${rb.reportType}</div></td>
                                                <td class="align-middle text-center col-2">
                                                    <div> ${rb.detail}</div>
                                                </td>
                                                <td class="align-middle text-center col-1 text-nowrap"><div> ${rb.dateReport}</div></td>
                                                <td class="align-middle text-center col-1 text-nowrap"><div> ${u.email}</div></td>
                                                <td class="align-middle align-items-center col-1 text-nowrap">
                                                    <c:choose>
                                                        <c:when test="${rb.reportState == 'Approved'}">
                                                            <c:set var="reportState" value="green"></c:set>
                                                        </c:when>
                                                        <c:when test="${rb.reportState == 'Denied'}">
                                                            <c:set var="reportState" value="red"></c:set>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set var="reportState" value="blue"></c:set>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <div style="color: ${reportState}"><b> ${rb.reportState}</b></div>
                                                </td>
                                                <td class="align-middle col-1">
                                                    <div class="d-flex flex-wrap ">
                                                        <form action="book" class="flex-grow-1">
                                                            <button class="bg-side-color" style="width: max-content;">Book Details</button>
                                                            <input type="hidden" name="bookid" value="${cc.bookID}">
                                                            <input type="hidden" name="action" value="watch">
                                                        </form>

                                                        <form action="book" class="flex-grow-1">
                                                            <button class="bg-warning">Update Book</button>
                                                            <input type="hidden" name="bookid" value="${cc.bookID}">
                                                            <input type="hidden" name="action" value="edit">
                                                        </form>
                                                    </div>
                                                </td>
                                                <td class="align-middle col-1">
                                                    <div class="d-flex flex-wrap ">
                                                        <form action="book" class="flex-grow-1">
                                                            <input type="hidden" name="reportID" value="${rb.reportID}">
                                                            <input type="hidden" name="p" value="${p}">
                                                            <input type="hidden" name="tab" value="${tab}">
                                                            <c:if test="${rb.reportState == 'Process'}">
                                                                <button class="bg-success" name="action" value="Approved">Approved Report</button>
                                                                <button class="bg-danger" name="action" value="Denied">Denied Report</button>
                                                            </c:if>
                                                        </form>
                                                    </div>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <c:if test="${listSize>1}" > 
                                        <nav class="d-flex col-12" aria-label="Page navigation example">
                                            <ul class="pagination m-auto">
                                                <li class="page-item ${p-1<1?"disabled":""}">
                                                    <form action="book" class="page-link" ${p-1<1?"":"onclick='submit()'"}>
                                                        Previous
                                                        <input type="hidden" name="p" value="${p-1}">
                                                        <input type="hidden" name="tab" value="${tab}">
                                                        <input type="hidden" name="search" value="${search}">
                                                        <input type="hidden" name="action" value="upload">
                                                    </form>
                                                </li>                   
                                                <c:if test="${p-3 > 1}" >
                                                    <li class="page-item">
                                                        <form action="book" class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                                            1
                                                            <input type="hidden" name="p" value="${1}">
                                                            <input type="hidden" name="tab" value="${tab}">
                                                            <input type="hidden" name="search" value="${search}">
                                                            <input type="hidden" name="action" value="upload">
                                                        </form>
                                                    </li>
                                                    <li class="page-item">
                                                        <form class="btn disabled "  >
                                                            ...
                                                        </form>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="${p-3>0?p-3:1}" end="${listSize}" varStatus="c" >
                                                    <c:if test="${c.count<=7}">
                                                        <li class="page-item">
                                                            <form action="book" class="page-link ${c.index == p ? "orange-active":""}"  ${c.index==p?"":"onclick='submit()'"}>
                                                                ${c.index}
                                                                <input type="hidden" name="p" value="${c.index}">
                                                                <input type="hidden" name="tab" value="${tab}">
                                                                <input type="hidden" name="search" value="${search}">
                                                                <input type="hidden" name="action" value="upload">
                                                            </form>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${p+3 <listSize}" >
                                                    <li class="page-item">
                                                        <form class="btn disabled "  >
                                                            ...
                                                        </form>
                                                    </li>
                                                    <li class="page-item">
                                                        <form action="book" class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                                            ${listSize}
                                                            <input type="hidden" name="p" value="${listSize}">
                                                            <input type="hidden" name="search" value="${search}">
                                                            <input type="hidden" name="tab" value="${tab}">
                                                            <input type="hidden" name="action" value="upload">
                                                        </form>
                                                    </li>
                                                </c:if>
                                                <li class="page-item ${p+1>listSize?"disabled":""}">
                                                    <form action="book" class="page-link " ${p+1>listSize?"":"onclick='submit()'"} >
                                                        Next
                                                        <input type="hidden" name="p" value="${p+1}">
                                                        <input type="hidden" name="tab" value="${tab}">
                                                        <input type="hidden" name="search" value="${search}">
                                                        <input type="hidden" name="action" value="upload">
                                                    </form>
                                                </li>
                                            </ul>
                                        </nav>
                                    </c:if>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="admin_manage_content" > 
                                <div class="top_title row d-flex flex-wrap">
                                    <form action="book" class="col-12 row" id="search" action="book" >
                                        <input class="col-9" type="text" name="search" value="${search}">
                                        <input type="hidden" name="tab" value="${tab}">
                                        <input type="hidden" name="action" value="upload">
                                        <input class="col" type="submit" value="Search">
                                    </form>
                                </div>
                                <div style="width: 100%" >
                                    <!--${userList}-->
                                    <table class="bookz_list table table-bordered table-striped p-0">
                                        <tr class="col-12 bg-dark text-light ">
                                            <th class="align-middle text-center ">No.</th>
                                            <!--<th class="col-1"><img class=" align-self-center w-100 border border-dark""style="aspect-ratio: 190 / 285;" alt=""></th>-->
                                            <th class="align-middle text-center">
                                                Avatar
                                            </th>
                                            <th class="align-middle text-center"><b>UserID</b> </th>                                        
                                            <th class="align-middle text-center"><b>Last Name</b> </th>                                        
                                            <th class="align-middle text-center"><b>First Name</b> </th>                                        
                                            <th class="align-middle text-center"><b>Birth Day</b> </th>
                                            <th class="align-middle text-center"><b>Email</b> </th>
                                            <th class="align-middle text-center"><b>Books Upload </b></th>
                                            <th class="align-middle text-center"><b>Member Role </b></th>

                                            <th class="align-middle text-center bg-secondary">
                                                User Setting
                                            </th>       
                                            <th class="align-middle text-center bg-secondary">
                                                <form action="manage">
                                                    Role Change
                                                </form>
                                            </th>       
                                        </tr>
                                        <c:forEach items="${userList}" var="u" varStatus="c" begin="${p*10-10}" end="${p*10-1}">
                                            <tr class="col-12 book_ ">
                                                <td class="align-middle text-center ">${c.index+1}</td>
                                                <!--<td class="col-1"><img class=" align-self-center w-100 border border-dark""style="aspect-ratio: 190 / 285;" alt=""></td>-->
                                                <td class="col-1">
                                                    <img class="p-1 d-block w-100" src="${u.avatar}" style="aspect-ratio: 1 / 1; border: 2px solid gray;" alt="">
                                                </td>
                                                <td class="align-middle col-1"> ${u.memberID}</td>                                        
                                                <td class="align-middle col-2"> ${u.lastname} </td>                                        
                                                <td class="align-middle col-1"> ${u.firstname}</td>                                        
                                                <td class="align-middle col-1 text-nowrap" > ${u.birthday}</td>
                                                <td class="align-middle col-2"> ${u.email}</td>
                                                <td class="align-middle col-1"> ${u.noUploadBook}</td>
                                                <td class="align-middle col-1"> ${u.role}</td>

                                                <td class="align-middle text-center col-1">
                                                    <c:if test="${u.memberID eq login.memberID}">
                                                        <form action="profileInformation.jsp">
                                                            <button class="bg-success">User Profile</button>
                                                        </form>
                                                    </c:if> 
                                                    <c:if test="${u.memberID ne login.memberID}">
                                                        <c:if test="${u.role eq 'banned'}">
                                                            <form action="manage">
                                                                <button class="bg-success">UNBAN</button>
                                                                <input type="hidden" name="userid" value="${u.memberID}">
                                                                <input type="hidden" name="role" value="user">
                                                                <input type="hidden" name="search" value="${search}">
                                                                <input type="hidden" name="action" value="changerole">
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${u.role ne 'banned'}">
                                                            <form action="manage">
                                                                <button class="bg-danger">BAN</button>
                                                                <input type="hidden" name="userid" value="${u.memberID}">
                                                                <input type="hidden" name="role" value="banned">
                                                                <input type="hidden" name="search" value="${search}">
                                                                <input type="hidden" name="action" value="changerole">
                                                            </form>
                                                        </c:if>
                                                    </c:if>   
                                                </td>       
                                                <td class="align-middle text-center col-1">
                                                    <c:if test="${u.memberID ne login.memberID}">
                                                        <c:if test="${u.role eq 'user'}">
                                                            <form action="manage">
                                                                <button class="bg-light">Set Role Admin</button>
                                                                <input type="hidden" name="userid" value="${u.memberID}">
                                                                <input type="hidden" name="role" value="admin">
                                                                <input type="hidden" name="search" value="${search}">
                                                                <input type="hidden" name="action" value="changerole">
                                                            </form>
                                                        </c:if>
                                                        <c:if test="${u.role eq 'admin'}">
                                                            <form action="manage">
                                                                <button class="bg-warning">Remove Admin</button>
                                                                <input type="hidden" name="userid" value="${u.memberID}">
                                                                <input type="hidden" name="role" value="user">
                                                                <input type="hidden" name="search" value="${search}">
                                                                <input type="hidden" name="action" value="changerole">
                                                            </form>
                                                        </c:if> 
                                                    </c:if>   

                                                </td>       
                                            </tr>
                                        </c:forEach>
                                    </table>
                                    <c:if test="${listSize>1}"> 
                                        <nav class="d-flex col-12" aria-label="Page navigation example">
                                            <ul class="pagination m-auto">
                                                <li class="page-item ${p-1<1?"disabled":""}">
                                                    <form action="book"  class="page-link" ${p-1<1?"":"onclick='submit()'"}>
                                                        Previous
                                                        <input type="hidden" name="p" value="${p-1}">
                                                        <input type="hidden" name="tab" value="${tab}">
                                                        <input type="hidden" name="search" value="${search}">
                                                        <input type="hidden" name="action" value="upload">
                                                    </form>
                                                </li>                   
                                                <c:if test="${p-3 > 1}" >
                                                    <li class="page-item">
                                                        <form action="book"  class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                                            1
                                                            <input type="hidden" name="p" value="${1}">
                                                            <input type="hidden" name="tab" value="${tab}">
                                                            <input type="hidden" name="action" value="upload">
                                                            <input type="hidden" name="search" value="${search}">
                                                        </form>
                                                    </li>
                                                    <li class="page-item">
                                                        <form action="book"  class="btn disabled "  >
                                                            ...
                                                        </form>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="${p-3>0?p-3:1}" end="${listSize}" varStatus="c" >
                                                    <c:if test="${c.count<=7}">
                                                        <li class="page-item">
                                                            <form action="book"  class="page-link ${c.index == p ? "orange-active":""}"  ${c.index==p?"":"onclick='submit()'"}>
                                                                ${c.index}
                                                                <input type="hidden" name="p" value="${c.index}">
                                                                <input type="hidden" name="tab" value="${tab}">
                                                                <input type="hidden" name="action" value="upload">
                                                                <input type="hidden" name="search" value="${search}">
                                                            </form>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${p+3 < listSize}" >
                                                    <li class="page-item">
                                                        <form action="book"  class="btn disabled "  >
                                                            ...
                                                        </form>
                                                    </li>
                                                    <li class="page-item">
                                                        <form action="book"  class="page-link ${c.index == p ? "orange-active":""}"  onclick="submit()">
                                                            ${listSize}
                                                            <input type="hidden" name="p" value="${listSize}">
                                                            <input type="hidden" name="search" value="${search}">
                                                            <input type="hidden" name="tab" value="${tab}">
                                                            <input type="hidden" name="action" value="upload">
                                                        </form>
                                                    </li>
                                                </c:if>
                                                <li class="page-item ${p+1>listSize?"disabled":""}">
                                                    <form action="book"  class="page-link " ${p+1>listSize?"":"onclick='submit()'"} >
                                                        Next
                                                        <input type="hidden" name="p" value="${p+1}">
                                                        <input type="hidden" name="search" value="${search}">
                                                        <input type="hidden" name="tab" value="${tab}">
                                                        <input type="hidden" name="action" value="upload">
                                                    </form>
                                                </li>
                                            </ul>
                                        </nav>
                                    </c:if>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:catch>${ex}
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>