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


public class Delete extends HttpServlet{
	
	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException{
		
		PrintWriter out = res.getWriter();
		String roll = req.getParameter("Roll_no");
       
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegedata", "root", "");
			
			
			Statement st = con.createStatement();
            int r =st.executeUpdate("Delete from studentdata where Roll_no = '"+roll+"'");
            if(r>0)
            {
            	out.print("Successfully delete");
            
            }
            else
			{
				out.print("data not deleted");
				
			}
		    
		    }
		catch(Exception e) {
			System.out.println(e);
		}
            
		
	}
	
	
}

