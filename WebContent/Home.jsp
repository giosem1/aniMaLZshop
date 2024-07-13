<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, java.util.*"%>
    <%ArrayList<ArrayList<ProdottoBean>> anim= (ArrayList<ArrayList<ProdottoBean>>) request.getSession().getAttribute("animale");
    if(anim == null) {
			response.sendRedirect("./home");
			return;
		}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aniMaLZshop</title>
	<link rel="stylesheet" href="styles/style.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
	
	<%@ include file="../fragment/header.jsp" %>
	<%@ include file="../fragment/menu.jsp" %>	
    
    <div id="news">
      <span id="left-arrow" class="material-symbols-outlined arrow">arrow_back_ios</span>
      <span id="right-arrow" class="material-symbols-outlined arrow">arrow_forward_ios</span>
    </div>
    <div id="preferiti">
    	
 	  <%for(int j=0; j<anim.size(); j++){
	 	  		ArrayList<ProdottoBean> pets= anim.get(j);
	 	  		int i=0;
	 			ProdottoBean cate= pets.get(i);%>
	 			   <div class="category-group">
	 			   <h2 class="titlehome">Consigliato per <%= cate.getAnimale()%></h2>		 
	 				 	<div class="conteiner-prod">   				
	    			<%while( i< pets.size()){
	    				ProdottoBean pet= pets.get(i);%>
	    			    	<div class="prodotti">    				
	    				   	    <a href="./prodotto?nome=<%= pet.getNome()%>&animale=<%=pet.getAnimale()%>&genere=<%=pet.getGenere()%>">
		    				    <img src="./images/<%= pet.getImmagine()%>" height="130" width="130" ></a>
		    				    <p class="nome"><%=pet.getNome()%> </p> 
		    				    <p class="prezzo">&euro; <%= pet.getPrezzo()%></p>
		    				    <div class="clicprod">
		    					<a href="./carrello?action=addPB&nome=<%=pet.getNome()%>&animale=<%=pet.getAnimale()%>&genere=<%=pet.getGenere()%>&page=Home.jsp"><button id="input">Aggiungi al carello</button></a>
		    				    </div>
		    			   </div>
		    		<%i++;
		    		}%>
		    		   </div>
		            </div>
    		<%}%>
    </div>
	<%@ include file="../fragment/footer.jsp" %>						
</body>

</html>