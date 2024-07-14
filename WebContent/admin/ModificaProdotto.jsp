<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" errorPage="../error/Erroraccess"%>
    <%
    	ProdottoBean prodotto = (ProdottoBean) request.getSession().getAttribute("prodotto");
    	request.getSession().removeAttribute("prodotto");

	if(prodotto==null){
			response.sendRedirect("../prodotto?page=ModificaProdotto.jsp");
			return;
		}
	%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifica  prodotto</title>
	<link rel="stylesheet" href="../styles/style.css" type="text/css">

</head>
<body>
<%  UtenteBean uteacc= (UtenteBean) request.getSession().getAttribute("currentSessionUser");
		if(uteacc !=null && uteacc.isAmm()){%>
			
			<%@ include file="../fragment/header.jsp" %>
			<h2 class="title">Modifica un prodotto</h2>
			<form action="./Modifica?idprod=<%=prodotto.getID_prodotti() %>" method="post" class="MyForm" enctype="multipart/form-data">
				<div class="table">
						<p>Nome:</p>
						<p><input type="text" name="nomeprod" value="<%= prodotto.getNome() %>"  required></p>	
				</div>
				<div class="table">
						<p>Prezzo:</p>
						<p><input type="text" name="prezzo" value="<%= prodotto.getPrezzo()%>" required></p>	
				</div>
				<div class="table">
						<p>Genere:</p>
						<p>	<select name="genere" class="sel">
								<option value="Cibo">Cibo</option>
								<option value="Snack">Snack</option>
								<option value="Farmoceutici">Farmaceutici</option>
								<option value="Igienici">Igienici</option>
								<option value="Abbigliamento">Abbigliamento</option>
								<option value="Accessori">Accessori</option>
								<option value="Giochi">Giochi</option> 
							</select></p>

				</div>
				<div class="table">
						<p>Categoria:</p>
						<p><input type="text" name="cate"value="<%= prodotto.getAnimale() %>" required ></p>	
				</div>
				<div class="table">
						<p>Taglia:</p>
						<p><select name="taglia" class="sel" required>
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
							<option value="Tutte le taglie">Tutte le taglie</option>
						</select></p>
				</div>
				<div class="table">
						<p>Marca:</p>
						<p><input type="text" name="marca" value="<%= prodotto.getMarca() %>" required></p>	
				</div>
				<div class="table">
						<p>Descrizione:</p>
						<p><textarea rows="10" cols="50" name="desc" id="testo"required><%= prodotto.getDescrizione() %></textarea></p>	
				</div>
				<div class="table">
						<p>Immagine:</p>
						<p><input type="file" name="imm" accept="image/*" value="<%= prodotto.getImmagine() %>" id="immag" required></p>	
				</div>	
				<div class="table">
						<p>Quantità:</p>
						<p><input type="text" name="quant" value="<%= prodotto.getQuantita() %>" required></p>	
				</div>
				<div class="clic">
					<p><input type="submit" value="Modifica"></p>
				</div>
			</form>
			<%@ include file="../fragment/footer.jsp" %>
		<%} else{response.sendRedirect(request.getContextPath() +"/error/Erroraccess.jsp");}%>
</body>
</html>