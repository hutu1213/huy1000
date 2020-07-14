<%-- 
    Document   : update
    Created on : Jun 29, 2020, 1:49:00 PM
    Author     : se130
--%>

<%@page import="dto.ErrorBookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Book Page</title>
      
    </head>
    <body>
              <div class="container-fluid"> 
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">

                            <form action="MainController" method="POST" class="form-signin">
                                <input type="text" name="txtId" value="${param.bookId}" placeholder="Book ID" class="form-control mb-3" readonly />
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errBookID}</p></font>

                                <input type="text" name="txtBookName" value="${param.bookName}" placeholder="Book Name" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errBookName}</p></font>

                                <input type="text" name="txtAuthorName" value="${param.authorName}" placeholder="author Name" class="form-control mb-3" required />
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errAuthorID}</p></font>

                                <Select name="txtCaID" class="form-control mb-3">                                   
                                    <c:forEach var="list" items="${requestScope.LIST_CATEGORY_UPDATE}" >
                                        <option selected>${param.caID}</option>
                                         <option value="${list.caName}"> ${list.caName}</option>
                                    </c:forEach>                           
                                </select>
                                    
                  
                                     <font color="red"><p class="mb-3">${requestScope.ERROR.errCaID}</p></font>
                                <input type="text" name="txtPublishingYear" value="${param.publishingYear}" placeholder="PublishingYear" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errPublishingYear}</p></font>
                                <input type="text" name="txtQuantity" value="${param.quantity}" placeholder="Quantity" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errQuantity}</p></font>
                                <input type="text" name="txtPrice" value="${param.price}" placeholder="Price" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errPrice}</p></font>
                                <input type="text" name="txtPhID" value="${param.publishingHouse}" placeholder="PublishingHouse" class="form-control mb-3" required/>
                                <font color="red"><p class="mb-3">${requestScope.ERROR.errPhID}</p></font>
                                <input type="submit" name="action" value="Update" class="btn btn-lg btn-primary btn-block text-uppercase mb-3">
                            </form>
                            <hr class="mb-3">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
