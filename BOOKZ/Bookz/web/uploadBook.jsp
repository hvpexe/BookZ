<%-- 
    Document   : uploadBook.jsp
    Created on : Jul 3, 2022, 1:41:04 PM
    Author     : Admin
--%>

<%@page import="com.demo.DAOS.*"%>
<%@page import="com.demo.DTOs.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${action=='update'&&(login==null||login.role!='admin')}">
    <c:redirect url="home.jsp"></c:redirect>
</c:if>
<html>
    <head>
        <title>Welcome to Bookz Upload pages</title>
        <c:import url="index.html"/>
    </head>
    <body>
        <c:import url="header.jsp"/>
        <div class="section d-flex align-items-stretch justify-content-around col-md-11 col-sm-12">

            <% List<Category> catelist = new CategoryDAO().cateList();%>
            <div class="col-md-9">
                <div class="top_title">
                    <div class="section_title text-center " id="book_upload-title">
                        <c:choose >
                            <c:when test="${action=='update'}">
                                Let's Update The Book <i class="fa-book fa-solid"></i>
                            </c:when>
                            <c:otherwise>
                                Let's Upload A Book <i class="fa-book fa-solid"></i>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <form class="col-12"  id="book_upload" action="book" method="post" enctype="multipart/form-data">
                        <div class="col-12 row" >
                            <section class="col-md-4 text-center">
                                <div class="upload-img">
                                    <img id="output" ${cc.cover!=null?"src='":""}${coverimg}${"'"} />
                                </div>
                                <label for="filepdf" class="font-weight-bold">Book Cover:</label>
                                <input value="${cc.cover}" onchange="loadFile(event)" style="width: 100px" type="file" accept="image/*" 
                                       ${cc.cover==null?"required":""} name='cover'>
                                <input type="hidden" name="coverimg">
                            </section>
                            <section class="col-md-8">
                                <div class="col-12">
                                    <label for="filepdf">File PDF:</label>
                                    <div style="width: 70%;">
                                        <input value="" class="" type="file" onchange="check()" name="filepdf"  
                                               accept="application/pdf" value="upload" style="width: 100px;">
                                        <span id='FilePDF_File'>${cc.filePDF==null?"empty":cc.filePDF}</span>
                                    </div>

                                </div>
                                <div class="col-12">
                                    <label for="fileepub">File EPUB:</label>
                                    <div style="width: 70%;">
                                        <input class="" type="file" onchange="check()" name="fileepub" 
                                               accept=".epub" value="upload" style="width: 100px;">
                                        <span id='FileEPUB_File'>${cc.fileEpub==null?"empty":cc.fileEpub}</span>
                                    </div>
                                </div>
                                <input type="hidden" name="bookid" value="${cc.bookID}"> 
                                <div class="col-12"><label for="title"  ><i class="fa-solid fa-star"></i>Title of Book:</label>
                                    <input value="${cc.title}" class="form-control" type="text" name="title" ${cc.title==null?"required":""}>
                                </div>
                                <div class="col-12"><label for="author" data-info="sas"><i class="fa-solid fa-star"></i>Author:</label>
                                    <input value="${cc.author}" class="form-control" type="text" name="author" ${cc.author==null?"required":""}>
                                </div>
                                <div class="col-12"><label for="publisher">Publisher:</label>
                                    <input value="${cc.publisher}" class="form-control" type="text" name="publisher">
                                </div>
                                <div class="col-12">
                                    <label for="language">Language:</label>
                                    <select name="language" class="form-control" data-placeholder="Choose a Language...">

                                        <option value="Afrikaans">Afrikaans</option>
                                        <option value="Albanian">Albanian</option>
                                        <option value="Arabic">Arabic</option>
                                        <option value="Armenian">Armenian</option>
                                        <option value="Basque">Basque</option>
                                        <option value="Bengali">Bengali</option>
                                        <option value="Bulgarian">Bulgarian</option>
                                        <option value="Catalan">Catalan</option>
                                        <option value="Cambodian">Cambodian</option>
                                        <option value="Chinese (Mandarin)">Chinese (Mandarin)</option>
                                        <option value="Croatian">Croatian</option>
                                        <option value="Czech">Czech</option>
                                        <option value="Danish">Danish</option>
                                        <option value="Dutch">Dutch</option>
                                        <option value="English">English</option>
                                        <option value="Estonian">Estonian</option>
                                        <option value="Fiji">Fiji</option>
                                        <option value="Finnish">Finnish</option>
                                        <option value="French">French</option>
                                        <option value="Georgian">Georgian</option>
                                        <option value="German">German</option>
                                        <option value="Greek">Greek</option>
                                        <option value="Gujarati">Gujarati</option>
                                        <option value="Hebrew">Hebrew</option>
                                        <option value="Hindi">Hindi</option>
                                        <option value="Hungarian">Hungarian</option>
                                        <option value="Icelandic">Icelandic</option>
                                        <option value="Indonesian">Indonesian</option>
                                        <option value="Irish">Irish</option>
                                        <option value="Italian">Italian</option>
                                        <option value="Japanese">Japanese</option>
                                        <option value="Javanese">Javanese</option>
                                        <option value="Korean">Korean</option>
                                        <option value="Latin">Latin</option>
                                        <option value="Latvian">Latvian</option>
                                        <option value="Lithuanian">Lithuanian</option>
                                        <option value="Macedonian">Macedonian</option>
                                        <option value="Malay">Malay</option>
                                        <option value="Malayalam">Malayalam</option>
                                        <option value="Maltese">Maltese</option>
                                        <option value="Maori">Maori</option>
                                        <option value="Marathi">Marathi</option>
                                        <option value="Mongolian">Mongolian</option>
                                        <option value="Nepali">Nepali</option>
                                        <option value="Norwegian">Norwegian</option>
                                        <option value="Persian">Persian</option>
                                        <option value="Polish">Polish</option>
                                        <option value="Portuguese">Portuguese</option>
                                        <option value="Punjabi">Punjabi</option>
                                        <option value="Quechua">Quechua</option>
                                        <option value="Romanian">Romanian</option>
                                        <option value="Russian">Russian</option>
                                        <option value="Samoan">Samoan</option>
                                        <option value="Serbian">Serbian</option>
                                        <option value="Slovak">Slovak</option>
                                        <option value="Slovenian">Slovenian</option>
                                        <option value="Spanish">Spanish</option>
                                        <option value="Swahili">Swahili</option>
                                        <option value="Swedish">Swedish</option>
                                        <option value="Tamil">Tamil</option>
                                        <option value="Tatar">Tatar</option>
                                        <option value="Telugu">Telugu</option>
                                        <option value="Thai">Thai</option>
                                        <option value="Tibetan">Tibetan</option>
                                        <option value="Tonga">Tonga</option>
                                        <option value="Turkish">Turkish</option>
                                        <option value="Ukrainian">Ukrainian</option>
                                        <option value="Urdu">Urdu</option>
                                        <option value="Uzbek">Uzbek</option>
                                        <option value="Vietnamese" selected="">Vietnamese</option>
                                        <option value="Welsh">Welsh</option>
                                        <option value="Xhosa">Xhosa</option>
                                        <script>
                                            document.querySelector("option[value=${cc.language}]").selected = true;
                                        </script>
                                    </select>
                                </div>
                                <div class="col-12"><label for="category">Category:</label>
                                    <select class="form-control" type="text" name="category">
                                        <c:forEach items="<%=catelist%>" var="cate">
                                            <option class=" " value="${cate.categoryID}"><c:out value="${cate.categoryName}"/></option>
                                        </c:forEach>
                                        <script>
                                            document.querySelector("option[value=${cc.categoryID}]").selected = true;
                                        </script>
                                    </select>
                                </div>
                                <div class="col-12"><label for="description">Description:</label>
                                    <textarea class="form-control" type="text" name="description" placeholder="Description...">${cc.description}</textarea>
                                </div>
                            </section>
                        </div>
                        <div class="col-12">
                            <div class="upload-btn row justify-content-end ">
                                <c:if test="${login.role == 'admin'}">
                                    <div class="col-6  d-flex align-items-center justify-content-center">
                                        <a href="book?action=upload" class="font-weight-bold">Back To DashBoard</a>
                                    </div>
                                </c:if>
                                <input name="action" type="hidden" value="${action}">
                                <div class="col-6 d-flex align-items-center justify-content-center"> 
                                    <button class="submit" type="submit" >${action.toUpperCase()}</button>
                                    <c:if test="${coverimg!=null}">
                                        ${update_status}
                                    </c:if>
                                </div>
                            </div>
                    </form>
                </div>
            </div>

        </div>


    </div>
    <c:import url="footer.jsp"></c:import>
    <script src="assets/js/uploadBook.js"></script>

</body>
</html>
