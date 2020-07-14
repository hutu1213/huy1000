<%-- 
    Document   : cart1
    Created on : Jul 2, 2020, 8:55:49 AM
    Author     : se130
--%>

<%@page import="dto.UserDTO"%>
<%@page import="dto.BookDTO"%>
<%@page import="dto.CartDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/5a401084f7.js" crossorigin="anonymous"></script>
        <title>Cart Page</title>
    </head>
    <body>
        <%
            UserDTO login_user = (UserDTO) session.getAttribute("NAME");
            if (login_user == null) {
                response.sendRedirect("index.jsp");
            }
        %>

        <%  CartDTO cart = (CartDTO) session.getAttribute("CART");
            double total = 0;
            if (cart != null) {
                if (cart.getCart().values().size() > 0) {

        %>

        <div class="container-fluid"> 
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th style="width: 10%; text-align: center;">ID</th>
                                        <th style="width: 10%; text-align: center;">Name</th>
                                        <th style="width: 10%; text-align: center;">Quantity</th>
                                        <th style="width: 10%; text-align: center;">Price</th> 
                                        <th style="width: 10%; text-align: center;">Total</th>
                                        <th style="width: 10%; text-align: center;">Delete</th>
                                        <th style="width: 10%; text-align: center;">Update</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <%                    for (BookDTO dto : cart.getCart().values()) {
                                            total += dto.getPrice() * dto.getQuantity();

                                    %>
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td style="text-align: center;"><%= dto.getBookID()%></td>
                                        <td style="text-align: center;"><%=dto.getBookName()%></td>
                                        <td style="text-align: center;">
                                            <input name="quantity" type="number" value="<%=dto.getQuantity()%>"/>
                                        </td>
                                        <td style="text-align: center;"><%= dto.getPrice()%></td>
                                        <td style="text-align: center;"><%=dto.getPrice() * dto.getQuantity()%></td>
                                        <%-- <td  class="active">         
                                             <input type="hidden" name="txtBookID" value="<%=dto.getBookID()%>"/>    
                                              <input type="submit" class="btn btn-block btn-warning" value="DeleteBookFromCart">     
                                         </td> --%>
                                        <td >
                                            <input type="hidden" name="txtBookID" value="<%=dto.getBookID() %>"/>    
                                            <input type="submit" class="btn btn-block btn-warning" name="action" value="DeleteBookFromCart">

                                        </td>
                                        <td style="text-align: center;">                       
                                            <input type="hidden" name="bookName" value="<%=dto.getBookName()%>"/> 
                                            <input type="hidden" name="authorName" value="<%=dto.getAuthorName()%>"/>
                                            <input type="hidden" name="caID" value="<%=dto.getCaID()%>"/>
                                            <input type="hidden" name="phID" value="<%=dto.getPublishingHouse() %>"/>
                                            <input type="hidden" name="publishingYear" value="<%=dto.getPublishingYear()%>"/>                                   
                                            <input type="hidden" name="price" value="<%=dto.getPrice()%>"/>
                                            <input type="submit" name="action" value="UpdateBookFromCart"/>
                                        </td>
                                    </tr>
                                </form>
                                <%                             }

                                } else {
                                %>
                                <h1>No items</h1>
<tr>
                                        <td colspan="2">
                                           
                                            <a href="user.jsp" class="btn btn-primary text-center">Come back to continue shopping </a>
                                        </td>
                                        
                                        
                                    </tr>
                                <%     return;
                                    }
                                } else {
                                %>
                                <h1>No items</h1>
                                <tr>
                                        <td colspan="2">
                                           
                                            <a href="user.jsp" class="btn btn-primary text-center">Come back to continue shopping </a>
                                        </td>
                                        
                                        
                                    </tr>
                                <%
                                        return;
                                    }
                                %>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="4"></td>
                                        <td class="text-center" colspan="1"><h3>Total:<%=total %></h3></td>
                                        
                                        <td> <form action="MainController" method="POST">
                                <input type="submit" name="action" value="CheckOut"/>
                            </form></td>
                                    </tr>

                                    <tr>
                                        <td colspan="2">
                                           
                                            <a href="user.jsp" class="btn btn-primary text-center">Come back to continue shopping </a>
                                        </td>
                                        
                                        
                                    </tr>
                                </tfoot>
                            </table>

              
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
