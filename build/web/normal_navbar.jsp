<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%
    PostDao p = new PostDao(ConnectionProvider.getConnection());
    ArrayList<Category> list1 = p.getAllCategories();
%>

<nav class="navbar navbar-expand-lg" id="navv">
    <a class="navbar-brand" id="nav-title" href="index.jsp"><span class="fa fa-asterisk"></span> TechBlog</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto navbar-ul">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span class="fa fa-check-square-o"></span> Categories
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <% for(Category c : list1) { %>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="profile.jsp"><%= c.getName() %></a>
                <%  }   %>
              </div>
            </li>
          </ul>
          <ul class="navbar-nav navbar-ul" >
            <li class="nav-item ">
                <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> SignUp</a>
            </li>
          </ul>
        </div>
    </nav>
    