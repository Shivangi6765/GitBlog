<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,com.tech.blog.helper.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
<!--  <h1>hello world!</h1>< %Connection con = ConnectionProvider.getConn();%><h1>< %=con %> </h1>  -->

  
 <!-- navbar -->
<%@include file ="navbar.jsp" %>

<!-- banner -->
<div class ="container-fluid p-0 m-0">  <!-- container fluid screen ki puri size lega -->
<div class = "jumbotron primary-background text-white banner-background">  <!-- banner ki shape me issi ki vjh se -->
<div class = "container">
<h3 class = "display-10">Welcome to TechBlog</h3>
<p> Welcome to technical blog,world of Technology.
A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.
</p>
<p>A programming language is a vocabulary and set of grammatical rules for instructing a computer or computing device to perform specific tasks. The term programming language usually refers to high-level languages, such as BASIC, C, C++, COBOL, Java, FORTRAN, Ada, and Pascal.
</p>

<button class ="btn btn-outline=light btn-lg"><span class = " fa fa-user-plus"></span>Start! Its Free..</button>
<a href="LoginPage.jsp" class ="btn btn-outline=light btn-lg"><span class = " fa fa-user-circle-o fa-spin"></span>Login</a>

</div>
</div>
</div>

<!-- cards -->
<div class = "container">  <!-- it means hum khali 70%width lenge 15 left,15 right se chod denge -->

<div class = "row mb-2">  <!-- ek row me 12 column hote h ,hme chahiye (4,4) kee 3 card  mb=margin bottom-->
<div class ="col-md-4"> <!-- means 4 column lelega -->

  <div class="card-body">
    <h5 class="card-title">Java Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>


</div>

<div class ="col-md-4"> <!-- means 4 column lelega -->

  <div class="card-body">
    <h5 class="card-title">Web Designing</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>


</div>

<div class ="col-md-4"> <!-- means 4 column lelega -->

  <div class="card-body">
    <h5 class="card-title">Javascript</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>


</div>



</div>

<div class = "row">  <!-- ek row me 12 column hote h ,hme chahiye (4,4) kee 3 card -->
<div class ="col-md-4"> <!-- means 4 column lelega -->

  <div class="card-body">
    <h5 class="card-title">C Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>


</div>

<div class ="col-md-4"> <!-- means 4 column lelega -->

  <div class="card-body">
    <h5 class="card-title">Python Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>


</div>

<div class ="col-md-4"> <!-- means 4 column lelega -->

  <div class="card-body">
    <h5 class="card-title">C++ Programming </h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Read More</a>
  </div>


</div>



</div>

</div>
  
<!-- javascript -->

<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="myjs.js" type="text/javascript"></script>

<script>
  <!-- $(document).ready (function(){ alert("document loaded")  }) to check whether jquery work or not-->


  
</script>


</body>
</html>