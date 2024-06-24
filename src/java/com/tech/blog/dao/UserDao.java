/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    // method to insert user to data
    public boolean saveUser(User user) {
        boolean bool = false;
        try{
            // user -> database
            String q = "insert into user(name, email, password, gender, about) values(?, ?, ?, ?, ?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            
            pstmt.executeUpdate();
            bool = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return bool;
    }
    
    // get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try{
            String q = "select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet r = pstmt.executeQuery();
            System.out.println(r.toString());
            if(r.next()) {
                user = new User(r.getInt("id"), r.getString("name"), r.getString("email"), r.getString("password"),
                                r.getString("gender"), r.getString("about"));                
            }
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean updateUser(User user) {
        boolean f = false;
        try{
            String q = "update user set name=? , email=? , password=? , gender=? , about=? where id=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setInt(6, user.getId());
            
            p.executeUpdate();
            f = true;
        }catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int UserId) {
        User user = null;
        String q = "select * from user where id=?";
        try {
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, UserId);
            ResultSet r = ps.executeQuery();
            if(r.next()) {
                user = new User(r.getInt("id"), r.getString("name"), r.getString("email"), r.getString("password"),
                            r.getString("gender"), r.getString("about"));                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
}
