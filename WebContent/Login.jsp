<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		    <script src="scripts.js"></script>
			<link rel="stylesheet" href="styles/style.css" type="text/css">
			<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	</head>
	<body>
         <%@ include file="./fragment/header.jsp" %>
        
        <h2 id="title">Accesso</h2>
        
        <form action="Login" method="post" id="MyForm">
				<div id="table">
					<p>Username:</p>
					<p><input type="text" required placeholder="Insercisci email"></p>
			    </div>
			    
			  	<div id="table" class="password-container">
			       <p>Password:</p>
		           <p><input type="password" id="password" placeholder="Inserisci password"></p>
                   <span id="toggle-password" class="material-symbols-outlined" onclick="togglePasswordVisibility()">visibility</span>
				</div>
				    
                <div id="clic">
			   		 <p><input type="submit" value="Accedi"></p>
			    	 <a href="<%= request.getContextPath()%>/Registration.jsp">Registrati!</a>
		    	</div>
        </form>
        
        <%@ include file="./fragment/footer.jsp" %>	
             
	</body>
</html>