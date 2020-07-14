<%-- 
    Document   : user1
    Created on : Jun 30, 2020, 9:30:42 PM
    Author     : se130
--%>

<%@page import="dto.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
          <%
            UserDTO login_user = (UserDTO) session.getAttribute("NAME");
            if (login_user == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <h1>Welcome: ${sessionScope.NAME}</h1>
        <a href="MainController?action=Logout" >Logout</a><br/>
        <a href="cart1.jsp">View your cart</a>
        
              <form action="MainController" method="POST">
                    Book Name <input type="text" name="txtSearch1"/><br/>
                    <input type="submit" name="action" value="Search_Book"/>
                </form>
              <c:if test="${requestScope.INFO !=null}">
            <c:if test="${not empty requestScope.INFO}" var="checkList">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Book ID</th>
                            <th>Book Name</th>
                            <th>Author</th>
                            <th>Category</th>
                            <th>Publishing House</th>
                            <th>Publishing Year</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Add</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${requestScope.INFO}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${dto.bookID}</td>
                                <td>${dto.bookName}</td>
                                <td>${dto.authorName}</td>
                                <td>${dto.caID}</td>
                                <td>${dto.phID}</td>
                                <td>${dto.publishingYear}</td>
                                <td>${dto.quantity}</td>
                                <td>${dto.price}</td>                             
                                   <td>
                                    <form action="MainController" method="POST">
                                        <input type="hidden" name="bookID" value="${dto.bookID}"/>
                                        <input type="hidden" name="bookName" value="${dto.bookName}"/>
                                        <input type="hidden" name="authorName" value="${dto.authorName}"/>
                                        <input type="hidden" name="caID" value="${dto.caID}"/>
                                        <input type="hidden" name="phID" value="${dto.phID}"/>
                                        <input type="hidden" name="publishingYear" value="${dto.publishingYear}"/>
                                        <input type="hidden" name="quantity" value="${dto.quantity}"/>
                                        <input type="hidden" name="price" value="${dto.price}"/>
                                        <input type="submit" name="action" value="AddToCart"/>
                                    </form>
                                </td>                              
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${!checkList}">
                No record
            </c:if>
        </c:if>
                
                
              <c:if test="${requestScope.GETALL !=null}">
                  <c:if test="${not empty requestScope.GETALL}" >
                      <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Book ID</th>
                            <th>Book Name</th>
                            <th>Author</th>
                            <th>Category</th>
                            <th>Publishing House</th>
                            <th>Publishing Year</th>
                            <th>Quantity</th>
                            <th>Price</th>     
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${requestScope.GETALL}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${dto.bookID}</td>
                                <td>${dto.bookName}</td>
                                <td>${dto.authorName}</td>
                                <td>${dto.caID}</td>
                                <td>${dto.phID}</td>
                                <td>${dto.publishingYear}</td>
                                <td>${dto.quantity}</td>
                                <td>${dto.price}</td>
                                <td>
                                    <form action="MainController" method="POST">
                                        <input type="hidden" name="bookID" value="${dto.bookID}"/>
                                        <input type="hidden" name="bookName" value="${dto.bookName}"/>
                                        <input type="hidden" name="authorName" value="${dto.authorName}"/>
                                        <input type="hidden" name="caID" value="${dto.caID}"/>
                                        <input type="hidden" name="phID" value="${dto.phID}"/>
                                        <input type="hidden" name="publishingYear" value="${dto.publishingYear}"/>
                                        <input type="hidden" name="quantity" value="${dto.quantity}"/>
                                        <input type="hidden" name="price" value="${dto.price}"/>
                                        <input type="submit" name="action" value="AddToCart"/>
                                    </form>                                    
                                </td>                               
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                  </c:if>
              </c:if>
                
                
    </body>
</html>
