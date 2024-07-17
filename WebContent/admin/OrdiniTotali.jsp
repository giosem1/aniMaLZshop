<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
    <%	ArrayList<OrdineBean> ordini =(ArrayList<OrdineBean>) request.getSession().getAttribute("orders"); 
    	ArrayList<ArrayList<UtenteBean>> utente= (ArrayList<ArrayList<UtenteBean>>) request.getSession().getAttribute("utenti");
    
    	if(ordini==null || utente==null){
    		response.sendRedirect("../ordine?azione=orders");
    		return;
    	} 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ordini Totali</title>
		<link rel="stylesheet" href="styles/style.css" type="text/css">
</head>
<body>
	<%@ include file="../fragment/header.jsp" %>

	<h2 class="title">Ordini Totali</h2>
	
	<table class="catalogo">
	<tr class="head">
		<th>ID</th>
		<th>Nome</th>
		<th>Cognome</th>
		<th>E-mail</th>
		<th>Data Ordine</th>
		<th>Importo</th>
		<th>Quantità</th>
		<th>Dettagli</th>
	</tr>
	<%for(int i=0; i<ordini.size() && i< utente.size() ;i++ ){
			OrdineBean ordine= ordini.get(i);
			ArrayList<UtenteBean>utenti= utente.get(i);
			for(int j=0; j<utenti.size(); j++){
				UtenteBean uten= utenti.get(j);
	%>
	
			<tr class="elem">
				<td><%= ordine.getIdOrdine()%></td>
				<td><%= uten.getNome()%></td>
				<td><%= uten.getCognome()%></td>
				<td><%= uten.getEmail()%></td>
				<td><%= ordine.getData()%></td>
				<td><%= ordine.getImportoTotale()%></td>
				<td><%=ordine.getquantita() %></td>
				<td><a id="det" href="./Dettagli.jsp?idord=<%=ordine.getIdOrdine()%>"><span class="material-symbols-outlined">plagiarism</span></a></td>
			</tr>
	<%		}
	} %>	
	</table>
			<form action="./ordine?azione=orders" method="post" class="formData">
				<div class="table">
		            <p>Da:</p>
		            <p><input type="date" name="dataDa" placeholder="GG/MM/AAAA" required></p>
		        </div>
		        <div class="table">
		            <p>Al:</p>
		            <p><input type="date" name="dataA" placeholder="GG/MM/AAAA" required></p>
		        </div>
				
				<div class="clic"> 
	            	<p><input type="submit" value="Cerca"></p>
				</div>		        		  
			</form>
			
			<form action="./ordine?azione=orders" method="post" class="formNome">
			<div class="table">
		            <p>Nome:</p>
		            <p><input type="text" name="nome" placeholder="Inserisci il nome" required></p>
		        </div>
		        <div class="table">
		            <p>Cognome:</p>
		            <p><input type="text" name="cognome" placeholder="Inserisci il cognome" required></p>
		        </div>
		        
		        <div class="clic"> 
	            	<p><input type="submit" value="Cerca"></p>	            	
				</div>
			</form>
		
				<div> 
	            	<p><a href="./ordine?azione=orders"><button id="rest">Reset</button></a></p>
				</div>
	<%@ include file="../fragment/footer.jsp" %>	
</body>
</html>