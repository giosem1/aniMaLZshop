<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title> Registrazione </title>
		<link rel="stylesheet" href="css/style.css" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	</head>

	<body>

	<%@ include file="./page/header.jsp" %>
	<%@ include file="./page/menu.jsp" %>

		<h2 id="title">Crea un account</h2>
	
		<form action="" method="post" id="MyForm">
			
		
		<div id="table">
			<p>Nome</p>
			<p><input type="text" placeholder="Inserisci nome" ></p>	
		</div>
	
		<div id="table"> 
			<p>Cognome</p>
			<p><input type="text" placeholder="Inserisci cognome"></p>
		</div>
		
		<div id="table">
			<p>Email</p>
			<p><input type="email" placeholder="Inserisci email" ></p>	
		</div>
		
		<div id="table">
			<p>Data di nascita</p>
			<p><input type="date" placeholder="GG/MM/AAAA" ></p>	
		</div>
		
		<div id="table">
			<p>Telefono</p>
			<p><input type="tel" placeholder="Inserisci telefono" ></p>	
		</div>
	
		<div id="table">
			<p>Password</p>
			<p><input type="password" id=password placeholder="Inserisci password"></p>
			<span class="material-symbols-outlined" id="togglePassword">Visibility</span>
		</div>    

		<div id="reg"> 
			<p></p>
			<p><input type="submit" value="Crea Account"></p>
			<a href="<%= request.getContextPath()%>/Login.jsp">Hai già un account? Accedi!</a>
		</div>	
		

	</form>
	
	<script>
	
	</script>
	
	 <%@ include file="./page/footer.jsp" %>	
             
	
	</body>
	
</html>