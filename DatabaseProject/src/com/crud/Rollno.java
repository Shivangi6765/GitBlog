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


public class Rollno extends HttpServlet{
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		PrintWriter out = res.getWriter();
		String rollno = req.getParameter("Rollno");
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedata", "root", "");
			
			
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("Select * from studentdata where Roll_no = '"+rollno+"'");
			
			if(rs.next()) {
				out.print("<html><body bgclor='cyan'>");
				out.print("<h1 align = 'center' >Student Profile</h1>");
				out.print("<table border = '1' align = 'center'  = '2'><tr><th><h2>Roll No :-  </h2></th>") ; //<th>Course</th><th>Branch</th><th>Name</th><th>Email Id</th><th>Gender</th><th>DOB</th><th>Contact No</th><th>City</th><th>Address</th></tr>");
				out.print("<td><h2>");
				out.print(rs.getString("Roll_no"));
				out.print("</h2></td>");
				out.print("</tr>");
				
				out.print("<tr><th><h2>Name :-  </h2></th>") ; 
				out.print("<td><h2>");
				out.print(rs.getString("Name"));
				out.print("</h2></td>");
				out.print("</tr>");
				
				out.print("<tr><th><h2>Course :- </h2></th>") ; 
				out.print("<td><h2>");
				out.print(rs.getString("Course"));
				out.print("</h2></td>");
				out.print("</tr>");
				
				out.print("<tr><th><h2>Address :- </h2></th>") ; 
				out.print("<td><h2>");
				out.print(rs.getString("Address"));
				out.print("</h2></td>");
				out.print("</tr>");
				

				out.print("<tr><th><h2>Ph_no :- </h2></th>") ; 
				out.print("<td><h2>");
				out.print(rs.getString("Ph_no"));
				out.print("</h2></td>");
				out.print("</tr>");
				
				


				
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		out.print("</table></body></html>");
	
	}

}
