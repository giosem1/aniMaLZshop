<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		    <script src="scripts.js"></script>
			<link rel="stylesheet" href="./styles/style.css" type="text/css">
			<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	</head>
	<body>
         <%@ include file="./fragment/header.jsp" %>
        
        <h2 class="title">Accesso</h2>
        
        <form action="./login" method="post" class="MyForm">
				   <div class="table">
                    <p>Username:</p>
                    <p><input type="text" name="user" required placeholder="Insercisci email"></p>
                </div>

                  <div class="password-container">
                   <p>Password:</p>
                   <p><input type="password" name="pwd" placeholder="Inserisci password"></p>
                   <span id="toggle-password" class="material-symbols-outlined" onclick="togglePasswordVisibility()">visibility</span>
                </div>

                <div class="clic">
                        <p><input type="submit" value="Accedi"></p>
                     <a href="<%= request.getContextPath()%>/Registration.jsp">Registrati!</a>
                </div>
   
        </form>
        
        <%@ include file="./fragment/footer.jsp" %>	
             
	</body>
</html>