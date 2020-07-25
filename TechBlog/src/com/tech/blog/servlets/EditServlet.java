package com.tech.blog.servlets;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.Helper;



import com.tech.blog.helper.ConnectionProvider;

import java.io.IOException;
import com.tech.blog.dao.UserDao;
import java.sql.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;


@MultipartConfig

public class EditServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out= response.getWriter();
		
		//fetch all data
		String userEmail = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");
		Part part = request.getPart("profile");                   
		String profile = part.getSubmittedFileName();
	    // out.println(profile);
		
		//get the user from the session
		
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser");   //login krate hue currentuser ko u(object of User) ke andr store kraya tha vhi user ke andr le rhe h
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile = user.getProfile();
		user.setProfile(profile);
		
		//update in database too
		UserDao userDao = new UserDao(ConnectionProvider.getConn());
		
		boolean ans = userDao.updateUser(user);
		if(ans)
		{
			out.println("updated to Db");
			
			String path = request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			
			//delete old file
			String pathOldFile = request.getRealPath("/")+"pics"+File.separator+oldFile;
			
			if(!oldFile.contentEquals("default.png")) {
				//default.png delete nhi honi chahiye
				
			Helper.deleteFile(pathOldFile);
			}
			
				if(Helper.saveFile(part.getInputStream(), path)) {
					
					out.println("Profile updated...");
					Message msg = new Message("Profile details updated...","Success","alert-success"); //ye vaala message profile page pr dikhna chahiye uske liye we use session
					s.setAttribute("msg",msg);  
				}
				else {
					Message msg = new Message("Something went wrong...","error","alert-danger"); //ye vaala message profile page pr dikhna chahiye uske liye we use session
					s.setAttribute("msg",msg);  
				}
			}
			
		else {
			out.println("not updated");
			Message msg = new Message("Something went wrong...","error","alert-danger"); //ye vaala message profile page pr dikhna chahiye uske liye we use session
			s.setAttribute("msg",msg);  
		}
		response.sendRedirect("profile.jsp");
		
	}

}
