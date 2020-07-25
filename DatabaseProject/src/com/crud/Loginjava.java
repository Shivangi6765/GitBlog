package com.crud;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.io.PrintWriter;
//import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Loginjava extends HttpServlet{
	
	public void service(HttpServletRequest req , HttpServletResponse res) throws IOException {
		
		String name= req.getParameter("uname");
		String pass = req.getParameter("pass");
		
		 PrintWriter out = res.getWriter();
		
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedata", "root", "");
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("Select * from student where username = "+name+" and password = "+pass+"");
			
			
			if(rs.next()) {
				res.sendRedirect("welcome1.html");
			
			}
	 }
			catch(Exception e) {
				System.out.println(e);
			}
		/*		if(uname.equals("prince")&& pass.equals("123")) {
				res.sendRedirect("welcome.html");
			}   */
			
		
	
	}
	
              
	     


	}



