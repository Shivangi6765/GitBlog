package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider{
	

	
	private static Connection con; //static isliye bnaya kyunki con ki value bar bar change hoti rhe acoording to the user
	public static Connection getConn()
	{
	
	    try {
		   if(con==null) //con me value 0 mtlb connection create krna or means abhi connection nhi bna h,or agr con me koi value h means create krne ki need h connection huava milega ..dubara dubara connect krne ki need nhi hogi
		   {
	          Class.forName("com.mysql.jdbc.Driver");
	          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","");
	
	       }
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
		
	    }
	return con;
	  
	}
	
	
	
}
