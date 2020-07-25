package com.tech.blog.dao;
import java.sql.*;
import java.io.*;

public class LikeDao {
	Connection con;
	
	public LikeDao(Connection con) {
		this.con=con;
	}
	
	public boolean insertLike(int pid,int uid) { //user ke like ko le jaake liked vaali table me save krega
		
		boolean f =false;
		try {
			String q = "insert into liked(pid,uid) values(?,?)";
			PreparedStatement p =this.con.prepareStatement(q);
			
			p.setInt(1, pid);
			p.setInt(2,uid);
			
			p.executeUpdate();
			f=true;
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return f;
	}
	
	public int countLikeOnPost(int pid) {
		int count=0;
		
		String q = "Select count(*) from liked where pid=?"; //means agr postid=2 h to usi post ke like count ho //count krna hoga uss pid ki kitti rows h count(*) means saari rows
		try {           //hum dekhna cha rhe h kitte like miile h uss post ko jiski id =2 h
			
			PreparedStatement p = this.con.prepareStatement(q);
		    p.setInt(1, pid);
		    
		    ResultSet rs = p.executeQuery();
			if(rs.next()) {
				
				count=rs.getInt("count(*)");
			}
			
	 }catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public boolean isLikedByUser(int pid,int uid) {
		boolean f=false;
		
		try {
			PreparedStatement p = this.con.prepareStatement("Select * from liked where pid=? and uid=?");
			p.setInt(1,pid);
			p.setInt(2, uid);
			ResultSet rs = p.executeQuery();
			if(rs.next()) {
				
				f=true;  // f true yaani  uss user ne already like kr diya // ab ek baar usi ko vo dubara like krega to dislike ho jaayega
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean isDislikedByUser(int pid,int uid) {  //agr dislike kiya h to vo user liked table se delete ho jaaye
		
		boolean f=false;
		try {
			
			PreparedStatement p= this.con.prepareStatement("Delete from liked where pid=? and uid=?");
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			
			f=true;
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		return f;
	}

	
}
