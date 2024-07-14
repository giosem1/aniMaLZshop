<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%	ArrayList<ArrayList<ProdottoBean>> cata= (ArrayList<ArrayList<ProdottoBean>>) request.getSession().getAttribute("catalogo");
    	request.getSession().removeAttribute("catalogo");	
   
    	if(cata == null) {
		response.sendRedirect("../catalogo?azione=cata");
		return;
	}	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catalogo</title>
	<link rel="stylesheet" href="../styles/style.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
<%  UtenteBean uteacc= (UtenteBean) request.getSession().getAttribute("currentSessionUser");
		if(uteacc !=null && uteacc.isAmm()){%>

	<%@ include file="../fragment/header.jsp" %>
	
	<h2 class="title">CATALOGO</h2>	
	
	<table class="catalogo">
	<tr class="head">
		<th>Nome</th>
		<th>Categoria</th>
		<th>Quantità</th>
		<th>Modifica</th>
		<th>Elimina</th>
	</tr>
		<%for(int i=0; i< cata.size();i++) {
				ArrayList<ProdottoBean> prod= cata.get(i);
				for(int j=0;j<prod.size();j++){
					ProdottoBean all= prod.get(j);%>
					<tr class="elem">
						<td><%= all.getNome()%></td>
						<td><%= all.getAnimale()%></td>
						<td><%= all.getQuantita()%></td>
						<td><a id="mod" href="./prodotto?id=<%= all.getID_prodotti()%>&page=ModificaProdotto.jsp" ><span class="material-symbols-outlined">edit</span></a></td>
						<td><a id="mod" href="./catalogo?azione=delete&idprod=<%= all.getID_prodotti()%>"><span class="material-symbols-outlined">delete</span></a></td>
					</tr>
			
		<%		}
			}%>
	</table>
		<div id="addprod">
         	<a href="<%= request.getContextPath()%>/admin/AddProduct.jsp">Inserisci un prodotto</a>
		</div>
		
		<%@ include file="../fragment/footer.jsp" %>
<%} else{response.sendRedirect(request.getContextPath() +"/error/Erroraccess.jsp");}%>
</body>
</html>