<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/5a401084f7.js" crossorigin="anonymous"></script>
<!-- Header -->
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <h1>Welcome: ${sessionScope.NAME.fullName}</h1>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <a href="MainController?action=Logout" >Logout</a>

            </ul>
        </div>
    </nav>
</div>
<!-- end header -->