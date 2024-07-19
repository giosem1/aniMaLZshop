<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
    <%ArrayList<ArrayList<ProdottoBean>> anim= (ArrayList<ArrayList<ProdottoBean>>) request.getSession().getAttribute("animale");
   	 	request.getSession().removeAttribute("animale");
    	
   	 	if(anim == null) {
			response.sendRedirect("./home");
			return;
		}
   		ArrayList<ArrayList<NewsBean>> newsdisp= (ArrayList<ArrayList<NewsBean>>) request.getSession().getAttribute("newsdisp");
   		request.getSession().removeAttribute("newsdisp");
		if(newsdisp==null) {
			response.sendRedirect("./newsBanner");
			return;
		}
		
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="initial-scale=1,width=device-width">
<title>aniMaLZshop</title>
	<link rel="stylesheet" href="styles/style.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

	<script type="text/javascript" src="./script/scripts.js"></script>
	
</head>

<body onload="setNews('<%=newsdisp.get(0).get(0).getImmagine()%>')">
	
	<%@ include file="./fragment/header.jsp" %>
	<%@ include file="./fragment/menu.jsp" %>	
	
    
    <div id="news" >
     
   	
	    	<a href="./news?titolo=<%= newsdisp.get(0).get(0).getTitolo() %>&categ=<%=newsdisp.get(0).get(0).getCategoria()%>"><p id="pnews"> <%=newsdisp.get(0).get(0).getTitolo()  %></p></a>
	    	
	      	<span id="left-arrow" class="material-symbols-outlined arrow">arrow_back_ios</span>
	      
	     	<span id="right-arrow" class="material-symbols-outlined arrow">arrow_forward_ios</span>
    	 
    </div>
 
     
    <div id="preferiti">
    	
 	  <%for(int j=0; j<anim.size(); j++){
	 	  		ArrayList<ProdottoBean> pets= anim.get(j);
	 	  		int i=0; 
	 			ProdottoBean cate= pets.get(i);%>
	 			
	<div class="category-group">
          <h2 class="titlehome">Consigliato per <%= cate.getAnimale() %></h2>
   
    
     <div class="scrollable-content" >
       <div class="conteiner-prod">
                   <% while (i < pets.size()) {
                    ProdottoBean pet = pets.get(i); %>
                   <div class="prodotti">
                       <a href="./prodotto?id=<%= pet.getID_prodotti() %>&page=Prodotto.jsp">
                       <img src="./images/<%= pet.getImmagine() %>">
                       </a>
                       <p class="nome"><%= pet.getNome() %></p>
                   <div class="prezzo-container">
                      <p class="prezzo"> &euro;<%= String.format("%.2f", pet.getPrezzo()) %> </p>              
                  </div>
              </div>
             <% i++;
              } %>
       </div>
    </div>
   
      
    
</div>

    		<%}%>
    </div>
	<%@ include file="./fragment/footer.jsp" %>	
					
</body>
</html>