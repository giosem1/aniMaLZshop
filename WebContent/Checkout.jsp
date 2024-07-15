<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="model.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../styles/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<meta charset="UTF-8">
<title>Checkout</title>
</head>
<body>   	
	<%@ include file="./fragment/header.jsp" %>	
	
       <% 
			UtenteBean utente = (UtenteBean) request.getSession().getAttribute("currentSessionUser");		
			if (utente != null) {
				if (utente.getVia() != null && utente.getNumCivico() != null && utente.getCap() != 0 && utente.getCartaCredito() != null) {
		%>       
          
          <form action="./checkout" method="post" class="MyForm" >			     
	          
	        <div class="table">
	            <p>Via:</p>
	            <p><input type="text" name="via" value="<%=utente.getVia()%>" required></p>
	        </div>    
	        
	        <div class="table">
	        <p id="errVia"></p>
	        </div>
	        
	        <div class="table">
	            <p>Via:</p>
	            <p><input type="text" name="cap" value="<%=utente.getCap()%>" required></p> 
	        </div>
	        
	         <div class="table">
	        <p id= "errCap"></p>
	        </div>
			
			
	        <div class="table">
	            <p>Via:</p>
	            <p><input type="text" name="numCivico" value="<%=utente.getNumCivico()%>" required></p> 
	        </div>
	        
	        <div class="table">
	        <p id= "errNumCivico"></p>
	        </div>
	        
	        <div class="table">
	            <p>Via:</p>
	            <p><input type="text" name="cartaDiCredito" value="<%=utente.getCartaCredito()%>" required></p> 
	        </div>
	        
	        <div class="table">
	        <p id= "errCartaCredito"></p>
	        </div>
	        
	        	        <div class="clic">
	       <p> <input type="submit" value="Completa ordine" > </p>
	        </div>
	    </form>
	
	<%} else { %>
	 <form action="./checkout" method="post" class="MyForm" >			     
	          
	        <div class="table">
	            <p>Via:</p>
	            <p><input type="text" name="via" placeholder="Inserisci via" required></p>
	        </div>    
	        
	        <div class="table">
	        <p id="errVia"></p>
	        </div>
	        
	        <div class="table">
	            <p>CAP:</p>
	            <p><input type="text" name="cap" placeholder="Inserisci CAP" required></p> 
	        </div>
	        
	         <div class="table">
	        <p id= "errCap"></p>
	        </div>
			
	        <div class="table">
	            <p>Numero Civico:</p>
	            <p><input type="text" name="numCivico" placeholder="Inserisci numero civico" required></p> 
	        </div>
	        
	        <div class="table">
	        <p id= "errNumCivico"></p>
	        </div>
	        
	        <div class="table">
	            <p>Carta di credito:</p>
	            <p><input type="text" name="CartaDiCredito" placeholder="Inserisci carta di credito" required></p> 
	        </div>
	        
	        <div class="table">
	        <p id= "errCartaCredito"></p>
	        </div>
	        
	        <div class="clic">
	       <p> <input type="submit" value="Completa ordine"> </p>
	        </div>
	    </form>
	<% } }%>
	
	<%@ include file="./fragment/footer.jsp" %>	
</body>
</html>