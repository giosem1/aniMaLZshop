<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
			<link rel="stylesheet" href="css/style.css" type="text/css">
			<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	</head>
	<body>
         <%@ include file="./page/header.jsp" %>
	     <%@ include file="./page/menu.jsp" %>	
        
        <h2 id="title">Accesso</h2>
        
        <form action="Login" method="post" id="MyForm">
				<div id="table">
					<p>Username:</p>
					<p><input type="text" required placeholder="Insercisci email"></p>
			    </div>
			    
			    <div id="table">
					<p>Password:</p>
					<p><input type="password" id="password" required placeholder="Inserisci password"></p>
					<span class="material-symbols-outlined" id="togglePassword">Visibility</span>
				</div>    
				    
                <div id="Access">
			   		 <p><input type="submit" value="Accedi"></p>
			    	 <a href="<%= request.getContextPath()%>/Registration.jsp">Registrati!</a>
		    	</div>
        </form>
        
        <script>
 
        </script>
        
        <%@ include file="./page/footer.jsp" %>	
             
	</body>
</html>