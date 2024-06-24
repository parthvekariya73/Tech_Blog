<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech_Blog</title>
    
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
    
    <!--Banner-->
    <div class="container-fluid p-0 m-0">
        <div class="jumbotron banner-background">
            <div class="container">
                <section id="hero">
                <h1 class="display-4">Welcome to TechBlog</h1>
                <p>Welcome to <b>TechBlog</b>, your go-to source for the latest in technology, innovation, and digital trends. Here, we bring you in-depth reviews, breaking news, and expert insights on everything from cutting-edge gadgets to groundbreaking software developments. Whether you're a tech enthusiast, a professional in the industry, or just curious about the latest tech advancements, TechBlog has something for you.</p>
                <p>Stay ahead of the curve with our daily updates and comprehensive articles, crafted by a team of dedicated tech writers and industry experts. Dive into our detailed guides, stay informed with our analysis on emerging trends, and join a community of like-minded tech lovers. Explore TechBlog and be part of the conversation shaping the future of technology.</p>
                <div class="flex-column">
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start its Free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
                </section>
            </div>
        </div>
    </div>
    
    
    <!--Csrd-->
    <div class="container" id="posts">
        <h4 class="mb-3 text-center">Recent Posts</h4>
        <!--loader-->
        <div class="container text-center" id="loader">
            <i class="fa fa-refresh fa-3x fa-spin"></i>
            <h3 class="mt-2">Loading...</h3>
        </div>
        <div class="row mb-2">
        <%
            PostDao d = new PostDao(ConnectionProvider.getConnection());
            ArrayList<Post> posts = d.getAllPostsByQuery("select * from posts order by pid desc limit 15");

            if(posts.size() == 0) {
                out. println("<h3 class='display-3 text-center'>No Posts</h3>");
                return;
            }

            for(Post p1 : posts) {  
            %>
            <div class="col-md-4">
                <div class="card" style="margin: 10px; border: 1px solid #088178;">
                    <% if (p1.getpPic() != null && !p1.getpPic().isEmpty()) { %>
                        <div class="card-header">
                            <img class="card-img-top" src="blog_pic/<%= p1.getpPic() %>">
                        </div>
                    <% } %>
                    <div class="card-body">
                        <h5 class="card-title"><%= p1.getpTitle() %></h5>
                        <p class="card-text"><%= DateFormat.getDateTimeInstance().format(p1.getpDate()) %></p>
                    </div>
                    <div class="card-footer primary-background text-center">
                        <%
                            LikeDao l = new LikeDao(ConnectionProvider.getConnection());
                        %>
                        <a href="" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span><%= l.countLikeOnPost(p1.getPid()) %></span></a>
                        <a href="show_blog_page.jsp?post_id=<%= p1.getPid() %>" class="btn btn-outline-light btn-sm">Read More..</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    
    
    <!--footer-->
    <footer class="footer primary-background mt-5" id="footer">
        <div class="conatiner copyrite pt-2">
            <p class="text-white">copyright; 2024 @ParthVekariya - Technical Blog, India</p>
        </div>
    </footer>
        
    
    <script>
        $(document).ready(function(){
            $("#loader").show();
            $("#post-container").hide();
            
            <% 
                try {
                    Thread.sleep(1000);
                }catch(Exception e) {
                    e.printStackTrace();
                }   
            %>
            
            $("#loader").hide();
            $("#post-container").show();
        });
    </script>
    
</body>
</html>

