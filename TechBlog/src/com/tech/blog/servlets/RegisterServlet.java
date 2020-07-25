package com.tech.blog.servlets;
import com.tech.blog.dao.*;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.entities.*;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.annotation.MultipartConfig;
import  java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		//fetch all form data
		
		String check= request.getParameter("check");
		if(check==null)            // means checkbox pe tick nhi kiya
		{
			out.println("please check terms and conditions");
		}
		else {
			//baaki ka data isme aayega
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			Part part = request.getPart("profile");                   
			String profile = part.getSubmittedFileName();  //profile ka name with extension sill store
		    // out.println(profile);
			
		
			//create user object and set all data to that object
			User user = new User(name,email,password,gender,about,profile);
			
		//create a userdao object
			UserDao dao = new UserDao(ConnectionProvider.getConn());
			if(dao.saveUser(user)) {   //return boolean f value if it returns true
				
				InputStream is = part.getInputStream();//is me vo filename aa jaayega
				byte []data = new byte[is.available()];//array ki form me store
				
				is.read(data);
				String path = request.getRealPath("/")+"pics"+"\\"+profile;//path dega jhaa image h C:\Users\dell\eclipse-workspace\register\build\web '/' ye khali itta path dega lekin hme image folder add krne ke liye khud se folder add krna hoga
				//'\\'used to add any folder to a path,we can also used file.separator
				//out.println(path); 
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(data);
				fos.close();
				
		
				//save
				out.println("done");   // isse simply next pr done ya error likha aa jaayega lekin hum chahte ussi page pr achcha sa done likha aaye to we use ajax
			}
			else {
				out.println("error");
			}
		}
		
	}

}
