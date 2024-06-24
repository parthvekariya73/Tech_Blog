/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // getting current user id
            HttpSession s = request.getSession();
            User user = (User)s.getAttribute("currentUser");
            
            out.println("1");
            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pic");
            
            String fileName = part.getSubmittedFileName();
            String filePath = request.getServletContext().getRealPath("/" + "blog_pic" + File.separator + fileName);
            out.println("2");
            // Ensure the directory exists
//            File fileSaveDir = new File(filePath);
//            if (!fileSaveDir.exists()) {
//                fileSaveDir.mkdirs();
//            }
//
//            // Handle file upload if a file is selected
//            if (fileName != null && !fileName.isEmpty()) {
//                Files.copy(part.getInputStream(), new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
//            }
            
            if(fileName != null && !fileName.isEmpty()) {
                boolean flag = uploadFile(part.getInputStream(), filePath);
                if(!flag) {
                    out.println("File not uploaded.");
                } 
            }

            // Create a Post object and save it to the database
            Post p = new Post(pTitle, pContent, pCode, fileName, null, cid, user.getId());
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            out.println("4");
            boolean ans = dao.savePost(p);
            if(ans) {
                Message msg = new Message("Post added successfully...", "success", "alert-success");
                s.setAttribute("msg", msg);
                out.println(ans);
            }else{
               out.println(ans);
                Message msg = new Message("Something went Wrong..", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");
            
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    /**
     *
     * @param is
     * @param path
     * @return
     */
    public boolean uploadFile(InputStream is, String path) {
        boolean flag = false;
        try {
            Files.copy(is, new File(path).toPath(), StandardCopyOption.REPLACE_EXISTING);
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
