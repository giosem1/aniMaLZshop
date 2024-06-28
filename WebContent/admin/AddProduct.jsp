<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aggiungi i prodotti</title>
	<link rel="stylesheet" href="../styles/style.css" type="text/css">

</head>
<body>
	<%@ include file="../fragment/header.jsp" %>
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
				<p><input type="text" name="genere" placeholder="Inserisci il genere del prodotto" required></p>	
		</div>
		<div id="table">
				<p>Categoria:</p>
				<p><input type="text" name="cate" placeholder="Inserisci la categoria del prodotto" required ></p>	
		</div>
		<div id="table">
				<p>Taglia:</p>
				<p><select name="taglia" id="selTaglia" required>
					<option value="s">S</option>
					<option value="m">M</option>
					<option value="l">L</option>
					<option value="all">Tutte le taglie</option>
				</select></p>
		</div>
		<div id="table">
				<p>Marca:</p>
				<p><input type="text" name="marca" placeholder="Inserisci la marca del prodotto" required></p>	
		</div>
		<div id="table">
				<p>Descrizione:</p>
				<p><textarea rows="10" cols="50" name="desc" id="descrizione" required></textarea></p>	
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
</body>
</html>