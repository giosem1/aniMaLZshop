<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%ProdottoBean prodotto = (ProdottoBean) request.getSession().getAttribute("prodotto");
		
	if(prodotto==null){
			response.sendRedirect("./prodotto");
		}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prodotto</title>
<link rel="stylesheet" href="./styles/style.css" type="text/css">
</head>
<body>
      
  	<%@ include file="./fragment/header.jsp" %>
	<%@ include file="./fragment/menu.jsp" %>	
	
		<div class="immprod"><img src="./images/<%=prodotto.getImmagine()%>" height="550" width="550"></div>
		
		<div class="viewprod">
		    <ul>
		         <li><h2 class="title"><%=prodotto.getNome()%></h2></li>
		         <li><span class="price">Prezzo:</span> &euro; <%= String.format("%.2f",prodotto.getPrezzo())%></li>
		         <li><span class="size"><%=prodotto.getTaglia()%></span></li>
		         <% if(prodotto.getQuantita() > 0){%>
					<li><span class="dispimm">Disponibilità Immediata</span></li>
					<%}else{ %>
				<li><span class="nondisp">Non disponibile</span></li>	
					<%}%>
				<li><a href="./carrello?action=addPB&animale=<%=prodotto.getAnimale()%>&genere=<%=prodotto.getGenere()%>&nome=<%=prodotto.getNome()%>&page=Prodotto.jsp"><button id="inputprod">Aggiungi al carello</button></a></li>			        
		   </ul>
		    
		    	
		</div>
		<div class="desc">
			<h2 class="titleprod">Descrizione</h2>
			<span class="cont"><%=prodotto.getDescrizione()%></span>
		</div>
	<%@ include file="./fragment/footer.jsp" %>
</body>
</html>