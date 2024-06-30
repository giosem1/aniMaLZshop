<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prodotto</title>
<link rel="stylesheet" href="../styles/style.css" type="text/css">
</head>
<body>
      
  	<%@ include file="../fragment/header.jsp" %>
	<%@ include file="../fragment/menu.jsp" %>	
	
	<%ProdottoBean prodotto = (ProdottoBean) request.getSession().getAttribute("prodotto");
	
		if(prodotto != null) {%>
		<h2><%=prodotto.getNome()%></h2>
		<div><img src="<%=prodotto.getImmagine()%>"></div>
		
		<div>
		    <ul>
		         <li><span class=""><%=prodotto.getNome()%></span></li>
		         <li><span class="">Prezzo</span>: &euro;<%=prodotto.getPrezzo()%></li>
		         <li><span class=""><%=prodotto.getTaglia()%></span></li>
		         <% if(prodotto.getQuantita() > 0){%>
					<li><span class="">Disponibilità Immediata</span></li>
					<%}else{ %>
				<li><span class="">Non disponibile</span></li>	
					<%}%>
				<li><a href=""><button class="">Aggiungi al carrello</button></a></li>			        
		   </ul>
		    
		    	<h2>Descrizione</h2>
		    	<span class=""><%=prodotto.getTaglia()%></span>
		</div>
      <%}%>
</body>
</html>