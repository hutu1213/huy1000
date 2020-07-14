<%-- 
    Document   : adminOptions
    Created on : Jul 11, 2020, 8:50:28 PM
    Author     : se130
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    
    <body>
         <%@include file="headerAdmin.jsp" %>
        <div class="container-fluid"> 
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <form action="MainController" method="POST">
                             <input type="submit" class="btn btn-block btn-warning" name="action" value="User Manager">
                            <input type="submit" class="btn btn-block btn-warning" name="action" value="Book Manager">   

                                <input type="submit" class="btn btn-block btn-warning" name="action" value="Create Book">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
