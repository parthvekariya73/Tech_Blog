# TechBlog - Dynamic Technical Blogging Website
TechBlog is a dynamic web application designed for tech enthusiasts to read, share, and engage with technical blogs. Built using Java, JDBC, Servlet, JSP, MySQL, and AJAX, TechBlog provides a robust platform for creating and managing technical content.

# Technologies Used ->
Java: Core programming language.<br>
JDBC: Database connectivity.<br>
Servlet: Server-side processing.<br>
JSP: Dynamic content rendering.<br>
MySQL: Database management.<br>
AJAX: Asynchronous web operations.<br>

# File Structure ->
1. DAO:<br>
CategoryDao.java: Manages CRUD operations for blog categories.<br>
LikeDao.java: Handles likes-related data transactions.<br>
PostDao.java: Manages blog post data.<br>
UserDao.java: Manages user information.<br><br>
2. Entities:<br>
Category.java: Represents blog categories.<br>
Message.java: Facilitates system messages.<br>
Post.java: Represents individual blog posts.<br>
User.java: Manages user data.<br><br>
3. Helper:<br>
ConnectionProvider.java: Establishes and provides database connections.<br><br>
4. Servlets:<br>
AddCategoryServlet.java: Adds new blog categories.<br>
AddPostServlet.java: Enables users to add new blog posts.<br>
EditServlet.java: Facilitates editing of existing posts.<br>
LikeServlet.java: Manages like functionality.<br>
LoginServlet.java: Handles user authentication.<br>
LogoutServlet.java: Manages user logout processes.<br>
RegisterServlet.java: Handles new user registrations.<br><br>
5. web Content:<br>
META-INF & WEB-INF: Configuration files and application descriptors.<br>
bootstrap folder: Contains Bootstrap files for responsive design.<br>
css folder: Custom stylesheets.<br>
img folder: Image assets.<br>
jQuery folder: jQuery library for dynamic web interactions.<br>
js folder: Custom JavaScript files.<br>
error_page.jsp: Custom error display.<br>
index.jsp: Homepage.<br>
load_post.jsp: Dynamic post loading.<br>
login_page.jsp: User login page.<br>
normal_navbar.jsp: Standard navigation bar.<br>
profile.jsp: User profile page.<br>
register_page.jsp: User registration page.<br>
show_blog_page.jsp: Displays individual blog posts.<br><br>
6. Database:<br>
techblog.sql: SQL file to set up the main database with tables for users, categories, posts, and likes.<br>

# Functionality ->
Dynamic Blog: Users can create, edit, and delete blog posts seamlessly.<br>
Category Management: Organize posts into categories for easy navigation.<br>
User Authentication: Secure login and registration processes.<br>
Interactive Features: AJAX for smooth, asynchronous interactions (like liking posts without page reloads).<br>
Responsive Design: Utilizes Bootstrap for mobile-friendly interfaces.<br>
Profile Management: Users can manage their profiles and view their posts.<br>
Engagement Tracking: Like functionality to gauge post popularity.<br>

# Setup Instructions ->
1. Clone the repository:<br>
git clone https://github.com/yourusername/TechBlog.git<br>
Import the project into your IDE (e.g., IntelliJ, Eclipse).<br>

2. Set up the MySQL database:<br>
Create a new database named techblog.<br>
Import the techblog.sql file to set up the necessary tables.<br>
mysql -u username -p techblog < path/to/techblog.sql<br>

3. Update the database configuration:<br>
Modify ConnectionProvider.java with your database credentials.<br>
private static final String DB_URL = "jdbc:mysql://localhost:3306/techblog";<br>
private static final String DB_USER = "your_db_username";<br>
private static final String DB_PASSWORD = "your_db_password";<br>

4. Deploy the application:<br>
Use a servlet container like Apache Tomcat to deploy the application.<br>

5. Run the application:<br>
Access the application via http://localhost:8080/TechBlog.<br>

# License ->
This project is licensed under the MIT License. See the LICENSE file for more details.<br>
Feel free to explore, contribute, and reach out if you have any questions or suggestions! <br>

#Java #JDBC #Servlet #JSP #MySQL #AJAX #TechBlog #WebDevelopment #Programming #Database #TechCommunity
