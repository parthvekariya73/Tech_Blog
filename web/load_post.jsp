<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page errorPage="error_page.jsp" %>
<div class="row">
<%
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("cid"));
    ArrayList<Post> posts = null;
    if(cid == 0) {
        posts = d.getAllPosts();
    }else{
        posts = d.getPostByCatId(cid);
    }
    
    if(posts.size() == 0) {
        out. println("<h5 class='display-3 text-center'>No Posts in this Category</h5>");
        return;
    }
    
    for(Post p : posts) {  
%>

    <div class="col-md-6 mt-2">
        <div class="card">
            <% if (p.getpPic() != null && !p.getpPic().isEmpty()) { %>
            <div class="card-header">
                <img class="card-img-top" src="blog_pic/<%= p.getpPic() %>">
            </div>
            <% } %>
            <div class="card-body">
                <h5 class="card-title"><%= p.getpTitle() %></h5>
                <p class="card-text"><%= p.getpContent() %></p>
            </div>
            <div class="card-footer primary-background text-center">
                <%
                        LikeDao l = new LikeDao(ConnectionProvider.getConnection());
                %>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light" style="width: 60px;">
                    <i class="fa fa-thumbs-o-up"></i>
                    <span><%= l.countLikeOnPost(p.getPid()) %></span>
                </a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More..</a>
            </div>
        </div>
    </div>  

<% } %>
</div>