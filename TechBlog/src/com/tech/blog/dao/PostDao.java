package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.*;
import com.tech.blog.entities.*;

public class PostDao {

	Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category>list= new ArrayList<>();
		
		
		
		try {
			
			String q="Select * from categories";
			Statement s = this.con.createStatement();
			ResultSet rs = s.executeQuery(q);
			while(rs.next()) {
				
				int cid= rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				Category c = new Category(cid,name,description);
				list.add(c);
			}
			
		}catch(Exception e) {
			
			
			e.printStackTrace();
		}
		
		return list;
		
	}

	public boolean savePost(Post p) {
		boolean f =false;
		try {
			
			String q ="Insert into posts(pTitle,pContent,pCode,pPic,CatId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pt = con.prepareStatement(q);
			pt.setString(1, p.getpTitle());
			pt.setString(2, p.getpContent());
			pt.setString(3, p.getpCode());
			pt.setString(4, p.getpPic());
			pt.setInt(5, p.getCatId());
			pt.setInt(6, p.getUserId());
			
			pt.executeUpdate();
			f=true;
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	//get all the posts
	public List<Post> getAllPosts(){
		
		
		List<Post> list = new ArrayList<>();
		//fetch all the post
		
		try {
			
			PreparedStatement p= con.prepareStatement("Select * from posts order by pid  ");
			ResultSet rs = p.executeQuery();
			
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				
				list.add(post);
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Post> getPostByCatId(int catId){
		
		List<Post> list1 = new ArrayList<>();
		
		//fetch all post by id
		
     try {
			
			PreparedStatement p= con.prepareStatement("Select * from posts where catId=?");
			p.setInt(1, catId);
			ResultSet rs = p.executeQuery();
			
			while(rs.next()) {
				
				int pid = rs.getInt("pid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int userId = rs.getInt("userId");
				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, pDate,catId,userId);
				
				list1.add(post);
			}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return list1;
	}
	
	public Post getPostByPostId(int postId) {
		
		Post post = null;
		
		String  q = "select * from posts where pid=?";
		try {
			
			PreparedStatement p =this.con.prepareStatement(q);
		    p.setInt(1,postId);
		    
		    ResultSet rs = p.executeQuery();
		    
		    if(rs.next()) {
		    	
		    	int pid = rs.getInt("pid");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				Timestamp pDate = rs.getTimestamp("pDate");
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");
				
				post = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
				
		    	
		    }
	    } 
	   catch(Exception e) {
		        e.printStackTrace();
	   }
		
		return post;
	}
	
}
