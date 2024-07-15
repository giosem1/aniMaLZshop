<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
    <% 
    	ArrayList<OrdineBean> ordini =(ArrayList<OrdineBean>) request.getSession().getAttribute("ord"); 
    	 UtenteBean uteord= (UtenteBean) request.getSession().getAttribute("currentSessionUser");
    if(ordini==null){
    		response.sendRedirect("./ordine?azione=order&id="+uteord.getId());
    		return;
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I miei ordini</title>
		<link rel="stylesheet" href="styles/style.css" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<%@ include file="./fragment/header.jsp" %>
	<%@ include file="./fragment/menu.jsp" %>
	<table class="catalogo">
	<tr class="head">
		<th>ID</th>
		<th>Data Ordine</th>
		<th>Importo</th>
		<th>Quantità</th>
		<th>Dettagli</th>
	</tr>
	<%for(OrdineBean ordine :ordini){%>
	<% System.out.println(ordine.getData()); %>
			<tr class="elem">
				<td><%= ordine.getIdOrdine()%></td>
				<td><%= ordine.getData()%></td>
				<td><%= ordine.getImportoTotale()%></td>
				<td><%=ordine.getquantita() %></td>
				<td><a id="det" href="./Dettagli.jsp?idord=<%=ordine.getIdOrdine()%>"><span class="material-symbols-outlined">plagiarism</span></a></td>
			</tr>	
				<%} %>	
	</table>

	<%@ include file="./fragment/footer.jsp" %>	
</body>
</html>