<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%NewsBean news = (NewsBean) request.getSession().getAttribute("news");
		System.out.println(news);	
	if(news==null){
			response.sendRedirect("./news");
		}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>News</title>
<link rel="stylesheet" href="../styles/style.css" type="text/css">
</head>
<body>
     <%@ include file="../fragment/header.jsp" %>
	 <%@ include file="../fragment/menu.jsp" %>	
	 
	 <div>
		   <ul>
		         <li><span class=""><%=news.getTitolo()%></span></li>
		         <li><span class="">Categoria: <%=news.getCategoria()%></span></li>
		         <li><span class="">Data Publicazione: <%=news.getDataPlub()%></span></li>
				 <li><span class="">Scritto da: <%=news.getAutore()%></span></li>
				 <li><span class=""><%=news.getImmagine()%></span></li>			        
		   </ul>
		    	<span class=""><%=news.getContenuto()%></span>
		</div>
	  
     <%@ include file="../fragment/footer.jsp" %>
</body>
</html>