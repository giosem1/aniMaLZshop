<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello</title>

<link rel="stylesheet" href="./styles/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

</head>
<body>

	<%@ include file="./fragment/header.jsp" %>	
	
	<div id="car" class="clear">
	
	<% 	Carrello petBag = (Carrello) request.getSession().getAttribute("petBag");
		if(petBag != null && !petBag.isEmpty()){%>
		
		<h2>Carrello</h2>
		<table>
		<tr>
			<th></th>
			<th>Nome</th>
			<th>Quantità</th>
			<th>Prezzo </th>
			<th></th>
		</tr>
		<% 
			ArrayList <InfoCarrello> prodpetBag = petBag.getArticoli(); 	
		   for(InfoCarrello infopetBag: prodpetBag){
		%>
	
		<tr>
			<td><img src="./images/<%=infopetBag.getProdotto().getImmagine()%>" height="100" width="100"></td>
			<td><%=infopetBag.getProdotto().getNome()%></td>
			<td> <form action="../carrello">
					<input type="hidden" name="Animale" value="<%=infopetBag.getAnimale()%>">
					<input type="hidden" name="Genere" value="<%=infopetBag.getGenere()%>">
					<input type="hidden" name="Nome" value="<%=infopetBag.getNome()%>">
					<input type="hidden" name="page" value="Carrello.jsp">
					<select name="quantita" id="quantita">
						<%for(int i = 0; i < infopetBag.getProdotto().getQuantita();i++) {%>
						<option value="<%=i+1%>" <%if( (i+1)==infopetBag.getQuantitaCarrello()){ %> selected="selected" <%} %>> <%=i+1%> </option> <%} %>
						
					</select>
					
					<input type="submit" value="update">
				</form>
			</td>
			<td><%=String.format("%.2f",infopetBag.getTotale())%>&euro;</td>
			<td><a href="./carrello?action=deletePB&nome=<%=infopetBag.getNome()%>&page=Carrello.jsp"><button>X</button></a></td>
		</tr>
		<% } %>
	</table><br>
	<span class="price">Totale: &euro;<%=String.format("%.2f",petBag.calcolaCosto())%></span>
		
	<div class="click">
			<a <%if(request.getSession().getAttribute("currentSessionUser")!= null){ %>
					href="account?page=Checkout.jsp"> <%}else{%>href="Login.jsp?action=checkout"> <%} %><button>Effettua il pagamento</button> </a>
		</div>
	<%}else{%> 
		
		<h2 class="title">Il tuo carrello è vuoto</h2>
		<img src="./images/parrots.png" width="150" height="150" id="empty">
		<%} %>
		<br><br>
	
	</div>
	
	<%@ include file="./fragment/footer.jsp" %>	

</body>
</html>