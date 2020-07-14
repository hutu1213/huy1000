<%-- 
    Document   : admin
    Created on : Jun 29, 2020, 12:04:55 PM
    Author     : se130
--%>

<%@page import="java.util.List"%>
<%@page import="dto.BookDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            String login_user = (String) session.getAttribute("NAME");
            if (login_user == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        
        <h1>Welcome: ${sessionScope.NAME}</h1>
        <a href="MainController?action=Logout" >Logout</a>
        <!--User-->
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="User Manager"/>
        </form>
        <!--Search--> 
        <form action="MainController" method="POST">
            Book Name <input type="text" name="txtSearch"/>  
            <input type="submit" name="action" value="Search"/>
        </form> 
        <!-- Create -->
        <form action="create.jsp" method="POST">
            <input type="submit" name ="action" value="CreateNewBook"/>
        </form>
        
        Deadline project 17h ngay 14, thu 3 tuan sau\\
        Deadline cau hoi ngay 19
        <% List<BookDTO> list = (List<BookDTO>) request.getAttribute("INFO");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
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
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>

                <% int count = 1;
                    for (BookDTO dto : list) {
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%=count++%></td>
                    <td><%=dto.getBookID()%></td>
                    <td><%=dto.getBookName()%></td>
                    <td><%=dto.getAuthorName() %></td>
                    <td><%=dto.getCaID()%></td>
                    <td><%=dto.getPhID()%></td>
                    <td><%=dto.getPublishingYear()%></td>
                    <td><%=dto.getQuantity()%></td>
                    <td><%=dto.getPrice()%></td>
                    <td>
                        <input type="hidden" name="id" value="<%=dto.getBookID()%>"/>
                        <input type="hidden" name="txtSearch" value="<%=request.getParameter("txtSearch")%>"/>
                        <input type="submit" name="action" value="Delete"/>
                    </td>
                    <td>

                        <input type="hidden" name="bookId" value="<%=dto.getBookID()%>"/>
                        <input type="hidden" name="bookName" value="<%=dto.getBookName()%>"/>
                        <input type="hidden" name="authorName" value="<%=dto.getAuthorName() %>"/>
                        <input type="hidden" name="caID" value="<%=dto.getCaID()%>"/>
                        <input type="hidden" name="phID" value="<%=dto.getPhID()%>"/>
                        <input type="hidden" name="publishingYear" value="<%=dto.getPublishingYear()%>"/>
                        <input type="hidden" name="quantity" value="<%=dto.getQuantity()%>"/>
                        <input type="hidden" name="price" value="<%=dto.getPrice()%>"/>
                        <input type="hidden" name="txtSearch" value="<%=request.getParameter("txtSearch")%>"/>
                        <input type="submit" name="action" value="Update  "/>
                </tr>
            </form>
            <%

                }
            %>          
        </tbody>
    </table>
    <%
    } else { %>
    No items
    <% }
        }%>


<%--
    <%
        List<BookDTO> listBook = (List<BookDTO>) request.getAttribute("GETALL");
        if (listBook != null) {
            if (!listBook.isEmpty()) {
    %>
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
                <th>Delete</th>
                <th>Update</th>
            </tr>
        </thead>
        <tbody>
            <% int count = 1;
                for (BookDTO dto : listBook) {
            %>
        <form action="MainController" method="POST">
            <tr>
                <td><%=count++%></td>
                <td><%=dto.getBookID()%></td>
                <td><%=dto.getBookName()%></td>
                <td><%=dto.getAuthorName() %></td>
                <td><%=dto.getCaID()%></td>
                <td><%=dto.getPhID()%></td>
                <td><%=dto.getPublishingYear()%></td>
                <td><%=dto.getQuantity()%></td>
                <td><%=dto.getPrice()%></td>
                <td>
                    <input type="hidden" name="id" value="<%=dto.getBookID()%>"/>
                    <input type="hidden" name="txtSearch" value="<%=request.getParameter("txtSearch")%>"/>
                    <input type="submit" name="action" value="Delete"/>
                </td>
                <td>
                    <input type="hidden" name="bookName" value="<%=dto.getBookName()%>"/>
                    <input type="hidden" name="authorName" value="<%=dto.getAuthorName() %>"/>
                    <input type="hidden" name="caID" value="<%=dto.getCaID()%>"/>
                    <input type="hidden" name="phID" value="<%=dto.getPhID()%>"/>
                    <input type="hidden" name="publishingYear" value="<%=dto.getPublishingYear()%>"/>
                    <input type="hidden" name="quantity" value="<%=dto.getQuantity()%>"/>
                    <input type="hidden" name="price" value="<%=dto.getPrice()%>"/>
                    <input type="submit" name="action" value="Update  "/>
                </td>
            </tr>
        </form>
        <%

            }
        %>   
    </tbody>
</table>
<%} else {%>
No items
<%}
    }%>
--%>
</body>
</html>
