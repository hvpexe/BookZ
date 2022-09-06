<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<head>
    <script src="assets/js/mycode.js" type="text/javascript"></script>
</head>
<div id="headpage" class="header position-relative">
    <div class="header_content">
    </div>
    <div class="header_content fixed-top container-fluid d-flex text-center flex-wrap align-items-center">
        <div class="logo col-md-3 col-12 ">
            <a class="icon navbar-brand" href="home.jsp">
                <img class="img-fluid" id="icon" src="./assets/images/webimage/Logo_Bookz.png" alt="web_icon"></a>
        </div>
        <div class="searchbar col-md-6 col-12  d-flex justify-content-center">
            <form class="row col-md-12 col-sm-10" action="search" method="get" accept-charset='UTF-8'>
                <div class="input_field">
                    <input value="${search}" tabindex="0" class="input_text" onkeyup="showClearBtn(this)" type="text" placeholder="Search book (by name or author)" name="search">
                    <div type="button" role="button" class="clear-btn" onclick="clearSearch()" style="display: none;"><i class="fas fa-backspace"></i>
                    </div>
                    <button class="input_button" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
            </form>
        </div>
        <div class="right_section col-md-3 col-12 ">
            <div class="nav flex-nowrap">
                <div class="col " data-link="All Category"> 
                    <a class="nav-item nav-item-small" href="CategorySectionController" onmouseover="showAnchorInfomation(this)" onmouseout="hideAnchorInfomation(this)" ><i class="fa-solid fa-1x fa-list"></i></a> 
                </div>
                <c:set var="nav_anchor" value="About Us"></c:set>
                <c:set var="fa_logo" value="fa-circle-info"></c:set>
                <%--<c:if test="${login.role == 'admin'}">--%>
                <%--<c:set var="nav_anchor" value="User Management"></c:set>--%>
                <%--<c:set var="fa_logo" value="fa-user-group"></c:set>--%>
                <%--</c:if>--%>
                <div class="col " data-link="${nav_anchor}"> 
                    <a class="nav-item nav-item-small" href="aboutUs.jsp" onmouseover="showAnchorInfomation(this)" onmouseout="hideAnchorInfomation(this)" >  
                        <i class="fa-solid fa-1x ${fa_logo}"></i>
                    </a> 
                </div>
                <c:set var="nav_anchor" value="Upload A Book"></c:set>
                <c:set var="fa_logo" value="fa-cloud-arrow-up"></c:set>
                <c:if test="${login.role == 'admin'}">
                    <c:set var="nav_anchor" value="Admin Dashboard"></c:set>
                    <c:set var="fa_logo" value="fa-book-atlas"></c:set>
                </c:if>
                <div class="col " data-link="${nav_anchor}" > 
                    <a class="nav-item nav-item-small" href="./book?action=upload" onmouseover="showAnchorInfomation(this)" onmouseout="hideAnchorInfomation(this)">
                        <i class="fa-solid fa-1x ${fa_logo}"></i>
                    </a>
                </div>
                <c:if test="${login == null}">
                    <div class="col" data-link="Login & Register"  > 
                        <a class="nav-item nav-item-small " onmouseover="showAnchorInfomation(this)" onmouseout="hideAnchorInfomation(this)"  onclick="showLogin()" href="#">
                            <i class='fa-solid fa-1x fa-user'></i>
                        </a>
                    </div>
                </c:if>
                <c:if test="${login != null}">
                    <div class="col" id="user"> 
                        <a class="nav-item" >
                            <img src="${login.avatar}" class="d-inline-block" >
                        </a>
                        <div class="user_content">
                            <div class="list-group flex-column justify-content-start" href="#" >
                                <p class="list-group-item bg-success font-weight-bold">Welcome ${login.role} ${login.firstname}</p>
                                <a class="list-group-item text-dark text-decoration-none nav-item" href="./profileInformation.jsp"><div>Profile</div></a>
                                <a class="list-group-item text-dark text-decoration-none nav-item" href="logout"><div> Logout</div></a>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<c:if test="${login == null && (fail_login != null || fail_register !=null)}">
    <c:set value="style='display: block'" var="show" scope="request"></c:set>
</c:if> 
<div id="login" ${show} >
    <div class="gray_box"></div>
    <div class="login_box">
        <div class="white_box">
            <div class="x_button col-12 d-flex justify-content-end" onclick="showLogin()"><i class="fa-solid fa-circle-xmark"></i></div>
            <div class="top_bar">
                <div class="login-btn active">
                    Login
                </div>
                <div class="register-btn">
                    Register
                </div>
            </div>
            <c:set var="show_register" value="style='display: none;'"/>
            <c:set var="show_login" value="style='display: block;'"/>
            <c:if test="${fail_register != null}" >
                <c:set var="show_login" value="style='display: none;'"/>
                <c:set var="show_register" value="style='display: block;'"/>
            </c:if>
            <div id="login_form" ${show_login} >
                <form action="login" method="POST" accept-charset='UTF-8'>
                    <div> Email:</div>
                    <input type="email" name="email" placeholder="Enter Your Email" value="${cookie.email.value}" style="resize: none;">
                    <div class="text-danger font-weight-bold">${fail_email} </div>
                    <div> Password:</div>
                    <input type="password" name="password" placeholder="Enter Your Password" value="" style="resize: none;">
                    <div id="login_chat" class="text-danger font-weight-bold">${fail_login} </div>
                    <input type ="hidden" name="action" value="login">
                    <button type="submit">login</button>
                    <c:set var="fail_login" value="${null}"/>
                </form>
            </div>
            <div id="register_form" ${show_register} >
                <form action="login" method="POST" accept-charset='UTF-8' enctype="multipart/form-data" >
                    <div> Name:</div>
                    <input name="firstname"  placeholder="Firstname" required="" style="resize: none;">
                    <input name="lastname" placeholder="Lastname" style="resize: none;">
                    <div style="clear: both"> Email:</div>
                    <input name="email" type="email" placeholder="Enter Your Email" required="" style="resize: none;">
                    <div> Password:</div>
                    <input type="password" name="password" placeholder="Enter Your Password" required="" style="resize: none;">
                    <div> Confirm Password:</div>
                    <input type="password" name="cpassword" placeholder="Enter Your Password Again" required="" style="resize: none;">
                    <span>Avatar:</span>
                    <input name="avatar" placeholder="avt"  type="file">
                    <span>Gender:</span>
                    <select name="gender">
                        <option value="Male" selected >Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Others</option>
                    </select>
                    <div>BirthDate:</div>
                    <input name="birthday" type="date" placeholder="dd/mm/yyyy" required="" value="">
                    <div class="text-danger font-weight-bold">${fail_register} </div>
                    <input type ="hidden" name="action" value="register">
                    <button type="submit">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>