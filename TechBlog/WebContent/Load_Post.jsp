<%@page import ="com.tech.blog.entities.*" %>
<%@page import="java.util.List" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.dao.*" %>

<div class ="row">


<%
   User user = (User)session.getAttribute("currentUser");
   
   Thread.sleep(1000);
   PostDao d = new PostDao(ConnectionProvider.getConn());
   int cid = Integer.parseInt(request.getParameter("cid")); //ye cid vo h jo profile.jsp vaale page me se mili
   
   List<Post> posts = null;
   
   if(cid==0){
     posts = d.getAllPosts();
   }else{
	   
	   posts = d.getPostByCatId(cid);
	   
   }
   
   if(posts.size()==0){
	   out.println("<h3 class = 'display-3 text-center'> No post in this category..</h3>");
	   return;
   }
   
   for(Post p:posts)
   {
 %>

<div class="col-md-6  mt-2 ">	  
<div class ="card">
<img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
<div class="card-body">
<b><%=p.getpTitle() %></b>
<p><%=p.getpContent() %></p>
<!--  <pre>< %=p.getpCode() % > </pre>   --> <!-- pre used to show code -->
</div>

<div class = "card-footer primary-background text-center">

<%
LikeDao ld = new LikeDao(ConnectionProvider.getConn());

%>



<a href="#" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class = "btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class = "like_counter"><%=ld.countLikeOnPost(p.getPid()) %></span></a>  <!-- <i> is used to show icon and span to show kitte like aaye h -->
<a href="#" class = "btn btn-outline-light btn-sm"><i class = "fa fa-commenting-o"></i><span>20</span></a>
<a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class = "btn btn-outline-light btn-sm">Read More..</a> <!-- hme show_blog vaale page pr pid chahiye jiska vo blog h -->
                                
                                <!-- to hum next page pr id using url rewriting ke thorugh lekr jaayenge -->


</div>

</div>
</div>	
</div> 
	   
	   <%
   }
%>