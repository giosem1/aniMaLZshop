<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
<% 
    ArrayList<ProdottoBean> prodotti = (ArrayList<ProdottoBean>) request.getSession().getAttribute("prodotti");
    request.getSession().removeAttribute("prodotti");
    
    if (prodotti == null) {
        response.sendRedirect("./products");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>animali</title>
<link rel="stylesheet" href="styles/style.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"/>
<script type="text/javascript" src="./scripts.js"></script>
</head>
<body>
    <%@ include file="./fragment/header.jsp" %>
    <%@ include file="./fragment/menu.jsp" %>  
 
            <div class="Conteiner-prod">
                <% for (ProdottoBean prodotto : prodotti) { %>
                <div class="prodotti">
                    <a href="./prodotto?id=<%= prodotto.getID_prodotti() %>&page=Prodotto.jsp">
                        <img src="./images/<%= prodotto.getImmagine() %>" height="130" width="130">
                    </a>
                    <p class="nome"><%= prodotto.getNome()%></p>
                    <div class="prezzo-container">
                        <p class="prezzo"> &euro;<%= String.format("%.2f", prodotto.getPrezzo()) %> </p>
                        <div class="prefe">
                            <a href="./addPreferiti?action=addPB&id=<%=prodotto.getID_prodotti()%>&page=Home.jsp">
                                <img src="./images/preferiti.png" alt="Aggiungi ai preferiti">
                            </a>
                        </div>
                    </div>
                    <div class="clicprod">
                        <a href="./carrello?action=addPB&id=<%= prodotto.getID_prodotti() %>&page=Home.jsp">
                            <button id="input">Aggiungi al carrello</button>
                        </a>
                    </div>
                </div>
                <% } %>
            </div>
    <%@ include file="./fragment/footer.jsp" %>
</body>
</html>
