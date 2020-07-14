<%-- 
    Document   : userManager1
    Created on : Jul 13, 2020, 2:56:33 PM
    Author     : se130
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Manager Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/5a401084f7.js" crossorigin="anonymous"></script>
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
                                <input type="text" name="txtSearch123" placeholder="Name" class="mb-3 mr-3"/>
                                <input type="submit" name="action" value="Search User" class="mb-3"/>
                            </form>

                            <c:if test="${requestScope.USER_INFO != null}">
                                <c:if test="${not empty requestScope.USER_INFO}" var="checkList">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>  
                                                <th style="width: 10%; text-align: center;">User ID</th>
                                                <th style="width: 15%; text-align: center;">Full Name</th>
                                                 <th style="width: 10%; text-align: center;">Sex</th>
                                                <th style="width: 10%; text-align: center;">Address</th>
                                               <th style="width: 10%; text-align: center;">Email </th>
                                                
                                                <th style="width: 15%; text-align: center;">Role Name</th>
                                              <th style="width: 15%; text-align: center;">Password</th>
                                                <th style="width: 10%; text-align: center;">Phone</th>
                                              
                                                <th style="width: 10%; text-align: center;"></th>    
                                                
                                            </tr>
                                        </thead>

                                            <c:forEach var="dto" items="${requestScope.USER_INFO}" >
                                            <tr>
                                                <td style="text-align: center;">${dto.userID}</td>
                                                <td style="text-align: center;">${dto.fullName}</td>
                                                  <td style="text-align: center;">${dto.sex}</td>
                                                <td style="text-align: center;">${dto.address}</td>
                                                <td style="text-align: center;">${dto.email}</td>
                                                <td style="text-align: center;">${dto.roleID}</td>
                                              
                                                <td style="text-align: center;">${dto.password}</td>
                                                <td style="text-align: center;">${dto.phone}</td>
                                                <td>
                                                    <c:url var="deleteLink" value="MainController">
                                                        <c:param name="action" value="Delete_User"/>
                                                        <c:param name="txtUserID" value="${dto.userID}"/>
                                                          <c:param name="txtSearch123" value="${param.txtSearch123}" />
                                                        </c:url><a href="${deleteLink}">Delete</a>
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
