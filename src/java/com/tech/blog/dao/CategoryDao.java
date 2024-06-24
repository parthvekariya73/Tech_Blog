/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Lenovo
 */
public class CategoryDao {
    Connection con;

    public CategoryDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveCategory(Category c) {
        boolean flag = false;
        
        try {
            String q = "insert into categories(name, description) values(?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, c.getName());
            pstmt.setString(2, c.getDescription());
            
            pstmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return flag;
    } 
}
