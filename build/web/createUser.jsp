<%-- 
    Document   : createUser
    Created on : Jul 11, 2020, 11:36:58 PM
    Author     : se130
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User Page</title>
    </head>
    <body>
        <div class="container-fluid"> 
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">

                            <form action="MainController" method="POST" class="form-signin">
                                <input type="text" name="txtUserID" value="${param.txtUserID}" placeholder="User ID" class="form-control mb-3" required />
                                <font color="red"><p class="mb-3">${requestScope.ERROR_USER.userIDErr}</p></font>
                                <input type="text" name="txtFullName" value="${param.txtFullName}" placeholder="Name" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR_USER.fullNameErr}</p></font>
                                <input type="text" name="txtAddress" value="${param.txtAddress}" placeholder="Address" class="form-control mb-3" required />
                                <font color="red"><p class="mb-3">${requestScope.ERROR_USER.addressErr}</p></font>
                                <input type="text" name="txtEmail" value="${param.txtEmail}" placeholder="email" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR_USER.emailErr}</p></font>
                                <input type="text" name="txtPhone" value="${param.txtPhone}" placeholder="Phone" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR_USER.phoneErr}</p></font>

                                <input name="txtSex" type="radio" value="Male" checked="checked" />Male
                                <input name="txtSex" type="radio" value="Female" />Female<br/>

                                <input type="password" name="txtPassword" value="${param.txtPassword}" placeholder="Password" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR_USER.passwordErr}</p></font>
                                <input type="password" name="txtRePassword" value="${param.txtRePassword}" placeholder="RePassword" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR_USER.rePasswordErr}</p></font>
                                <input type="submit" name="action" value="Create_User" class="btn btn-lg btn-primary btn-block text-uppercase mb-3">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
