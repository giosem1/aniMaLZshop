<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Preferiti</title>

<link rel="stylesheet" href="../styles/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

</head>
<body>

	 <%@ include file="../fragment/header.jsp" %>
	 <%@ include file="../fragment/menu.jsp" %>	
	
	<% 	Preferiti petPref = (Preferiti) request.getSession().getAttribute("petPref");
		if(petPref != null && !petPref.isEmpty()){%>
	
		<h2 class="title">I tuoi preferiti</h2>	
		
		<div class="Conteiner-prod">
		
		<%
					ArrayList <InfoProdotto> prodpetPref = petPref.getArticoli(); 	
							        for(InfoProdotto infopetPref: prodpetPref){
								int id = prodpetPref.indexOf(infopetPref);
		%>
	
            <div class="prodotti">
			<div class="prefe">	
			<a id="preferitiLink" href="addPreferiti?action=deletePB&id=<%=infopetPref.getID()%>&page=Preferiti.jsp"><img src="./images/preferiti.png" width="40" height="40"></a>		
			</div>
		
		    <a href="./prodotto?id=<%= infopetPref.getProdotto().getID_prodotti()%>&page=Prodotto.jsp">
		    <img src="./images/<%= infopetPref.getProdotto().getImmagine()%>" height="130" width="130" ></a>
	
		    <p class="nome"><%=infopetPref.getProdotto().getNome()%> </p> 
		    
		    <div class="prezzo-container">
		    <p class="prezzo"> &nbsp; &euro; <%=String.format("%.2f", infopetPref.getPrezzo()) %></p>
			</div>
			
			</div>
			
			<% } %>
	
  		</div>
  		
  		 <%	} else { %>
			
  		<h2 class="title">Nessun prodotto nei preferiti</h2>	
  
  		<%	}  %>
  
    <%@ include file="../fragment/footer.jsp" %>	
    
</body>
</html>
