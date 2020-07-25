package com.tech.blog.servlets;
import com.tech.blog.dao.*;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.entities.*;
import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		//fetch username and password from request:
		
		String  userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConn());
		User u = dao.getUserByEmailAndPassword(userEmail,userPassword);
		
		if(u==null)
		{
			//login error....
			
			//out.println("invalid details..try again");
			Message msg = new Message("Invalid Details ! try with another","error","alert-danger"); //ye vaala message login page pr dikhna chahiye uske liye we use session
			
			HttpSession s = request.getSession();
			s.setAttribute("msg",msg);   //ab ye  message hum get kr skte h apne login page pe 
			
			response.sendRedirect("LoginPage.jsp");  //jb erroe aaye to login page dubare se khul ke aaye
		}
		else {
			//login success...
			
			HttpSession s = request.getSession();  //session create to track the user 
			s.setAttribute("currentUser",u);    //user ko uthake session ke object 's' me daal diya
			
			response.sendRedirect("profile.jsp");
			
			
		}
		
		
	}

	
}
