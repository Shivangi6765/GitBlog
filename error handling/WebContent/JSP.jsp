<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
     <meta charset="ISO-8859-1">
     <title>Insert title here</title>
</head>
<body>
    <h1>Hello World!</h1>
    
    <!-- 1. out tag: (alternative of expression tag) -->
    <!-- 2. set tag: (use to create variable) -->
    
    <c:set var="i" value="23" scope="application"></c:set>
    
    <!-- scope me humne application daala h to ab ye hmare pure project me chlega -->
    <!-- yaani mi kisi dusre page me bhi cout ki help se access ho jaayega of same project -->
    
    <h1> <c:out value="${i}"></c:out> </h1>
    
    <!-- 3.remove tag: -->
    
    <c:remove var = "i"></c:remove>
    <h3><c:out value="${i}" > this is default value </c:out></h3>
    <hr>
    
    <!-- 4. if tag: (jo krta h condition ko check :true=>print..) -->
    
    <c:set var="i" value="23" scope="application"></c:set>
    <c:if test="${i == 23}">
      <h1> yes, i is 23 and condition is true</h1>
    </c:if>
    
    <!-- 5. choose,when,otherwise:java switch -->
    
    <c:choose>
      <c:when test="${i>0 }">
        <h1>this is my case 1</h1>
        <h2>no. is positive</h2>
      </c:when>
      
      <c:when test="${i<0}">\
        <h1>this is second case</h1>
        <h2>no. is negative</h2>
      </c:when>
      
      <c:otherwise>
         <h1>Default case..otherwise</h1>
         <h1>the no is zero</h1>
      </c:otherwise>
    
    </c:choose>
    
    <!-- 6.forEach tag:for repeating and traversing -->
    
    <c:forEach var="j" begin="1" end="10">
      <h1>value of j is<c:out value="${j}"></c:out> </h1>
    </c:forEach>
    
    <!-- 7. redirect -->
    
    <c:url var="myurl" value="http://www.google.com/search">
      <c:param name="q" value="java"></c:param>
    </c:url>
    <h1><c:out value="${myurl}"></c:out></h1>
    <c:redirect url="${myurl }"></c:redirect> <!-- direct google ke search page pr lekr gya redirect -->
    <!-- hum redirect url =www.google.com pr bhi jaa skte h -->
 
    
    
       
    
     
    
    
    
    
</body>
</html>