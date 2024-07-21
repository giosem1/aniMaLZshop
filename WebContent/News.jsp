<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>News</title>
<link rel="stylesheet" href="./styles/style.css" type="text/css">
<script type="text/javascript" src="./script/ajaxnews.js"></script>

</head>
<body>
     <%@ include file="../fragment/header.jsp" %>
	 <%@ include file="../fragment/menu.jsp" %>	
	 
	 <div class="newsbanners">
	
	 	  <div id="news" onclick="cercaNews('Benessere e Salute')" >
		    	<p id="pnews">Benessere e Salute</p>
	    </div>
	      <ul id="B&S"></ul>
	      
	      <div id="news" onclick="cercaNews('Comportamento e Gioco')" >
		    	<p id="pnews">Comportamento e Gioco</p>
	    </div>
	    
	      <ul id="C&G"></ul>
	    
	    <div id="news" onclick="cercaNews('Alimentazione')" >
		    	<p id="pnews">Alimentazione</p>
	    </div>
	    
	      <ul id="Ali"></ul>
	 	
	 
	 
	 </div>
	  
     <%@ include file="../fragment/footer.jsp" %>
</body>
</html>