<%-- 
    Document   : error_page
    Created on : Jun 14, 2024, 9:16:21 AM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sorry! Something went Wrong</title>   <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="./css/mystyle.css">
</head>
<body>
    
    <div class="container text-center">
        <img src="./img/error.png" class="img-fluid">
        <h3 class="display-3">Sorry! Something went Wrong...</h3>
        <%= exception %>
        <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
    </div>
    
</body>
</html>
