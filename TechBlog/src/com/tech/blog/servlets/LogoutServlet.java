package com.tech.blog.servlets;
import com.tech.blog.entities.*;

import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LogoutServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession s =request.getSession();
		
		s.removeAttribute("currentUser"); //jb logout kreinge to session me user ka data delete ho jaayega
		Message m = new Message("Logout Successfully","success","alert-success");
		
		response.sendRedirect("LoginPage.jsp");
		
		s.setAttribute("msg", m);
			
		
		
		
		
		
		
		
	}

}
