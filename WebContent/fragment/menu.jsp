<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="./styles/style.css" type="text/css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<script type="text/javascript" src="./script/serchajax.js"></script>
	<script type="text/javascript" src="./script/scripts.js"></script>
</head>
<body>
			<nav>
			   
				<form action="javascript:void(0)" method="get">	  
				<div id="search"> 
					<div class="Drop">
						<input type="text" id="serch" class="dropfirst" placeholder="Cerca..." onkeyup="cercaProd()" autocomplete="off">
							
						<div class="elem-content" >	
						
							<ul id="datiRice"></ul>	
							
						</div>
					</div>
					<button><span class="material-symbols-outlined">search</span></button>
				</div>	
				
				</form>	
				<span onclick="openMenu()" id="men" class="material-symbols-outlined">menu</span> 		
				<ul id="generi" class="side">
					<li class="closebtn" onclick="closeMenu()">&times;</li>
					
					<li class="menu">
					  
                      <a href="<%= request.getContextPath()%>/products?animale=Cane">Cani
                        <span class="material-symbols-outlined">keyboard_arrow_down</span>
                       </a>
                       <div class="dropdown">
                         <a href="<%= request.getContextPath()%>/products?animale=Cane&Categoria=Farmaceutici">Beni farmaceutici</a>
                          <a href="<%= request.getContextPath()%>/products?animale=Cane&Categoria=Igenici">Beni igenici</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Cane&Categoria=Giochi">Giochi</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Cane&Categoria=Cibo">Cibo</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Cane&Categoria=Snack">Snack</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Cane&Categoria=Accessori">Accessori</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Cane&Categoria=Abbigliamento">Abbigliamento</a>
                       </div>
                    </li>
					
					<li class="menu">
                      <a href="<%= request.getContextPath()%>/products?animale=Gatto">Gatti
                        <span class="material-symbols-outlined">keyboard_arrow_down</span>
                       </a>
                        <div class="dropdown">
                         <a href="<%= request.getContextPath()%>/products?animale=Gatto&Categoria=Farmaceutici">Beni farmaceutici</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Gatto&Categoria=Igenici">Beni igenici</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Gatto&Categoria=Giochi">Giochi</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Gatto&Categoria=Cibo">Cibo</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Gatto&Categoria=Snack">Snack</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Gatto&Categoria=Accessori">Accessori</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Gatto&Categoria=Abbigliamento">Abbigliamento</a>
                       </div>
                       
					<li class="menu">
                      <a href="<%= request.getContextPath()%>/products?animale=Rettile">Rettili
                        <span class="material-symbols-outlined">keyboard_arrow_down</span>
                       </a>
                       <div class="dropdown">
                         <a href="<%= request.getContextPath()%>/products?animale=Rettile&Categoria=Farmaceutici">Beni farmaceutici</a>  
                         <a href="<%= request.getContextPath()%>/products?animale=Rettile&Categoria=Igenici">Beni igenici</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Rettile&Categoria=Cibo">Cibo</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Rettile&Categoria=Snack">Snack</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Rettile&Categoria=Accessori">Accessori</a>                
                       </div>
                       
					<li class="menu">
                      <a href="<%= request.getContextPath()%>/products?animale=Roditore">Roditori
                        <span class="material-symbols-outlined">keyboard_arrow_down</span>
                       </a>
                       <div class="dropdown">
                         <a href="<%= request.getContextPath()%>/products?animale=Roditore&Categoria=Farmaceutici">Beni farmaceutici</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Roditore&Categoria=Igenici">Beni igenici</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Roditore&Categoria=Giochi">Giochi</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Roditore&Categoria=Cibo">Cibo</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Roditore&Categoria=Snack">Snack</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Roditore&Categoria=Accessori">Accessori</a>
                       </div>
                       
					<li class="menu">
                      <a href="<%= request.getContextPath()%>/products?animale=Uccello">Uccelli
                        <span class="material-symbols-outlined">keyboard_arrow_down</span>
                       </a>
                       <div class="dropdown">
                         <a href="<%= request.getContextPath()%>/products?animale=Uccello&Categoria=Farmaceutici">Beni farmaceutici</a>
                          <a href="<%= request.getContextPath()%>/products?animale=Uccello&Categoria=Igenici">Beni igenici</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Uccello&Categoria=Cibo">Cibo</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Uccello&Categoria=Snack">Snack</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Uccello&Categoria=Accessori">Accessori</a>

                       </div>
                       
					<li class="menu">
                      <a href="<%= request.getContextPath()%>/products?animale=Pesce">Pesci
                        <span class="material-symbols-outlined">keyboard_arrow_down</span>
                       </a>
                       <div class="dropdown">
                         <a href="<%= request.getContextPath()%>/products?animale=Pesce&Categoria=Farmaceutici">Beni farmaceutici</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Pesce&Categoria=Igenici">Beni igenici</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Pesce&Categoria=Cibo">Cibo</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Pesce&Categoria=Snack">Snack</a>
                         <a href="<%= request.getContextPath()%>/products?animale=Pesce&Categoria=Accessori">Accessori</a>
                       </div>
                       
				</ul>   		
			</nav>
</body>
</html>