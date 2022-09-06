<%@page import="com.demo.DAOS.CategoryDAO"%>
<%@page import="com.demo.DAOS.BookDAO"%>
<%@page import="com.demo.DTOs.Book"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${bookdetail.title}</title>
        <jsp:include page="index.html"/>
        <link rel="stylesheet" type="text/css" href="./assets/css/bookDetail.css">
        <script src="assets/js/bookDetail.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="section container row">

            <!-- SECTION LEFT -->
            <aside class="section_left col-md-3 border-right">
                <article class="gallery-wrap"> 
                    <div class="img-big-wrap">
                        <div class="d-flex flex-wrap">
                            <div class="${bookdetail.isIsAccepted()?'w-100':'w-50'} text-center">
                                <c:if test="${sessionScope.login.role == 'admin'}">
                                    <form action="book">
                                    <button class="bg-warning w-75">Update</button>
                                    <input type="hidden" name="bookid" value="${bookdetail.bookID}">
                                    <input type="hidden" name="action" value="edit">
                                </form>
                                </c:if>

                                
                            </div>
                            <div class="w-50 text-center">
                                <c:if test="${!bookdetail.isIsAccepted()}">
                                    <td class="align-middle text-center">
                                        <form action="book" >
                                            <button class="bg-success w-75">Accept</button>
                                            <input type="hidden" name="bookid" value="${bookdetail.bookID}">
                                            <input type="hidden" name="action" value="accept">
                                        </form>
                                    </td>
                                </c:if>
                            </div>
                        </div>
                        <a href="${bookdetail.cover}"><img src="${bookdetail.cover}"></a>
                    </div> 
                </article> <!-- gallery-wrap .end// -->
                <article class ="col-md-12">
                    <div class ="button">
                        <div>
                            <!--comment: neu pdf la null thi ko hien button pdf-->
                            <!--comment: neu Epub la null thi ko hien button Epub-->
                            <br>
                            <c:if test="${bookdetail.filePDF != null}">
                                <a href="${bookdetail.filePDF}" download onclick="return downloadWarning(this)"
                                   class="btn btn-lg btn-primary position-relative btn-block text-uppercase" 
                                   style="background-color: orangered">Download PDF
                                    <div class="bubble position-absolute">
                                        User Need To Login To Download 
                                    </div>
                                </a>
                            </c:if>
                            <c:if test="${bookdetail.fileEpub != null}">
                                <a href="${bookdetail.fileEpub}" download onclick="return downloadWarning(this)"
                                   class="btn btn-lg btn-primary position-relative btn-block text-uppercase" 
                                   style="background-color: orangered">Download EPUB
                                    <div class="bubble position-absolute">
                                        User Need To Login To Download 
                                    </div>
                                </a>
                            </c:if>
                            <form id="download_book" class="d-none" action="book" method="post">
                                <input type="hidden" name="action" value="download">
                                <input type="hidden" name="memberid" value="${login.memberID}">
                                <input type="hidden" name="bookid" value="${param.bookid}">
                            </form>
                            <button class="open-button" onclick="checkReport();">Something Wrong? <br> Write a report!</button>
                            <!--<a href="#" class="btn btn-lg btn-primary btn-block"> Something Wrong? Write a report! </a>-->
                        </div>
                    </div> <!-- download button.// -->
                </article>
            </aside>    
            <!-- SECTION RIGHT -->
            <aside class="book-container section_right col-md-9">
                <article class="card-body p-5">
                    <h3 class="title mb-3">${bookdetail.title}</h3>
                    <div class="d-flex">
                        <div class="col-10 col-sm-7"> 
                            <%Book bookdetail = (Book) request.getAttribute("bookdetail");
                                String cateName = CategoryDAO.getCategoryName(bookdetail.getCategoryID());
                            %>
                            <div><b>Author: </b>${bookdetail.author}</div>
                            <div><b>Publisher </b>${bookdetail.publisher}</div>
                            <div><b>Language: </b>${bookdetail.language}</div>
                            <div><b>Category: </b><%=cateName%></div>
                        </div>
                        <div class ="col-2 col-sm">
                            <div><i class="fa-solid fa-download"></i><b>Download:</b>&nbsp; ${bookdetail.noDownloads}</div>
                            <div><i class="fa-solid fa-clock"></i><b>Date upload:</b>&nbsp; ${bookdetail.dateUpload}</div>
                            <div><i class="fa-solid fa-user"></i><b>UserID upload:</b>&nbsp; ${bookdetail.getMemberUpload()}</div>
                        </div>
                    </div>
                    <hr>

                    <dl class="item-property col-md-10">
                        <dt>Description</dt><dd>
                            <p>${bookdetail.description}</p></dd>
                    </dl>
                    <hr  width="100%"/>
                    <div class="col-md-6 row m-auto">
                        <c:catch var="cooo">
                            <div class="rating-overall col-4 m-auto">
                                <div>${rsc.outOfFive>0?rsc.outOfFive:'0'}</div>
                                <div>out of 5</div>
                            </div>
                        </c:catch>
                        <div class="rating-chart col-8">
                            <div class="d-flex align-items-center">
                                <div class="fa-star star-5"></div>
                                <progress class="col-12" value="${rsc.s5}" max="${rsc.sTotal}"></progress> ${rsc.s5} 
                            </div>
                            <div class="d-flex align-items-center">
                                <div class="fa-star star-4"></div>
                                <progress class="col-12" value="${rsc.s4}" max="${rsc.sTotal}"></progress> ${rsc.s4}  
                            </div>
                            <div class="d-flex align-items-center ">
                                <div class="fa-star star-3"></div>
                                <progress class="col-12" value="${rsc.s3}" max="${rsc.sTotal}"></progress> ${rsc.s3}  
                            </div>
                            <div class="d-flex align-items-center ">
                                <div class="fa-star star-2"></div>
                                <progress class="col-12" value="${rsc.s2}" max="${rsc.sTotal}"></progress> ${rsc.s2}  
                            </div>
                            <div class="d-flex align-items-center ">
                                <div class="fa-star star-1"></div>
                                <progress class="col-12" value="${rsc.s1}" max="${rsc.sTotal}"></progress> ${rsc.s1}  
                            </div>
                        </div> 
                        <div id="rating" class="col m-auto" style="font-size: 1.5em;">
                            <span>Click To Rate:</span>
                            <span class="rate-star position-relative fa-star d-inline-flex star-0">
                                <div class="position-absolute" style="--i:1;" onmouseover="changeStar(this);" onmouseout="changeStar0(this)" onclick="rateStar(this)">1</div>
                                <div class="position-absolute" style="--i:2;" onmouseover="changeStar(this);" onmouseout="changeStar0(this)" onclick="rateStar(this)">2</div>
                                <div class="position-absolute" style="--i:3;" onmouseover="changeStar(this);" onmouseout="changeStar0(this)" onclick="rateStar(this)">3</div>
                                <div class="position-absolute" style="--i:4;" onmouseover="changeStar(this);" onmouseout="changeStar0(this)" onclick="rateStar(this)">4</div>
                                <div class="position-absolute" style="--i:5;" onmouseover="changeStar(this);" onmouseout="changeStar0(this)" onclick="rateStar(this)">5</div>
                            </span>
                        </div>
                    </div> 
                    <form class="comment_box form-text" action="rate" method="post">
                        <textarea class="col-md-10 pt-2 pb-5 m-auto d-block" name="comment" placeholder="Comment... " onkeyup="checkEnter(event, this)"
                                  tabindex="0" onkeypress="return !(event.keyCode === 13 && !event.shiftKey)"></textarea>
                        <input type="hidden" required name="rate" value="">
                        <input type="hidden" required name="bookid" value="${param.bookid}">
                        <input type="hidden" required name="action" value="comment">
                        <div id="comment_warning" class="text-danger col-md-10 m-auto p-0"></div>
                    </form>
                </article> <!-- card-body.// -->
                <div class="row col-12">
                    <div class="top_title">
                        <div class="section_title font-weight-bold">TOP COMMENTS</div>
                    </div>
                    <hr>

                    <section>
                        <c:catch var="e">

                            <jsp:include page="rate">
                                <jsp:param name="action" value="loadcomment"/>
                            </jsp:include>
                        </c:catch>
                        ${e}
                        <c:forEach items="${ratmem_list}" var="rm" varStatus="">
                            <div class="comment  col d-flex pt-2 flex-wrap">
                                <div class="col-12 p-0">
                                    <img class="img-thumbnail" src="${rm.member.avatar}" alt="${rm.member.avatar}" width="50" height="50"/>
                                    <b><a href="#" class="text-dark">${rm.member.lastname} ${rm.member.firstname}</a> </b><i class="fas fa-user"></i> 
                                    <span class="text-capitalize">${rm.member.role} - ${rm.rating.dateRating} - <span class="star-${rm.rating.star} fa-star"></span> </span>  
                                    <c:set var="allow" value="${login.memberID==rm.member.memberID}"/>
                                    <c:if test="${allow || login.role=='admin'}">
                                        <div class="comment-button position-relative d-inline-block w-25 float-right">
                                            <button class="btn btn-light border float-right" type="button" data-toggle="collapse" data-target="#collapse${rm.rating.ratingID}" aria-expanded="false" aria-controls="collapse${rm.rating.ratingID}">
                                                ...
                                            </button>
                                            <div class="position-absolute" style="z-index: 1;right:0;top: 100%;">
                                                <div class="collapse page-section " id="collapse${rm.rating.ratingID}">
                                                    <input type="submit" value="Delete Comment" form="delete${rm.rating.ratingID}" class="page-link page-item">
                                                    <c:if test="${allow}">
                                                        <button class="page-link page-item w-100" onclick="show('edit${rm.rating.ratingID}')">Edit Comment</button>
                                                    </c:if>
                                                    <form name="delete${rm.rating.ratingID}" action="rate" method="post" id="delete${rm.rating.ratingID}">
                                                        <input type="hidden" name="memberid" value="${rm.member.memberID}">
                                                        <input type="hidden" name="rateid" value="${rm.rating.ratingID}">
                                                        <input type="hidden" name="bookid" value="${param.bookid}">
                                                        <input type="hidden" name="action" value="deletecomment">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>  
                                <div class="border-left position-relative border-dark p-2 ml-3 mt-2 col-12" 
                                     style="font-size: 0.9em;min-height: 100px;z-index: 0; ">
                                    <span>${rm.rating.comment}</span>
                                    <c:if test="${allow}">
                                        <form action="rate" method="POST" id= "edit${rm.rating.ratingID}" name="edit${rm.rating.ratingID}">
                                            <input type="hidden" name="memberid" value="${rm.member.memberID}">
                                            <input type="hidden" name="bookid" value="${param.bookid}">
                                            <input type="hidden" name="rateid" value="${rm.rating.ratingID}">
                                            <input type="hidden" name="action" value="editcomment">
                                        </form>
                                        <textarea form="edit${rm.rating.ratingID}" name="edit"
                                                  style="display: none"
                                                  class="col-12 p-2 position-absolute"
                                                  onkeypress="return !(event.keyCode === 13 && !event.shiftKey)"
                                                  onkeyup="checkEnterForEdit(event, this, '${rm.rating.ratingID}')"
                                                  >${rm.rating.comment}</textarea>
                                    </c:if>
                                </div>

                            </div>
                            <hr>
                        </c:forEach>
                    </section>
                </div>
            </aside> 
        </div>

        <div class="form-popup" id="myForm">
            <form action="ReportBookController" class="form-container">
                <h1>Report</h1>
                <label for="typeReport"><b>Type report</b></label>
                <select name="typeReport" required placeholder="select type">
                    <option value="Remove the book (spam, inappropriate file)">Remove the book (spam, inappropriate file</option>
                    <option value="Damaged File">Damaged File</option>
                    <option value="Broken link">Broken link</option>
                    <option value="Wrong book information">Wrong book information</option>
                    <option value="Other problem" selected="">Other problem</option>
                </select>
                <label for="detail"><b></b></label>
                <textarea placeholder="What's wrong with this book?" name="detail" rows="4" cols="50" required=""></textarea>
                <input type="hidden" name="memberID" value="${sessionScope.login.memberID}">
                <input type="hidden" name="bookID" value="${requestScope.bookdetail.bookID}">
                <button type="submit" class="btn" name="action" value="report">submit</button>
                <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
            </form>
        </div> 
        <jsp:include page="footer.jsp"/>
    </body>
</html>