<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" errorPage="../error/Erroraccess" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aggiungi i prodotti</title>
	<link rel="stylesheet" href="../styles/style.css" type="text/css">

</head>
<body>
	<%  UtenteBean uteacc= (UtenteBean) request.getSession().getAttribute("currentSessionUser");
		if(uteacc !=null && uteacc.isAmm()){%>
			
			<%@ include file="../fragment/header.jsp" %>
			<h2 id="title">Aggiungi un prodotto</h2>
			<form action="../AddProdoct" method="post" id="MyForm" enctype="multipart/form-data">
				<div id="table">
						<p>Nome:</p>
						<p><input type="text" name="nomeprod" placeholder="Inserisci nome del prodotto"  required></p>	
				</div>
				<div id="table">
						<p>Prezzo:</p>
						<p><input type="text" name="prezzo" placeholder="Inserisci il prezzo" required></p>	
				</div>
				<div id="table">
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
				<div id="table">
						<p>Categoria:</p>
						<p><input type="text" name="cate" placeholder="Inserisci la categoria del prodotto" required ></p>	
				</div>
				<div id="table">
						<p>Taglia:</p>
						<p><select name="taglia" class="sel" required>
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
							<option value="Tutte le taglie">Tutte le taglie</option>
						</select></p>
				</div>
				<div id="table">
						<p>Marca:</p>
						<p><input type="text" name="marca" placeholder="Inserisci la marca del prodotto" required></p>	
				</div>
				<div id="table">
						<p>Descrizione:</p>
						<p><textarea rows="10" cols="50" name="desc" id="testo" required></textarea></p>	
				</div>
				<div id="table">
						<p>Immagine:</p>
						<p><input type="file" name="imm" accept="image/*" id="immag" required></p>	
				</div>	
				<div id="table">
						<p>Quantità:</p>
						<p><input type="text" name="quant" placeholder="Inserisci la quantità del prodotto" required></p>	
				</div>
				<div id="clic">
					<p><input type="submit" value="Inserisci"></p>
				</div>
			</form>
			<%@ include file="../fragment/footer.jsp" %>
		<%} else{response.sendRedirect(request.getContextPath() +"/error/Erroraccess.jsp");}%>
</body>
</html>