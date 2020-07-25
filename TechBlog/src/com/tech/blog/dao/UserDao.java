//database me value daalne ke liye
package com.tech.blog.dao;
import java.sql.*;
import com.tech.blog.entities.User;

public class UserDao {
	
	private Connection con;
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	// method to insert user to database:
	
	public boolean saveUser(User user)
	{
		
		boolean f=false;
		try {
			Thread.sleep(3000); 
			
			//user-->database
			
			
			String query="insert into user(name,email,password,gender,about,profile) values(?,?,?,?,?,?)";
			PreparedStatement p = this.con.prepareStatement(query);
			
			p.setString(1,user.getName());
			p.setString(2,user.getEmail());
			p.setString(3,user.getPassword());
			p.setString(4,user.getGender());
			p.setString(5,user.getAbout());
            p.setString(6,user.getProfile());
			
			p.executeUpdate();
			f=true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}

	
	
	//get user by usermail and password
	
	public User getUserByEmailAndPassword(String email,String password) {

		User user = null;  //  starting me null denge or if return null means database me koi bnda nhi h
		
		try {
			
			String query = "Select * from user where email = ? and password = ?";
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, email);
			p.setString(2, password);
			
			
			ResultSet rs = p.executeQuery();
			
			if(rs.next())
			{
				user  = new User();
				String name = rs.getString("name");
				//set to user object
				user.setName(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDatetime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			
			}
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
	}
	
	public boolean updateUser(User user)
	{
		boolean f=false;
		
		try {
			
			String query ="Update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getAbout());
			p.setString(6, user.getProfile());
			p.setInt(7, user.getId());
			
			p.executeUpdate();
			f=true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User getUserByUserId(int userId) {
		
		User user=null;
		try {
	    
		String q = "Select * from user where id=?";
		PreparedStatement p= this.con.prepareStatement(q);
		p.setInt(1, userId);
		ResultSet rs = p.executeQuery();
		
		if(rs.next()) {
			
			user  = new User();
			String name = rs.getString("name");
			//set to user object
			user.setName(name);
			user.setId(rs.getInt("id"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setGender(rs.getString("gender"));
			user.setAbout(rs.getString("about"));
			user.setDatetime(rs.getTimestamp("rdate"));
			user.setProfile(rs.getString("profile"));
		
		}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}

}





