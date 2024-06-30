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
    	
 	  <%	for(int j=0; j<anim.size(); j++){
	 	  		ArrayList<ProdottoBean> pets= anim.get(j);
	 	  		int i=0;
	 			ProdottoBean cate= pets.get(i);%>
	      			<h2 class="titleHome">I Preferiti di <%= cate.getAnimale() %></h2>
	    				
	    			<%while( i< pets.size()){
	    				ProdottoBean pet= pets.get(i);%>
	    				
	    				<div class="prodotti">
		    				<img src="../images/<%= pet.getImmagine()%>" height="130" width="130" >
		    				<p>Nome: <%= pet.getNome()%>  Prezzo: <%= pet.getPrezzo()%>&euro;</p>
		    				<div class="clicprod">
		    					<input type="submit" value="Aggiungi al carello">
		    				</div>
	    				</div>
		    		<%i++;
		    		}%>
    		<%}%>
    </div>
	<%@ include file="../fragment/footer.jsp" %>						
</body>

</html>