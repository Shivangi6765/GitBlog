package com.tech.blog.servlets;
import com.tech.blog.entities.*;
import com.tech.blog.dao.*;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response .getWriter();
		
		int cid=Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		Part part = request.getPart("pPic");
		String filename =  part.getSubmittedFileName();
		//out.println("the title is="+pTitle);
		//getting current userid
		
		HttpSession session= request.getSession(); 
		User user = (User)session.getAttribute("currentUser");
		
		Post p= new Post(pTitle,pContent,pCode,filename,null,cid,user.getId());
		
		PostDao dao= new PostDao(ConnectionProvider.getConn());
		 if(dao.savePost(p)) {
			 
			String path = request.getRealPath("/")+"blog_pics"+File.separator+filename;
			 Helper.saveFile(part.getInputStream(),path);
			 out.println("done");
				
		 }else {
			 out.println("else");
		 }
		
	}

}
