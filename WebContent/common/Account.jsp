<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Il mio account</title>
</head>
<body>
	<%@ include file="../fragment/header.jsp" %>
	
	<%UtenteBean utente=(UtenteBean) request.getSession().getAttribute("currentSessionUser");%>
	
	<fieldset >
	<legend id="leg">Dati Personali</legend>
	<ul id="dati-list">
		<li><span class="elem-field">Nome: </span><%=utente.getNome()%></li>
		<li><span class="elem-field">Cognome: </span><%=utente.getCognome() %></li>
		<li><span class="elem-field">Data di nascita: </span><%=utente.getDataNascita() %></li>
		<li><span class="elem-field">E-mail: </span><%=utente.getEmail() %></li>
		<li><span class="elem-field">Via: </span><%=utente.getVia() %></li>
		<li><span class="elem-field">Civico: </span><%=utente.getNumCivico() %></li>
		<li><span class="elem-field">CAP: </span><%=utente.getCap() %></li>
		<li><span class="elem-field">Telefono: </span><%=utente.getTel() %></li>
		<li><span class="elem-field">Carta di credito: </span><%=utente.getCartaCredito() %></li>
	</ul>
	</fieldset>
	<%@ include file="../fragment/footer.jsp" %>	
</body>
</html>