<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello</title>

<link rel="stylesheet" href="../styles/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />


</head>
<body>
	<%@ include file="./fragment/header.jsp" %>	
	
	<% 	Carrello petBag = (Carrello) request.getSession().getAttribute("petBag");
		if(petBag != null && !petBag.isEmpty()){%>
		
		<h2 class="title">Elenco Prodotti</h2>		
			
			<div class="carrello">
		
			<%
					ArrayList <InfoProdotto> prodpetBag = petBag.getArticoli(); 	
							        for(InfoProdotto infopetBag: prodpetBag){
								int id = prodpetBag.indexOf(infopetBag);
					%>
			 <form action="carrello">
			 <input type="hidden" name="page" value="Carrello.jsp">
			 <input type="hidden" name="nome" value="<%= infopetBag.getNome() %>">
             <input type="hidden" name="genere" value="<%= infopetBag.getGenere() %>">
             <input type="hidden" name="animale" value="<%= infopetBag.getAnimale() %>">
			 <input type="number" name="quantita" min="1" max="<%= infopetBag.getProdotto().getQuantita() %>"
                value="<%= infopetBag.getQuantitaCarrello() %>"> 
			 
			 <input class="update" type="submit" value="Aggiorna">
			 </form>
	        
			<div class="immcar"><img src="./images/<%= infopetBag.getProdotto().getImmagine()%>" height="200" width="200" ></div>
			
			<h2 id="nome"><%=infopetBag.getProdotto().getNome()%></h2>
			 
			 <h2 class="prezzoCar">Prezzo: <span class="price">&nbsp; &euro;<%=String.format("%.2f",infopetBag.getPrezzo())%></span></h2>
			<a href="carrello?action=deletePB&id=<%=infopetBag.getID()%>&page=Carrello.jsp"><button type="button" class="delete" >Elimina</button></a>
			
		<% } %>
	
	<span class="tot">Totale: &nbsp; &euro;<%=String.format("%.2f",petBag.calcolaCosto())%></span>
	
	</div>
	
	<a <%if(request.getSession().getAttribute("currentSessionUser") != null) { %>
	href="./Checkout.jsp"> <% } else { %>href="Login.jsp"> <% } %><button id="inputcar">Effettua il pagamento</button> </a>
	
	<% } else { %> 
		<div id="car">
		<h2 class="title">Il tuo carrello è vuoto</h2>
		<img src="./images/parrots.png" width="160" height="160">
		</div>
		<% } %>
	
	<%@ include file="./fragment/footer.jsp" %>	

</body>

</html>

