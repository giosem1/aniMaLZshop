<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" errorPage="../error/Erroraccess"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aggiungi News</title>
	<link rel="stylesheet" href="../styles/style.css" type="text/css">
</head>
<body>
	<%  UtenteBean uteacc= (UtenteBean) request.getSession().getAttribute("currentSessionUser");
		if(uteacc !=null && uteacc.isAmm()){%>
			
	<%@ include file="../fragment/header.jsp" %>
	<h2 id="title">Aggiungi una News</h2>
	<form action="../AddNews" method="post" id="MyForm" enctype="multipart/form-data">
		<div id="table">
			<p>Titolo:</p>
			<p><input type="text" name="titolo" placeholder="Inserisci il titolo"></p>
		</div>
		<div id="table">
			<p>Categoria:  </p>
			<p><select name="cate" class="sel">
					<option value="Benessere & Salute">Benessere & Salute</option>
					<option value="Comportamento & Gioco">Comportamento & Gioco</option>
					<option value="Alimentazione">Alimentazione</option>
			</select></p>
		</div>
		<div id="table">
			<p>Data publicazione:</p>
			<p><input type="date" name="dataPubl" placeholder="GG/MM/AAAA"></p>
		</div>
		<div id="table">
			<p>Animale:</p>
			<p><input type="text" name="animal" placeholder="Inserisci l'animale"></p>
		</div>
		<div id="table">
			<p>Immagine:</p>
			<p><input type="file" name="imm" accept="image/*" ></p>
		</div>
		<div id="table">
			<p>Autore:</p>
			<p><input type="text" name="aut" placeholder="Inserisci l'autore"></p>
		</div>
		<div id="table">
			<p>Contenuto:</p>
			<p><textarea rows="50" cols="100" name="cont" id="testo" placeholder="Inserisci il contenuto"></textarea></p>
		</div>
		
		<div id="clic"> 
	            <p><input type="submit" value="Inserisci News"></p>
			</div>
	</form>
	
	<%@ include file="../fragment/footer.jsp" %>
	
	<%} else{response.sendRedirect(request.getContextPath() +"/error/Erroraccess.jsp");}%>
</body>
</html>