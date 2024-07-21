function cercaProd() {
    var input = document.getElementById('serch').value;
   		if(input != " "){
			   var params = 'prodotto=' + input;
	
 		loadAjaxDoc('./cercaprodJson', "GET", params, handleProd);
		   }
	var divserch= document.getElementById("search");
	
	var link=document.createElement("a");
	link.setAttribute("href", "./products?nome="+input);
	link.insertBefore(document.getElementById("butt"), link.childNodes[0]);
	
	divserch.appendChild(link);
}

function createXMLHttpRequest() {
	var request;
	try {
		// Firefox 1+, Chrome 1+, Opera 8+, Safari 1.2+, Edge 12+, Internet Explorer 7+
		request = new XMLHttpRequest();
	} catch (e) {
		// past versions of Internet Explorer 
		try {
			request = new ActiveXObject("Msxml2.XMLHTTP");  
		} catch (e) {
			try {
				request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				alert("Il browser non supporta AJAX");
				return null;
			}
		}
	}
	return request;
}

function loadAjaxDoc(url, method, params, cFuction) {

	var request = createXMLHttpRequest();
	
	if(request){
		
		request.onreadystatechange = function() {

			if (this.readyState == 4) {
				if (this.status == 200) {
				     cFuction(this);
				} else {				
					if(this.status == 0){ 
						alert("Problemi nell'esecuzione della richiesta: nessuna risposta ricevuta nel tempo limite");
					} else { 
						alert("Problemi nell'esecuzione della richiesta:\n" + this.statusText);
					}
					return null;
				}
		    }
		};
		
		setTimeout(function () {    
        	if (request.readyState < 4) {
            	request.abort();
        	}
    	}, 15000); 
		
		if(method.toLowerCase() == "get"){
			if(params){
				request.open("GET", url + "?" + params, true);
			} else {
				request.open("GET", url, true);
			}
			request.setRequestHeader("Connection", "close");
	        request.send(null);
	        
		} else {
			
			if(params){
				request.open("POST", url, true);
				request.setRequestHeader("Connection", "close");
				request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	        	request.send(params);
			} else {
				console.log("Usa GET se non ci sono parametri!");
				return null;
			}
			
		}
		
	}
}
function handleProd(request){
	var response = JSON.parse(request.responseText);
	
	removeSearch()
	
	let text = "";
	for (let x in response.result) {
		var newitem = document.createElement("A");
  		newitem.classList.add("ricerca");
  		text += response.result[x];
 
  		var textnode= document.createTextNode(text);
  		newitem.appendChild(textnode);
  			
  		var list=document.getElementById("datiRice");
  		list.insertBefore(newitem, list.childNodes[x]);
  		newitem.setAttribute("href", "./prodotto?id="+ response.id[x]+"&page=Prodotto.jsp");
  		
  		text="";
	}

    
}
function removeSearch(){
	var list= document.getElementById("datiRice");
	
	var nodes= document.getElementsByClassName("ricerca");
	
	for(var i=0; i< (nodes.length); i++){
		list.removeChild(list.childNodes[i]);	
	}
	
}