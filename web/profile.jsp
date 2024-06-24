<%-- 
    Document   : profile
    Created on : Jun 14, 2024, 11:26:00 AM
    Author     : Lenovo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User)session.getAttribute("currentUser");
    if(user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
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

    
    <!--navbar start-->
    <nav class="navbar navbar-expand-lg navbar-light" id="navv">
    <a class="navbar-brand" id="nav-title"  href="index.jsp"><span class="fa fa-asterisk"></span> Tech Blog</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto navbar-ul">
            <li class="nav-item active">
                <a class="nav-link" href="profile.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-adjust"></span> Posts</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-cat-modal"><span class="fa fa-check-square-o"></span> Category</a>
            </li>
          </ul>
          <ul class="navbar-nav mr-right navbar-ul">
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
            </li>
          </ul>
        </div>
    </nav>
    <!--navbar end-->
    
    
    
    <!--message error-->
    <%
        Message m = (Message)session.getAttribute("msg");
        if(m != null) {
    %>
    <div class="alert <%= m.getCssClass() %>" role="alert">
        <%= m.getContent() %>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <%
        session.removeAttribute("msg");
        }
    %>
    
    
    <!--main body of profile-->
    <main>
        <div class="container">
            <div class="row mt-4">
                <!--first col-->
                <div class="col-md-4">
                    <!--categories-->
                    <div class="list-group">
                        <a href="#" onClick="getPosts(0, this)" class="c-link list-group-item list-group-tiem-action primary-background text-dark">All Posts</a>
                        <%
                            PostDao d = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list1 = d.getAllCategories();
                            for(Category cc : list1)
                            {   %>
                            <a href="#" onClick="getPosts(<%= cc.getCid() %>, this)" class="c-link list-group-item list-group-tiem-action text-dark"><%= cc.getName() %></a>
                            <%  }

                        %>
                    </div>
                </div>
                <!--second col-->
                <div class="col-md-8">
                    <!--posts-->
                        <!--loader-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                    <div class="container-fluid" id="post-container">
                        
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!--end main body of profile-->
      
    
    <!--profile model-->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
              
            <div class="modal-header background-primary text-center text-white">
              <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
              
            <div class="modal-body">
              <div class="container text-center">
                    <img src="./img/default.jpg" alt="alt" class="img-fluid"/>
                    <br>
                    <h5 class="model-title mt-3" id="exampleModelLabel"><%= user.getName() %></h5>

                    <!--details-->
                    <div id="profile-details">
                        <table class="table">
                        <tbody>
                            <tr>
                                <th scope="row">ID :</td>
                                <td><%= user.getId()%></td>
                            </tr>
                            <tr>
                                <th scope="row">Email :</td>
                                <td><%= user.getEmail()%></td>
                            </tr>
                            <tr>
                                <th scope="row">Gender :</td>
                                <td><%= user.getGender()%></td>
                            </tr>
                            <tr>
                                <th scope="row">Status :</td>
                                <td><%= user.getAbout()%></td>
                            </tr>
                        </tbody>
                    </table>
                    </div>

                    <!--profile edit-->
                    <div id="profile-edit" style="display: none;">
                        <h3 class="mt-2">Please Edit Carefully</h3>

                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID : </td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Email : </td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <td>Name : </td>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                </tr>
                                <tr>
                                    <td>Password : </td>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                </tr>
                                <tr>
                                    <td>Gender : </td>
                                    <td><%= user.getGender().toUpperCase() %></td>
                                </tr>
                                <tr>
                                    <td>Status : </td>
                                    <td>
                                        <textarea class="form-control" name="user_about" rows="3">
                                            <%= user.getAbout() %>
                                        </textarea>
                                    </td>
                                </tr>
                            </table>

                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                                        
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button"  id="edit-profile-button" class="btn btn-primary">Edit</button>
            </div>
                                        
          </div>
        </div>
      </div>
    <!--end profile model-->
        
    
    <!--post model-->
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                
                <form action="AddPostServlet" method="post" enctype="multipart/form-data" >
                    <div class="form-group">
                        <select required class="form-control" name="cid">
                            <option selected disabled>---Select Category---</option>
                            <%
                                PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list = postd.getAllCategories();
                                for(Category c: list) {
                            %>
                                <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                            <%  }   %>
                        </select>
                    </div>
                    <div class="form-group">
                        <input name="pTitle" type="text" placeholder="Enter Post Title" required class="form-control"/>
                    </div>
                    <div class="form-group">
                        <textarea name="pContent" class="form-control" placeholder="Enter Your Content" required style="height: 150px;"></textarea>
                    </div> 
                    <div class="form-group">
                        <textarea name="pCode" class="form-control" placeholder="Enter Your Program Code (if any)" style="height: 150px;"></textarea>
                    </div>
                    <div class="form-group">
                        <label>Select Your Image : </label>
                        <input type="file" name="pic">
                    </div>
                    <div class="container text-center">
                        <button type="submit" class="btn btn-primary">Post</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
          </div>
        </div>
    </div>
    <!--end post model-->
    
    
    <!--category model-->
    <div class="modal fade" id="add-cat-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Provide Category Details</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <form action="AddCategoryServlet" method="post">
                    <div class="form-group">
                        <input name="cTitle" type="text" placeholder="Enter Category Name" required class="form-control"/>
                    </div>
                    <div class="form-group">
                        <textarea name="cContent" class="form-control" placeholder="Enter Category Description" required style="height: 150px;"></textarea>
                    </div> 
                    <div class="container text-center">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
          </div>
        </div>
    </div>
    <!--end category model-->
    
    
    <!--footer-->
    <footer class="footer primary-background mt-5" id="footer">
        <div class="conatiner copyrite pt-2">
            <p class="text-white">copyright; 2024 @ParthVekariya - Technical Blog, India</p>
        </div>
    </footer>
        
    
    
    <script type="text/javascript" src="./jQuery/jquery.js"></script>
    <script type="text/javascript" src="./js/myjs.js"></script>
    <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
    
    <!--profile modal js-->
    <script>
        $(document).ready(function(){
            let editStatus = false;
            
            $('#edit-profile-button').click(function(){
                if(editStatus === false){
                    $("#profile-details").hide();
                    $("#profile-edit").show();
                    
                    editStatus = true;
                    $(this).text("Back");
                }else{
                    $("#profile-details").show();
                    $("#profile-edit").hide();
                    
                    editStatus = false;
                    $(this).text("Edit");
                }
            });
        });
        
    </script>
    
    <!--loading post js-->
    <script>
        
        function getPosts(cid, temp) {
            $("#loader").show();
            $("#post-container").hide();
            
            $(".c-link").removeClass('primary-background');
            $(".c-link").removeClass('text-white');
            
            $.ajax({
               url: "load_post.jsp",
               data: {cid: cid},
               success: function(data, textStatus, jqXHR) {
                   $("#loader").hide();
                   $("#post-container").show();
                   $("#post-container").html(data);
                   $(temp).addClass('text-white');
                   $(temp).addClass('primary-background');
                   console.log(data);
               }
            });
        }
        
        $(document).ready(function(){
            let allPostRef = $(".c-link")[0];
            getPosts(0, allPostRef);
        });
    </script>
    
</html>
