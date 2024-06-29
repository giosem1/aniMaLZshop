<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aniMaLZshop</title>
	<link rel="stylesheet" href="styles/style.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
	<%@ include file="../fragment/header.jsp" %>
	<%@ include file="../fragment/menu.jsp" %>	
    
    <div id="news">
      <span id="left-arrow" class="material-symbols-outlined arrow">arrow_back_ios</span>
      <span id="right-arrow" class="material-symbols-outlined arrow">arrow_forward_ios</span>
    </div>
    
    <div id="cani">
      <h2 class="titleHome">I Preferiti di Cani</h2>
      
    </div>
    
    <div id="gatti">
      <h2 class="titleHome"> I Preferiti di Gatti</h2>
      
    </div>
    
	<%@ include file="../fragment/footer.jsp" %>						
</body>

</html>