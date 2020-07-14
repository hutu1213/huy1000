<%-- 
    Document   : userManager
    Created on : Jul 5, 2020, 4:11:54 PM
    Author     : se130
--%>

<%@page import="dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Manager Page</title>
    </head>
    <%@include file="headerAdmin.jsp" %>
      <%
            UserDTO login_user = (UserDTO) session.getAttribute("NAME");
            if (login_user == null) {
                response.sendRedirect("index.jsp");
            }
        %>
    
    <form action="MainController" method="POST">
        User Name<input type="text" name="txtSearch" />
        <input type="submit" name="action" value=" Search "/>
    </form>
    <%
        List<UserDTO> list = (List<UserDTO>) request.getAttribute("USER_INFO");
        if (list != null) {
            if (!list.isEmpty()) {
    %>
    <table border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>User ID</th>                  
                <th>Full Name</th>
                <th>Sex</th>
                <th>Address</th>
                <th>Role ID</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                int count = 1;
                for (UserDTO dto : list) {
            %>
        <form action="MainController" method="POST">
            <tr>
                <td><%=count++%></td>
                <td><%=dto.getUserID()%></td>
                <td><%=dto.getFullName()%></td>
                <td><%=dto.getSex()%></td>
                <th><%=dto.getAddress()%></th>
                <th><%=dto.getRoleID()%></th>
                <td><%=dto.getEmail()%></td>
                <td><%=dto.getPhone()%></td>         
                <td>
                    <input type="submit" name="action" value="Delete_User"/>
                    <input type="hidden" name="txtSearch" value="<%= request.getParameter("txtSearch")%>"/>
                    <input type="hidden" name="txtUserID" value="<%= dto.getUserID()%>"/>
                </td>
                
            </tr>
        </form>
        <%
            }
        %>
    </tbody>
</table>
<%
} else {
%>
No records
<%
        }
    }
%>
</form
</html>
