<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title> Registrazione </title>
	    <script src="scripts.js"></script>
		<link rel="stylesheet" href="../styles/style.css" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	</head>

	<body>

	<%@ include file="../fragment/header.jsp" %>


		<h2 class="title">Crea un account</h2>
		<form action="../Registration" method="post" id="MyForm">
				<div id="table">
	            <p>Nome:</p>
	            <p><input type="text" name="nome" placeholder="Inserisci nome" ></p>
	        </div>
	
	        <div id="table"> 
	            <p>Cognome:</p>
	            <p><input type="text" name="cognome" placeholder="Inserisci cognome"></p>
	        </div>
	
	        <div id="table">
	            <p>Email:</p>
	            <p><input type="email" name="email" placeholder="Inserisci email" ></p>
	        </div>
	
	        <div id="table">
	            <p>Data di nascita:</p>
	            <p><input type="date" name="dataNascita" placeholder="GG/MM/AAAA" ></p>
	        </div>
	
	        <div id="table">
	            <p>Telefono:</p>
	            <p><input type="tel" name="telefono" placeholder="Inserisci telefono" ></p>
	        </div>
	
	        <div id="table" class="password-container">
	            <p>Password:</p>
	            <p><input type="password" name="pwd" id="password" placeholder="Inserisci password"></p>
	                   <span id="toggle-password" class="material-symbols-outlined" onclick="togglePasswordVisibility()">visibility</span>
	        </div>
	
	        <div id="clic"> 
	            <p><input type="submit" value="Crea Account"></p>
				<a href="<%= request.getContextPath()%>/common/Login.jsp">Hai già un account? Accedi!</a>
			</div>	
			
	</form>
	
	 <%@ include file="../fragment/footer.jsp" %>	
             
	</body>
	
</html>