<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>

<!-- css -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
  .banner-background{
     clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}
</style>

</head>
<body>

<!-- navbar -->
<%@include file="navbar.jsp" %>


<main class="primary-background  banner-background" style="padding-bottom:90px; ">

<div class = "container">
 <div class = "row">
 <div class ="col-md-6 offset-md-3">
 <div class = "card">

<div class = "card-header text-center primary-background text-white">
<span class="fa fa-user-circle fa-3x"></span>
<br>
Register Here!
</div>

<div class= "card-body">
<form action="RegisterServlet" method="post" id="myform">


  <div class="form-group">
    <label for="user_name">User Name</label>
    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
   </div>
  

  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="user_email"  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  
  
  <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio" id="gender" name="gender" value = "male">Male
    <input type="radio" id="gender1" name= "gender" value= "female">Female
  </div>
  
  
  <div class ="form-group">
  <textarea name= "about" class="form-control" id="" rows="5" placeholder="Enter something about youself"></textarea>
  </div>
  <div class="file-field input-field">
          <div class="btn blue">
          <span>File</span>
          <input name="profile" type="file">
          </div>
          <div class="file-path-wrapper">
          <input class="file-path validate" type="text">
          </div>
          </div>
  
  <div class="form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Terms & Conditions</label>
  </div>
  <br>
  <div class="container text-center" id="loader" style= "display:none;"><span class= "fa fa-refresh fa-spin fa-3x"></span>
  <h4>Please wait..</h4>
  </div>
  <br>
  <button id="submit_btn"  type="submit" class="btn btn-primary">Submit</button>
</form>
 </div>

</div>


</div>
</div>
</div>


</main>





<!-- javascript -->

<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="myjs.js" type="text/javascript"></script>

 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--  < script>  -->
  <!-- $(document).ready (function(){ alert("document loaded")  }) to check whether jquery work or not -->
 <!--  < /script> -->

<!-- done ya error ko form page pr hi dikhane ke liye we use ajax -->
 <script>
   $(document).ready(function(){
	
	console.log("loaded.....");

	$("#myform").on('submit',function(event){
		event.preventDefault();
		
		$("#submit_btn").hide();
		$("#loader").show();
		
		let form = new FormData(this);
		
		//send register servlet
		$.ajax({
			url: "RegisterServlet",
			type:'POST',
			data:form,
			success: function(data,textStatus,jqXHR){
			
				console.log(data);
				console.log("success....");
				
				$("#submit_btn").show();
				$("#loader").hide();
				
				
				if(data.trim()=='done')
					{
					swal("Registered Successfully!", "...We are redirecting to Login Page.")
					.then((value) => {
					  window.location = "LoginPage.jsp"
					});
					
					}
				
				else{
					swal(data);
					
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				
				$("#submit_btn").show();
				$("loader").hide();
				
				
				swal("Something went wrong..Try Again");
				
				
			},
			
			
			processData:false,   <!--//hme process data nhi krna h  -->
			contentType:false    <!--//na hi btana h content kya h -->
		
		})
		
	})
	
	
})




</script>

</body>
</html>