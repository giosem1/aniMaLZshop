<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
    <%ArrayList<ArrayList<ProdottoBean>> anim= (ArrayList<ArrayList<ProdottoBean>>) request.getSession().getAttribute("animale");
   	 	request.getSession().removeAttribute("animale");
    	
   	 	if(anim == null) {
			response.sendRedirect("./home");
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

<body onload="setNews('news.png')">
	
	<%@ include file="./fragment/header.jsp" %>
	<%@ include file="./fragment/menu.jsp" %>	
	
    <main>
	<a href="./News.jsp" id="banner">
	    <div id="news">
	     		
	   		<p id="pnews">News</p>
		    	
	    	 
	    </div>
 	</a>
     
    <div id="preferiti">
    	
 	  <%for(ArrayList<ProdottoBean> pets: anim){
	 	  		
	 	  		int i=0; 
	 			ProdottoBean cate= pets.get(i);%>
	 			
	<div class="category-group">
          <h2 class="titlehome">Consigliato per <%= cate.getAnimale() %></h2>
   
    
     <div class="scrollable-content" >
       <div class="conteiner-prod">
                   <% for(ProdottoBean pet : pets) {%>
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
    </main>
	<%@ include file="./fragment/footer.jsp" %>	
				
</body>
</html>