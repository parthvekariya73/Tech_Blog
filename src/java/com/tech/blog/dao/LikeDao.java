package com.tech.blog.dao;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid, int uid) {
        boolean flag = false;
        try {
            String q = "insert into like_post(pid, uid) values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
            
            // vslues set
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            flag = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public int countLikeOnPost(int pid) {
        int count = 0;
        
        try {
            String q = "select count(*) from like_post where pid=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet set = p.executeQuery();
            if(set.next()) {
                count = set.getInt("count(*)");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    public boolean isLikeByUser(int pid, int uid) {
        boolean flag = false;
        
        try {
            PreparedStatement p = this.con.prepareStatement("select * from like_post where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set = p.executeQuery();
            if(set.next()) {
                flag = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public boolean deleteLike(int pid, int uid) {
        boolean flag = false;
        
        try {
            PreparedStatement p = this.con.prepareStatement("delete from like_post where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate(); 
            flag = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
}
