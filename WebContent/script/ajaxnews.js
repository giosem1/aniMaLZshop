var categ
function cercaNews(input) {
		alert("clicca una sola volta un banner")
		categ=input;
		var params = 'news=' + input;	
 		loadAjaxDoc('./cercanewsJson', "GET", params, handleNews);
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
function handleNews(request){
	var response = JSON.parse(request.responseText);
	let imm="";
	for(let x in response.result){
		imm+=response.result[x];
		var newNews= document.createElement("img");
		newNews.setAttribute("src", "./images/"+imm);
		newNews.setAttribute("id", "imNews");
		var ptit= document.createElement("h1")
		ptit.setAttribute("id","title");
		ptit.appendChild(document.createTextNode(response.resultTit[x]));
		ptit.appendChild(newNews);
		
				
		if(categ==="Benessere e Salute"){
			var all=document.getElementById("B&S");
			all.insertBefore(ptit, all.childNodes[x]);
		}
		if(categ==="Comportamento e Gioco"){
			var all=document.getElementById("C&G");
			all.insertBefore(ptit, all.childNodes[x]);
		}
		if(categ==="Alimentazione"){
			var all=document.getElementById("Ali");
			all.insertBefore(ptit, all.childNodes[x]);
		}
		
		
		newNews.addEventListener("click", function(){
			var di= document.createElement("div");
			di.setAttribute("id", "screenews");
			
			var close=document.createElement("span");
			
			close.classList.add("material-symbols-outlined")
			close.appendChild(document.createTextNode('close'));
			close.setAttribute("id", "chiudinews");
			
			var ptitdiv= document.createElement("h1")
			ptitdiv.appendChild(document.createTextNode(response.resultTit[x]));
			var paut=document.createElement("p")
			paut.appendChild(document.createTextNode(response.resultAut[x]));
			var pdate=document.createElement("p")
			pdate.appendChild(document.createTextNode(response.resultDate[x]));
			var pcont=document.createElement("p")
			pcont.appendChild(document.createTextNode(response.resultCont[x]));
			
			di.appendChild(close);
			di.appendChild(ptitdiv);
			di.appendChild(paut);
			di.appendChild(pdate);
			di.appendChild(pcont);
			close.style.marginLeft="95%";

			

			di.style.display="table";
			di.style.zIndex= "2";
			di.style.position="relative";
			di.style.backgroundColor="#7ED9BF";
			di.style.borderRadius="10px";
			di.style.marginRight="5%"
			all.insertBefore(di, all.childNodes[x+1]);
			
			close.addEventListener("click", function(){
				di.style.display="none";
			})
		});	
		imm="";
	}
    
}
