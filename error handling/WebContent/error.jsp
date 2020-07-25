<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="handling.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
    //fetch two nuumbers
    
     String num1=request.getParameter("n1");
     String num2=request.getParameter("n2");
     
     //converting string into integers...
     int a = Integer.parseInt(num1);
     int b = Integer.parseInt(num2);
     int c = a/b;
     
 
%>
<h1>Result is : <%=c %></h1>
     

</body>
</html>