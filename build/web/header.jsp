<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Header -->
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <h1>Welcome: ${sessionScope.NAME.fullName}</h1>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">               
                <a href="MainController?action=Logout">Logout</a>
                <a href="cart1.jsp">View your cart</a>
            </ul>

        </div>

    </nav>
</div>
<!-- end header -->