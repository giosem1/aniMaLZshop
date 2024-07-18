<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	ProdottoBean prodotto = (ProdottoBean) request.getSession().getAttribute("prodotto");
		ArrayList<RecensioneBean> recs=(ArrayList<RecensioneBean>)request.getSession().getAttribute("recs");
	
	if(prodotto==null){
			response.sendRedirect("./prodotto");
		}
	if(recs==null){
		response.sendRedirect("./recensioni?azione=view&id="+ prodotto.getID_prodotti());
		return;
	}
	%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prodotto</title>
<link rel="stylesheet" href="./styles/style.css" type="text/css">
</head>
<body>
      
  	<%@ include file="/fragment/header.jsp" %>
	<%@ include file="/fragment/menu.jsp" %>	
	
<div class="container">
    <div class="immprod">
        <img src="./images/<%= prodotto.getImmagine() %>" height="450" width="450">
    </div>

    <div class="viewprod">
        <ul>
            <li>
                <div class="prefProd">
                    <a href="./preferiti?action=add&id=<%=prodotto.getID_prodotti()%>">
                       <img src="./images/preferiti.png" alt="Aggiungi ai preferiti">
                    </a>
                </div>
                 <h2 class="title"><%= prodotto.getNome() %></h2>
            </li>
            <li>Prezzo: <span class="price">&euro;<%= String.format("%.2f", prodotto.getPrezzo()) %></span></li>
            <li>Taglia: <span class="size"><%= prodotto.getTaglia() %></span></li>
            <% if (prodotto.getQuantita() > 0) { %>
                <li>Disponibilità: <span class="dispimm"> Immediata</span></li>
            <% } else { %>
                <li>Disponibilità: <span class="nondisp">Esaurito</span></li>
            <% } %>
            <li><a href="./carrello?action=addPB&id=<%= prodotto.getID_prodotti() %>&page=Prodotto.jsp"><button id="inputprod">Aggiungi al carello</button></a></li>
        </ul>
    </div>
</div>

<div class="desc">
    <h2 class="titleprod">Descrizione</h2>
    <span class="cont"><%= prodotto.getDescrizione() %></span>
</div>

		<h2 class="titrec">Recensioni</h2>
	<div class="rec">
		<%for(RecensioneBean recensione: recs){ %>
		<p class="uterece"><%=recensione.getNome()%>  <%=recensione.getCognome()%> <%=recensione.getDataPubl()%>
		
		<%	if(ute!=null){
				if(ute.isAmm()) {%>
					<a id="mod" href="./recensioni?azione=delete&id=<%=prodotto.getID_prodotti()%>&idute=<%=recensione.getID_utente()%>"><span class="material-symbols-outlined">delete</span></a>
		<%	}
		 		}%>
		</p>
		
		<div class="valutation">
			<p class="vot">Voto:</p> 
			<p class="utevot"><%=recensione.getVoto()%></p>
			<span id="paw" class="material-symbols-outlined">pets</span>
		</div>
		
		<p class="descrecs"> <%=recensione.getRecensione()%></p>
		<%} request.getSession().removeAttribute("recs"); %>
	</div>
	
	<form action="./recensioni?id=<%= prodotto.getID_prodotti()%>" method="post" id="Formrece" >
		<input type="hidden" name="azione" value="insert">
            <h3>Inserisci qui la tua recensione:</h3>
		
		<div class="inOrder">
            <p><textarea rows="10" cols="100" name="rece" placeholder="Inserisci il contenuto"></textarea></p>
        </div>
        
        <div class="table"> 
            <p>E qui il tuo voto:</p>
            <p><input type="number" min="0" max="5"name="voto" placeholder="Voto" required></p>
        </div>
        
         <div class="clicrec"> 
	        <p><input type="submit" value="Invia"></p>
		</div>	
	</form>


	<%@ include file="/fragment/footer.jsp" %>
</body>
</html>