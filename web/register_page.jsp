<%-- 
    Document   : register_page
    Created on : Jun 13, 2024, 6:16:01 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register Page</title>
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
    
    <main class="primary-background banner-background" style="padding-bottom: 80px; padding-top: 10px;">
        <div class="container">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header text-center primary-background text-white">
                        <span class="fa fa-3x fa-user-circle"></span><br>
                        <p class="text-white">Register here</p>
                    </div>
                    <div class="card-body">
                        <form action="RegisterServlet" method="post" id="reg-form">
                            <div class="form-group">
                              <label for="user_name">User Name</label>
                              <input name="user_name" required type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
                            </div>
                            
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input  name="user_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            
                            <div class="form-group">
                              <label for="gender">Select Gender</label><br>
                              <input type="radio" name="gender" value="male"> Male
                              <input type="radio" name="gender" value="female"> Female
                            </div>
                            
                            <div class="form-group">
                                <textarea class="form-control" name="about" rows="5" placeholder="Enter Something about yourself"></textarea>
                            </div>
                            
                            <div class="form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                              <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                            </div>
                            <br>
                            <div class="container text-center" id="loader" style="display: none;">
                                <span class="fa fa-refresh fa-spin fa-3x"></span>
                                <h4>Please wait...</h4>
                            </div>
                            <div class="container text-center">
                                <button id="submit-btn" type="submit" class="btn btn-outline-primary">Submit</button>
                            </div>
                        </form>
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
        
    
    
    <script type="text/javascript" src="./jQuery/jquery.js"></script>
    <script type="text/javascript" src="./js/myjs.js"></script>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            console.log("loaded...");
            $(`#reg-form`).on('submit',function(event){
                event.preventDefault();
                
                let form = new FormData(this);
                
                $("#submit-btn").hide();
                $("#loader").show();
                // send register servlet
                $.ajax({
                   url: "RegisterServlet",
                   type: 'POST',
                   data: form,
                   success: function(data, textStatus, jqXHR) {
                       console.log(data);
                        $("#submit-btn").show();
                        $("#loader").hide();
                        
                        if(data.trim() === 'done'){
                            alert("Register Successfully...");
                            window.location = "login_page.jsp"; 
                        }else{
                            alert(data);
                        }
                   },
                   error: function(jqXHR, textStatus, errorThrown) {
                        $("#submit-btn").show();
                        $("#loader").hide();
                        alert("Something want Wrong");
                   },
                   processData: false,
                   contentType: false
                });
                
            });
        })
    </script>
    
</body>
</html>
