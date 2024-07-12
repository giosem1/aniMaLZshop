<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello</title>

<link rel="stylesheet" href="../styles/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<script>
function updateQuantity(nome, animale, genere, action) {
    var quantityInput = document.getElementById('quantita-' + nome + '-' + animale + '-' + genere);
    var currentQuantity = parseInt(quantityInput.value);
    var newQuantity = action === 'increase' ? currentQuantity + 1 : currentQuantity - 1;
    if (newQuantity >= 1 && newQuantity <= parseInt(quantityInput.max)) {
        quantityInput.value = newQuantity;
        document.getElementById('update-form-' + nome + '-' + animale + '-' + genere).submit();
    }
}
</script>
</head>
<body>
	<%@ include file="../fragment/header.jsp" %>	
	
	
	<% 	Carrello petBag = (Carrello) request.getSession().getAttribute("petBag");
		if(petBag != null && !petBag.isEmpty()){%>
		
		<h2 style="font-family:Arial, sans-serif; font-size:250%;text-align: center;">Elenco Prodotti</h2>
		
			
			<div class="carrello">
		
			<% 
			ArrayList <InfoCarrello> prodpetBag = petBag.getArticoli(); 	
		   for(InfoCarrello infopetBag: prodpetBag){
			%>
			 <form action="carrello">
			 <input type="hidden" name="page" value="Carrello.jsp">
	         <button class="quantita" type="button" onclick="updateQuantity('<%= infopetBag.getNome() %>', '<%= infopetBag.getAnimale() %>', '<%= infopetBag.getGenere() %>', 'decrease')">-</button>
             <input class="numero" type="number" id="quantita-<%= infopetBag.getNome() %>-<%= infopetBag.getAnimale() %>-<%= infopetBag.getGenere() %>" name="quantita" value="<%= infopetBag.getQuantitaCarrello() %>" min="1" max="<%= infopetBag.getProdotto().getQuantita() %>" readonly>
             <button class="quantita" type="button" onclick="updateQuantity('<%= infopetBag.getNome() %>', '<%= infopetBag.getAnimale() %>', '<%= infopetBag.getGenere() %>', 'increase')">+</button>	
			 </form>
			
			<div class="immcar"><img src="./images/<%=infopetBag.getProdotto().getImmagine()%>" height="200" width="200" ></div>
			
			<h2 id="nome"><%=infopetBag.getProdotto().getNome()%></h2>
			 
			 <h2 class="prezzo">Prezzo: &nbsp; &euro;<%=String.format("%.2f",infopetBag.getTotale())%></h2>
			<a><button type="button" class="delete" href="carrello?action=deletePB&nome=<%=infopetBag.getNome()%>&page=Carrello.jsp">Elimina</button></a>
			
			

		<% } %>
	
	<span class="tot">Totale: &nbsp; &euro;<%=String.format("%.2f",petBag.calcolaCosto())%></span>
	
	</div>

	
	<a <%if(request.getSession().getAttribute("currentSessionUser")!= null){ %>
	href="account?page=Checkout.jsp"> <%}else{%>href="Login.jsp?action=checkout"> <%} %><button id="inputcar">Effettua il pagamento</button> </a>
	
	<%}else{%> 
		<div id="car">
		<h2>Il tuo carrello è vuoto</h2>
		<img src="./images/parrots.png" width="160" height="160">
		</div>
		<%} %>
	
	<%@ include file="../fragment/footer.jsp" %>	


</body>
</html>