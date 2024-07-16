<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="model.*, java.util.*"%>
     <% 
	    ArrayList<InseritiBean> inse =(ArrayList<InseritiBean>) request.getSession().getAttribute("inse"); 
    	
     if(inse==null){
    		response.sendRedirect("./ordine?azione=details&idord="+request.getParameter("idord"));
    		return;
    	}
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dettagli</title>
<link rel="stylesheet" href="styles/style.css" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<%@ include file="./fragment/header.jsp" %>
	<%@ include file="./fragment/menu.jsp" %>
	<table class="catalogo">
	<tr class="head">
		<th>Nome </th>
		<th>Prezzo</th>
		<th>Quantità</th>
	</tr>
	<%for(InseritiBean prodotti : inse){%>
	
			<tr class="elem">
				<td><%= prodotti.getNome()%></td>
				<td><%= String.format("%.2f",prodotti.getPrezzo())%> &euro;</td>
				<td><%= prodotti.getQuantita()%><td>
			
			</tr>
	<%}  request.getSession().removeAttribute("inse");%>		
	</table>
	
	<%@ include file="./fragment/footer.jsp" %>	

</body>
</html>