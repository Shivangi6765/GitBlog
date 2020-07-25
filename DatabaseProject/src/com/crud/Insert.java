package com.crud;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Insert extends HttpServlet{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		PrintWriter out = res.getWriter();
		String roll = req.getParameter("Roll_no");
		String name = req.getParameter("Name");
		String course= req.getParameter("Course");
		String address= req.getParameter("Address");
		String ph_no = req.getParameter("Ph_no");
		
		
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedata", "root", "");
			
			
			Statement st = con.createStatement();
			int  i= st.executeUpdate("insert into studentdata values ("+roll+",'"+name+"','"+course+"','"+address+"','"+ph_no+"')");
			 
			if (i == 1) {
				out.print("data inserted");
			}
			else
			{
				out.print("data not inserted");
				
			}
				 
				
			}
			catch(Exception e){
				System.out.println(e);
			}
			
		}


	}
