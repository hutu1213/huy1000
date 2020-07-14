<%-- 
    Document   : create
    Created on : Jun 30, 2020, 10:19:36 AM
    Author     : se130
--%>

<%@page import="dto.ErrorBookDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        <%
             
            UserDTO login_user = (UserDTO) session.getAttribute("NAME");
            if (login_user == null) {
                response.sendRedirect("index.jsp");
            }
        
            ErrorBookDTO errorDTO = (ErrorBookDTO) request.getAttribute("ERROR");
            if (errorDTO == null) {
                errorDTO = new ErrorBookDTO("", "", "", "", "", "", "", "");
            }
            String idErr = errorDTO.getErrBookID();
            if (idErr == null) {
                idErr = "";
            }

            String nameErr = errorDTO.getErrBookName();
            if (nameErr == null) {
                nameErr = "";
            }
            String authorErr = errorDTO.getErrAuthorID();
            if (authorErr == null) {
                authorErr = "";
            }
            String caErr = errorDTO.getErrCaID();
            if (caErr == null) {
                caErr = "";
            }
            String phErr = errorDTO.getErrPhID();
            if (phErr == null) {
                phErr = "";
            }

            String publishingErr = errorDTO.getErrPublishingYear();
            if (publishingErr == null) {
                publishingErr = "";
            }
            String quantityErr = errorDTO.getErrQuantity();
            if (quantityErr == null) {
                quantityErr = "";
            }
            String priceErr = errorDTO.getErrPrice();
            if (priceErr == null) {
                priceErr = "";
            }
        %>
    </head>
    <body>
        
        <form action="MainController" method="POST">
            Book ID <input type="text" name="txtBookID" required/><br/>
            <%= idErr%><br/>
            Book Name <input type="text" name="txtBookName" required/>(3 - 50 characters)<br/>
            <%= nameErr%><br/>
            Author ID <input type="text" name="txtAuthorName" required/><br/>
            <%= authorErr%><br/>
            Category ID <input type="text" name="txtCaID" required/><br/>
            <%= caErr%><br/>
            ph ID <input type="text" name="txtPhID" required/><br/>
            <%= phErr%><br/>
            Publishing Year <input type="text" name="txtPublishingYear" required/><br/>
            <%= publishingErr%><br/>
            Quantity <input type="text" name="txtQuantity" required/>(quantity > 0)<br/>
            <%= quantityErr%><br/>
            Price <input type="text" name="txtPrice" required/><br/>
            <%= priceErr%><br/>
            <input type="submit" name="action" value="Create"/>
        </form>
    </body>
</html>
