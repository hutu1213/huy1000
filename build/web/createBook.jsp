<%-- 
    Document   : createUser
    Created on : Jul 10, 2020, 10:37:29 PM
    Author     : se130
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Book Page</title>
        
    </head>
    <body>
        <div class="container-fluid"> 
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">

                            <form action="MainController" method="POST" class="form-signin">
                                <input type="text" name="txtBookID" value="${param.bookID}" placeholder="Book ID" class="form-control mb-3" required />
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errBookID}</p></font>

                                <input type="text" name="txtBookName" value="${param.txtBookName}" placeholder="Book Name" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errBookName}</p></font>

                                <input type="text" name="txtAuthorName" value="${param.txtAuthorName}" placeholder="author Name" class="form-control mb-3" required />
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errAuthorID}</p></font>

                                <Select name="txtCaID" class="form-control mb-3">                                   
                                    <c:forEach var="list" items="${requestScope.LIST_CATEGORY}" >
                                        <option value="${list.caName}"> ${list.caName}</option>
                                    </c:forEach>
                                </select>


                                <%--  <select name="txtCaID">
                                     <c:forEach items="${requestScope.LIST_CATEGORY}" var="item">
                                         <option value="${item}"> ${item}</option>
                                     </c:forEach>
                                 </select><br>--%>
                                <input type="text" name="txtPublishingYear" value="${param.txtPublishingYear}" placeholder="PublishingYear" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errPublishingYear}</p></font>
                                
                                <input type="text" name="txtQuantity" value="${param.txtQuantity}" placeholder="Quantity" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errQuantity}</p></font>
                                <input type="text" name="txtPrice" value="${param.txtPrice}" placeholder="Price" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errPrice}</p></font>
                                <input type="text" name="txtPublishingHouse" value="${param.txtPublishingHouse}" placeholder="PublishingHouse" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errPhID}</p></font>
                                <input type="submit" name="action" value="Create" class="btn btn-lg btn-primary btn-block text-uppercase mb-3">
                            </form>
                            <hr class="mb-3">



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
