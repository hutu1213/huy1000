<%-- 
    Document   : index
    Created on : Feb 21, 2020, 7:23:51 PM
    Author     : ngochuu
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/5a401084f7.js" crossorigin="anonymous"></script>
        <title>Admin Page</title>
    </head>
    <body>
        
        <%@include file="headerAdmin.jsp" %>
        <%
            UserDTO login_user = (UserDTO) session.getAttribute("NAME");
            if (login_user == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <div class="container-fluid"> 
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">

                            <form action="MainController" method="POST" class="form-signin">
                                <input type="text" name="txtSearch" placeholder="Name" class="mb-3 mr-3"/>
                                <input type="submit" name="action" value="Search" class="mb-3"/>
                            </form>

                            <c:if test="${requestScope.INFO != null}">
                                <c:if test="${not empty requestScope.INFO}" var="checkList">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>  
                                                <th style="width: 10%; text-align: center;">Book ID</th>
                                                <th style="width: 15%; text-align: center;">Book Name</th>
                                                <th style="width: 10%; text-align: center;">Author</th>
                                                <th style="width: 10%; text-align: center;">Category</th>
                                                <th style="width: 15%; text-align: center;">Publishing House</th>
                                                <th style="width: 10%; text-align: center;">Publishing Year</th>
                                                <th style="width: 10%; text-align: center;">Quantity</th>
                                                <th style="width: 10%; text-align: center;">Price</th>
                                                <th style="width: 10%; text-align: center;"></th>    
                                                <th style="width: 10%; text-align: center;"></th> 
                                            </tr>
                                        </thead>

                                            <c:forEach var="dto" items="${requestScope.INFO}" >
                                            <tr>
                                                <td style="text-align: center;">${dto.bookID }</td>
                                                <td style="text-align: center;">${dto.bookName}</td>
                                                <td style="text-align: center;">${dto.authorName}</td>
                                                <td style="text-align: center;">${dto.caID}</td>
                                                <td style="text-align: center;">${dto.publishingHouse}</td>
                                                <td style="text-align: center;">${dto.publishingYear}</td>
                                                <td style="text-align: center;">${dto.quantity}</td>
                                                <td style="text-align: center;">${dto.price}</td>
                                                <td>
                                                    <c:url var="deleteLink" value="MainController">
                                                        <c:param name="action" value="Delete"/>
                                                        <c:param name="id" value="${dto.bookID}"/>
                                                          <c:param name="txtSearch" value="${param.txtSearch}" />
                                                        </c:url><a href="${deleteLink}">Delete</a>
                                                </td>
                                                <td>
                                                    <c:url var="updateLink" value="MainController">
                                                        <c:param name="action" value="Update  "/>
                                                        <c:param name="bookId" value="${dto.bookID}"/>
                                                        <c:param name="bookName" value="${dto.bookName}"/>
                                                        <c:param name="authorName" value="${dto.authorName}"/>
                                                        <c:param name="caID" value="${dto.caID}"/>
                                                        <c:param name="publishingHouse" value="${dto.publishingHouse}"/>
                                                        <c:param name="publishingYear" value="${dto.publishingYear}"/>
                                                        <c:param name="quantity" value="${dto.quantity}"/>
                                                        <c:param name="price" value="${dto.price}"/>
                                                        <c:param name="txtSearch" value="${param.txtSearch}" />
                                                    </c:url><a href="${updateLink}">Update</a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                    </table>
                                </c:if>
                                <c:if test="${!checkList}">
                                    No record found
                                </c:if>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
