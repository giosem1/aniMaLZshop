<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title> Registrazione </title>
	    <script type="text/javascript" src="./script/scripts.js"></script>
		<link rel="stylesheet" href="./styles/style.css" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	</head>

	<body>

	<%@ include file="./fragment/header.jsp" %>


		<h2 class="title">Crea un account</h2>
		<form action="./Registration" method="post" class="MyForm" onsubmit="event.preventDefault(); validate(this)">
				<div class="table">
	            <p>Nome:</p>
	            <p><input type="text" name="nome" placeholder="Inserisci nome"></p>
	        </div>
	        
	        <div class="table">
	          <p id="errNome"></p>
	        </div>
	
	        <div class="table"> 
	            <p>Cognome:</p>
	            <p><input type="text" name="cognome" placeholder="Inserisci cognome" required></p>
	        </div>
	        
	           <div class="table">
	             <p id="errCognome"></p>
	           </div>
	
	        <div class="table">
	            <p>Email:</p>
	            <p><input type="email" name="email" placeholder="Inserisci email" required></p>
	        </div>
	        
	        <div class="table">
	            <p>Data di nascita:</p>
	            <p><input type="date" name="dataNascita" placeholder="GG/MM/AAAA" required></p>
	        </div>	            
	
	        <div class="table">
	            <p>Telefono:</p>
	            <p><input type="tel" name="telefono" placeholder="Inserisci telefono" required></p>
	        </div>
	        
	           <div class="table">
	             <p id="errTelefono"></p>
	           </div>
	
	        <div class="password-container">
	            <p>Password:</p>
	            <p><input type="password" name="pwd" id="password" placeholder="Inserisci password" required></p>
	            <span id="toggle-password" class="material-symbols-outlined" onclick="togglePasswordVisibility()">visibility</span>
	        </div>
	        
	           <div class="table">
	            <p id="errPwd"></p>
	           </div>
	           
	             <div>
	                <%
                      String error = (String) request.getAttribute("error");
                      if (error != null) {
                   %>
                       <p style="color: rgba(208,128,242,1); margin-left: 15.5%"><%= error %></p>
                   <%
                   }
                   %>	
               </div>
	
	        <div class="clic"> 
	            <p><input type="submit" value="Crea Account"></p>
				<a href="<%= request.getContextPath()%>/Login.jsp">Hai già un account? Accedi!</a>
			</div>	
			
	</form>
	
	 <%@ include file="./fragment/footer.jsp" %>	
             
	</body>
	
</html>