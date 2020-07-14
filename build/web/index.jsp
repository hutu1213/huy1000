<%-- 
    Document   : index
    Created on : Jun 29, 2020, 10:35:26 AM
    Author     : se130
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="FrameWorkLogin/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/css/util.css">
        <link rel="stylesheet" type="text/css" href="FrameWorkLogin/css/main.css">
    </head>
    <body>
        <%--        <form action="MainController" method="POST">
                    User name <input type="text" name="txtUserName" value="${param.txtUserName}" /><br/>
                    Password  <input type="password" name="txtPassword" value="${param.txtPassword}"/><br/>
                    <input type="submit" name="action" value="Login"/>
        </form>--%>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-form-title" >
                        <span class="login100-form-title-1">
                            Sign In
                        </span>
                    </div>

                    <form class="login100-form validate-form" action="MainController" method="POST">
                        <div class="wrap-input100 validate-input m-b-26">
                            <span class="label-input100">Username</span>
                            <input class="input100" type="text" name="txtUserName" value="${param.txtUserName}" placeholder="Enter username" required>
                            <span class="focus-input100"></span>
                        </div>

                        <div class="wrap-input100 validate-input m-b-18">
                            <span class="label-input100">Password</span>
                            <input class="input100" type="password" name="txtPassword" value="${param.txtPassword}" placeholder="Enter password" required>
                            <span class="focus-input100"></span>
                        </div>

                        <div class="flex-sb-m w-full p-b-30">
                            <div>
                                <a href="createUser.jsp" class="txt1">
                                    Create new user
                                </a>
                            </div>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn"  name="action" value="Login" >
                                Login
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    <!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
    </body>


</html>
