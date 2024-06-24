<%-- 
    Document   : login_page
    Created on : Jun 13, 2024, 5:52:04 PM
    Author     : Lenovo
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
    
    <script type="text/javascript" src="./jQuery/jquery.js"></script>
    <script type="text/javascript" src="./js/myjs.js"></script>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="./css/mystyle.css">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

   <style>
        /* footer */
        #footer{
         width: 100%;
         height: 40px;
         text-align: center;
        }
        #footer .copyrite p{
           font-weight: 200;
           font-size: 17px;
           color: #465b52;
        }
   </style>
</head>
<body>
    <!--navbar-->
    <%@include file="normal_navbar.jsp" %>    
    
    <main class="d-flex align-items-center primary-background banner-background" style="height: 80vh;">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header primary-background text-white text-center">
                            <span class="fa fa-user-plus fa-3x"></span><br>
                            <p class="text-white">Login here</p>
                        </div>
                        
                        <!--message error-->
                        <%
                            Message m = (Message)session.getAttribute("msg");
                            if(m != null) {
                        %>
                        <div class="alert <%= m.getCssClass() %>" role="alert">
                            <%= m.getContent() %>
                        </div>
                        <%
                            session.removeAttribute("msg");
                            }
                        %>
                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
        
    <!--footer-->
    <footer class="footer primary-background mt-5" id="footer">
        <div class="conatiner copyrite pt-2">
            <p class="text-white">copyright; 2024 @ParthVekariya - Technical Blog, India</p>
        </div>
    </footer>
        
    
</body>
</html>
