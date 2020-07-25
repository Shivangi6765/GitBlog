<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import = "com.tech.blog.entities.*" %>
    <%@page errorPage = "Error_page.jsp" %>
     <%@page import = "com.tech.blog.entities.Message"%>
     <%@page import = "com.tech.blog.dao.PostDao,java.util.*" %>
     <%@page import = "com.tech.blog.helper.ConnectionProvider" %>
    <%
     //validation ke liye h jb login ho tbhi is page pr aaye
   User user = (User)session.getAttribute("currentUser");
    if(user==null)   //phir se check
    {
    	
    	response.sendRedirect("LoginPage.jsp");
    }
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>


 <!-- css -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
  .banner-background{
     clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}

body{
        background:url(pics/bg.jpg);
        background-size:cover;
        background-attachment:fixed;
}
</style>

</head>
<body>

<!-- navbar -->

<nav class="navbar navbar-expand-lg navbar-light  primary-background">
  <a class="navbar-brand" href="index.jsp">  <span class = "fa fa-asterisk"> </span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class = "fa fa-bell-o"></span>Learn code with Shivangi <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <span class = "fa fa-check-square-o"></span> Categories </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="#"><span class = "fa fa-address-book"></span>Contact</a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class = "fa fa-asterisk"></span>Do Post</a>
      </li>
       </ul>
    
    <ul class = "navbar-nav mr-right">
    <li class = "nav-item">
    <a class = "nav-link" href = "#!" data-toggle ="modal" data-target = "#profile-modal"><span class = "fa fa-user-circle"></span><%= user.getName() %></a>
    </li>
    <li class = "nav-item">
    <a class = "nav-link" href = "LogoutServlet"><span class = "fa fa-user-plus"></span>Logout</a>
    </li>
    
    </ul>
  </div>
</nav>



<!-- end of navbar -->
<!-- edit servlet vaala message aayega yhaa -->

<%
 Message m = (Message)session.getAttribute("msg");      
 if(m!=null)
	  
 {
	 %>
	 <!--  agr value null nhi hui to ye chlega-->
	 
	 <div class = "alert <%=m.getcssClass() %> role = "alert">   <!-- alert-danger jo cssClass me paas kiya vo yhaa get kiya -->
	 <%=m.getContent() %>
 </div>
 <% 
 
 session.removeAttribute("msg");
	 
 }
 
 %>
 
 <!-- main body of the page -->
 <main>
 <div class="container">
 <div class="row mt-4">
 <!-- first column -->
 <div class="col-md-4">
 
 <!-- categories -->
 
 <div class="list-group">
  <a href="#" onclick="getPosts(0,this)" class=" c-link list-group-item list-group-item-action active">All Posts</a>
 <!--  Categories  -->
  
  <%
     PostDao d =new PostDao(ConnectionProvider.getConn());
     ArrayList<Category> list1 = d.getAllCategories();
     for(Category cc:list1){
   %>
    <a href="#" onclick="getPosts(<%=cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%=cc.getName() %></a>  <!-- active word htana h  -->
   <!-- this ka mtlb jis post pr click kiya vo post --> 	 
  <%  	 
     }
  %>
  </div>
 </div> 
  
 <!-- second column -->
 <div class="col-md-8">
 <!-- post -->
 
 <div class = "container text-center" id = "loader">
 <i class="fa fa-refresh fa-3x fa-spin"></i>
 <h3 class =:mt-2">Loading...</h3>
 </div>
 
 <div class = "container-fluid" id ="post-container"></div>  <!-- alg se isliye bnaya kyunki html(data) ne hmare loader ko permanently hide kr diya h -->
 </div>
 </div>
 
 
 </div>
 
 </main>
 <!-- end of main body -->
 
 

<!-- star of profile modal -->

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLongTitle">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class = "container text-center">
         <img src="pics/<%=user.getProfile() %>" class ="img-fluid" style="border-radius:50%;max-width:150px" >
         <br>
        <h5 class="modal-title mt-3" id="exampleModalLongTitle"><%=user.getName() %></h5>
        
        <!-- details -->
        
        <div id ="profile-detail">
        <table class="table">
  <tbody>
    <tr>
      <th scope="row">ID</th>
      <td><%=user.getId() %></td>
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td><%= user.getEmail()%></td>
    </tr>
    <tr>
      <th scope="row">Gender:</th>
      <td><%= user.getGender() %></td>
   </tr>
   <tr>
      <th scope="row">Status:</th>
      <td><%= user.getAbout() %></td>
   </tr>
   <tr>
      <th scope="row">Registered on:</th>
      <td><%=user.getDatetime().toString()%></td>
   </tr>
  </tbody>
</table>
</div>
 
<!-- profile edit --> 

<div id="profile-edit" style= "display:none;">
<h3 class="mt-2">Please Edit carefully!</h3>  <!-- margin top =2 -->

<div class ="card-body">
<form action ="EditServlet" method="post" enctype="multipart/form-data">  <!-- enctype attribute image ke liye use hua h jo btata h ki aapka form multiple type ka data store krke le jaa rha hlike image,audio,video  -->
<table class ="table">
<tr>
<td>ID:</td>
<td class = "form-control"><%=user.getId() %></td>
</tr>
<tr>
<td>Email:</td>
<td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail() %>" ></td>  <!-- bootstrap me bnane ke liye form-control -->
</tr>
<tr>
<td>Name:</td>
<td><input type ="text" class ="form-control" name="user_name" value="<%=user.getName() %>"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type ="password" class ="form-control" name="user_password" value="<%=user.getPassword() %>"></td>
</tr>
<tr>
<td>Gender:</td>
<td class="form-control"><%=user.getGender().toUpperCase() %></td>
</tr>
<tr>
<td>About:</td>
<td>
   <textarea rows ="3" class ="form-control" name ="user_about"><%=user.getAbout() %>
    </textarea>
   </td>
</tr>
<tr>
<td>New Profile:</td>
<td><input type ="file" class ="form-control" name="profile" value="<%=user.getProfile() %>"></td>
</tr>

</table>

<div class = "container">
<button rows="2" type="submit" class="btn- btn-outline-primary">Save</button>
</div>

</form>
</div>

</div>  
 </div>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!-- end of profile modal -->

<!-- add post modal -->

<div class="container">
<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the Post details..</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form id="add-post-form" action="hy" method="post">
        
        <div class="form-group">
        <select class="form-control" name="cid">
        <option selected disabled>---Select Category---</option>
       
        
    <% 
        PostDao postd = new PostDao(ConnectionProvider.getConn());
        ArrayList<Category>list=postd.getAllCategories();
        for(Category c:list){
    
    %>
        <option value="<%=c.getCid() %>" ><%=c.getName() %> </option>
        
        <%
        }
        %>
        
        </select>
        
        
        </div>
        
        <div class="form-group">
        <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/></div>
         <br>
        <div class ="form-group">
        <textarea name="pContent" class="form-control" style="height:200px;" placeholder="Enter your Content"></textarea>
        </div>
        <div class ="form-group">
        <textarea name="pCode" class="form-control" style="height:200px;" placeholder="Enter your Program(If any):"></textarea>
        </div>
        <div class="form-group">
        <label>Select your pic:</label>
        <br>
        <input type="file" name="pPic"/>
        
        
        </div>
        
        </div>
        
        <div class="container text-center">
        <button type="submit" class="btn btn-outline-primary">Post</button>
        </div>
        </form>
        
      </div>
      
    </div>
  </div>
</div>


<!-- end of post modal -->


<!--  < %= user.getName() %>
<br>
< %= user.getEmail() %>
<br>
< %= user.getAbout() % >      -->


<!-- javascript -->

<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="http://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="myjs.js" type="text/javascript"></script>

<script>

$(document).ready(function(){[]
	
	let editStatus = false;
	
	$("#edit-profile-button").click(function(){
		//alert("button click");
		if(editStatus==false) //edit pe ek baar click krne pe profile-edit show ho or dusri baar profile-details aisa chlta rhe ise toggle khte h
	
			{
			  $("#profile-detail").hide();  //hum phli vaali details ko hide krke edit krke jo dtails aayi h unhe show krna chahte h
			  $("#profile-edit").show();
			   editStatus=true;
			   $(this).text("Back");//edit button change hoke back button bn jaaye
			}
		
		else{
			
			$("#profile-detail").show();  //hum phli vaali details ko hide krke edit krke jo dtails aayi h unhe show krna chahte h
			$("#profile-edit").hide();
			editStatus=false;
			$(this).text("Edit");
		}
		
	})
	
});



</script>
<!-- now add post js -->
<script>

$(document).ready(function(){
	
	$("#add-post-form").on("submit",function(event){
	
		//this code gets called when form is submitted
		event.preventDefault();
		console.log("you have clicked on submit");
		let form = new FormData(this);
		
		//now requesting to server
		$.ajax({
			
			url:"hy",
			type:'POST',
			data:form,
			
			success:function(data,textStatus,jqXHR){
				//success..
				console.log(data);
				if(data.trim()=='done'){
					swal("Good job!","saved successfully","success");
				}
				else{
					swal("Error!","Something went wrong","error");
				}
			},
			error:function(jqXHR,textStatus,errorThrown){
				
				//error..
					swal("Error!","Something went wrong","error");
			
			},
			
			processData:false,
			contentType:false
			
		})
	})
	
	
	
});

</script>

<!-- loading post using AJAX -->

<script>
 function getPosts(catId,temp){ // jb hum getpost ko call krein tbhi chlega vrna nhi phle hrr baar chl rha tha, temp is the refrence of link user have clicked
	 
	 $("#loader").show();
     $("#post-container").hide();
     
     $(".c-link").removeClass('active')    //jispe click ho vo active bne means uska color change ho baai sb vaise hi rhe iskiye hum phle sbko hi inactive kr rhe h
   	 
    $.ajax({
		
		url:"Load_Post.jsp",
		data:{cid:catId},
		success: function(data,textStatus,jqXHR){
			console.log(data);
			$("#loader").hide();
			$("#post-container").show();
			$("#post-container").html(data); //Load_Post ka data yhaa aajayega
			$(temp).addClass('active');  //hme grab krna h vo button jisko humne click kiya h,uska refrence h temp ke paas,so take temp and make it active.
	   	}
		
	 })
 }


$(document).ready(function(e){
  
	
	let allPostRef=$('.c-link')[0]  //initially koi active nhi tha hum chate h by default all post vala active ho so 0th location pr all post h 
	getPosts(0,allPostRef) //0 mtlb saari post load krni h otherwise category wise, ab document load hote hi ye function call hoga or 
	 //vo le jaayega phle vale button ka reference then phle vaale button ka ref temp0 me aajayega.nd initially temp active ho jaayega 
	
	
	
	/*$.ajax({   //jb bhi page load ho rha tha tbhi chl rha tha
	
	url:"Load_Post.jsp",
	success: function(data,textStatus,jqXHR){
		console.log(data);
		$("#loader").hide();
		$("#post-container").html(data); //Load_Post ka data yhaa aajayega
		
	}
	
}) */

})




</script>







</body>
</html>