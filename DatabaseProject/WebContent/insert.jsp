<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert here</title>
<script>
function validation()
{
	var roll= document.forms[0].roll_no.value;
	if(roll == "" || roll == null){
	
	alert("** please fill name");	
	}
}

</script>
</head>
<style>
body{
background-image: url(collegecampus.jpg);
background-repeat: no-repeat;
background-size: cover;
margin-top:100px;
 text-align:center;
 font-family:sans-serif;
 line-height:20px;
 font-size:20px;
}
.hy{
font-size:30px;
font-family:Times New Roman;
transition:all 4s ease-in-out;
}
.submit{

background:#ff5722;
border-color:transparent;
	color:#fff;
	font-size:20px;
	font-weight:bold;
	letter-spacing:2px;
	height:30px;
	margin-top:5px;
	width:250px;
	
}
.submit:hover
{
	
	background-color:#f44336;
	cursor:pointer;
	
}
</style>

<body align = "center" 	><form action="insert" form id="contact-form"  method="POST" onsubmit="return validation();">

      <h1 class ="hy">
       <p style="color:#ff8000">Insert !</p>
      </h1>
	  
     

	
     <p style="color:#fff"> RollNo :  
     <input name="Roll_no"type="text">
	 <br>
	 <br>
	  Name :
	  <input name="Name"type="text">
	  <br>
	  <br>
	  Course:
	  <input name="Course"type="text">
	  <br>
	  <br>
	  Address:
	  <input name="Address"type="text">
	  <br>
	  <br>
	  Ph_no:
	  <input name="Ph_no"type="text">
	  <br>
	  <br>
	  
	  <form onsubmit="return validation();">
	  
	  <input type="submit"class="submit">
	  </form>
	  
	  </form>
	 
	  
</body>
</html>