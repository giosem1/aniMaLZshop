<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="initial-scale=1,width=device-width">
<title>Insert title here</title>
	<link rel="stylesheet" href="./styles/style.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
<header>
	 <div id="logo">
		<a href="<%= request.getContextPath() %>/Home.jsp"><img src="./images/logo.png" width="250" height="65"></a>
	 </div>
	 
	  <div id="icone">
	  	<% UtenteBean ute= (UtenteBean) request.getSession().getAttribute("currentSessionUser");
	  		if(ute !=null){%>
	  		<div class="drop">
	  			<a href="<%= request.getContextPath() %>/Account.jsp" class="dropfirst"><img src="./images/persona.png" width="40" height="40"></a>
	  			<div class="elem-content">
	  			<a href="<%= request.getContextPath() %>/ordine?azione=order&id=<%= ute.getId()%>">I miei ordini</a>
	  			
	  			<%if(ute.isAmm()) {%>
	  			<a href="<%= request.getContextPath() %>/admin/AddProduct.jsp">Aggiungi prodotti</a>
	  			<a href="<%= request.getContextPath() %>/admin/AddNews.jsp">Aggiungi News</a>
	  			<a href="<%= request.getContextPath() %>/admin/Catalogo.jsp">Catalogo</a>
	  			
	  			<a href="<%= request.getContextPath() %>/ordine?azione=orders">Ordini totali</a>
	  			<%}%>
	  			
	  			<a href="<%= request.getContextPath() %>/Logout">Logout</a>
	  			</div>
	  		</div>	
	  		<%}else {%>
		 		<a href="<%= request.getContextPath() %>/Login.jsp"><img src="./images/persona.png" width="40" height="40"></a>
		 	<%}%>
		 		<a href="<%= request.getContextPath() %>/Preferiti.jsp"><img src="./images/preferiti.png" width="40" height="40"></a>	
	    		<a href="<%= request.getContextPath() %>/Carrello.jsp"><img src="./images/carrello.png" width="40" height="40"></a>
		
	  </div>
	
	</header>
</body>
</html>