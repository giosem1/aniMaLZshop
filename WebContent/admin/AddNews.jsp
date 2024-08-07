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
	<h2 class="title">Aggiungi una News</h2>
	<form action="../AddNews" method="post" class="MyForm" enctype="multipart/form-data">
		<div class="table">
			<p>Titolo:</p>
			<p><input type="text" name="titolo" placeholder="Inserisci il titolo"></p>
		</div>
		<div class="table">
			<p>Categoria:</p>
			<p><select name="cate" class="sel">
					<option value="Benessere & Salute">Benessere & Salute</option>
					<option value="Comportamento & Gioco">Comportamento & Gioco</option>
					<option value="Alimentazione">Alimentazione</option>
			</select></p>
		</div>
		<div class="table">
			<p>Data publicazione:</p>
			<p><input type="date" name="dataPubl" placeholder="GG/MM/AAAA"></p>
		</div>
		<div class="table">
            <p>Animale:</p>
            <p><select name="animal" class="sel" required>
                    <option value="Cane">Cane</option>
                    <option value="Gatto">Gatto</option>
                    <option value="Rettile">Rettile</option>
                    <option value="Roditore">Roditore</option>
                    <option value="Uccello">Uccello</option>
                    <option value="Pesce">Pesce</option>
                </select></p>
        </div>
		<div class="table">
			<p>Immagine:</p>
			<p><input type="file" name="imm" accept="image/*" ></p>
		</div>
		<div class="table">
			<p>Autore:</p>
			<p><input type="text" name="aut" placeholder="Inserisci l'autore"></p>
		</div>
		<div class="inOrder">
			<p>Contenuto:</p>
			<p><textarea rows="50" cols="100" name="cont" placeholder="Inserisci il contenuto"></textarea></p>
		</div>
		
		<div class="clic"> 
	            <p><input type="submit" value="Inserisci News"></p>
			</div>
	</form>
	
	<%@ include file="../fragment/footer.jsp" %>
	
	<%} else{response.sendRedirect(request.getContextPath() +"/error/Erroraccess.jsp");}%>
</body>
</html>