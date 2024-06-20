<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="styles/style.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
<header>
	 <div id="logo">
		<a href="<%= request.getContextPath() %>/Home.jsp"><img src="images/logo.png" width="250" height="65"></a>
	 </div>
	 
	  <div id="icone">
		 <a href="<%= request.getContextPath() %>/Login.jsp"><img src="images/persona.png" width="40" height="40"></a>
		 <img src="images/preferiti.png" width="40" height="40">	
	     <img src="images/carrello.png" width="40" height="40">
	  </div>
	
	</header>
</body>
</html>