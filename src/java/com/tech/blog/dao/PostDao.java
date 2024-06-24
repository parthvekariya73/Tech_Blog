package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.sql.Statement;
import java.sql.ResultSet; 
import java.util.ArrayList;

public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        
        try{
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                 
                Category c = new Category(cid, name, description); 
                list.add(c);
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return list;
    } 
    
    public boolean savePost(Post p){
        boolean flag = false;
        
        try{
            String q = "insert into posts(pTitle, pContent, pCOde, pPic, catid, userid) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatid());
            pstmt.setInt(6, p.getUserid());
            
            pstmt.executeUpdate();
            flag = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public ArrayList<Post> getAllPosts() {
        ArrayList<Post> list = null;
        // fetch all post
        try {
            list = new ArrayList<>();
            PreparedStatement pstmt = this.con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(p);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Post> getAllPostsByQuery(String q) {
        ArrayList<Post> list = null;
        // fetch all post
        try {
            list = new ArrayList<>();
            PreparedStatement pstmt = this.con.prepareStatement(q);
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(p);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Post> getPostByCatId(int catId) {
        ArrayList<Post> list = new ArrayList<>();
        // fetch all post by catid
        try {
            PreparedStatement pstmt = this.con.prepareStatement("select * from posts where catId=?");
            pstmt.setInt(1, catId);
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                
                Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(p);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public Post getPostByPostId(int postId) {
        Post post = null;
        try{
            String q = "select * from posts where pid=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);
            
            ResultSet set = p.executeQuery();
            if(set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        return post;
    }
}
