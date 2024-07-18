function togglePasswordVisibility() {
    const passwordInput = document.getElementById('password');
    const visibilityIcon = document.querySelector('#toggle-password');
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        visibilityIcon.textContent = 'visibility_off';
    } else {
        passwordInput.type = 'password';
        visibilityIcon.textContent = 'visibility';
    }
}
document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('loginForm');
    const errorMessage = document.getElementById('errorMessage');
    const errorIcon = document.getElementById('errorIcon');
    const errorText = document.getElementById('errorText');

    loginForm.addEventListener('submit', function(event) {
        event.preventDefault();
        
        
        // Ottieni i dati dal form
        const formData = new FormData(loginForm);
        const username = formData.get('user');
        const password = formData.get('pwd');
        
        // Crea un oggetto JSON con i dati del form
        const loginData = {
            user: username,
            pwd: password
        };

        // Invia i dati come JSON con fetch
        fetch(loginForm.action, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(loginData)
        })
        .then(response => response.json().then(data => ({status: response.status, body: data})))
        .then(({status, body}) => {
            if (status === 200) {
                if (body.status === 'success') {
                    window.location.href = body.redirect;
                } else {
                    errorIcon.style.display = 'inline';
                    errorText.textContent = body.message;
                }
            } else {
                errorIcon.style.display = 'inline';
                errorText.textContent = body.message || 'Errore durante la connessione al server';
            }
        })
        .catch(error => {
            console.error('Errore durante la richiesta AJAX:', error);
            errorIcon.style.display = 'inline';
            errorText.textContent = 'Errore durante la connessione al server';
        });
    });
});

function checkNomeCognome(inputtxt) {
    var nome = /^[A-Za-z]+$/;
    return nome.test(inputtxt.value);
}

function checkPassword(inputtxt) {
    var password = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    return password.test(inputtxt.value);
}

function checkTelefono(inputtxt) {
    var telefono = /^[0-9]{9,10}$/;
    return telefono.test(inputtxt.value);
}
function checkVia(inputtxt) {
    var via = /^[A-Za-z\s]+$/;
    return via.test(inputtxt.value);
}

function checkNumCivico(inputtxt) {
    var NumCivico = /^[0-9]{1,4}[A-Z]?$/;
    return NumCivico.test(inputtxt.value);
}

function checkCap(inputtxt) {
    var cap = /^[0-9]{5}$/;
    return cap.test(inputtxt.value);
}

function checkCartaCredito(inputtxt) {
    var cartaCredito = /^[0-9]{16}$/;
    return cartaCredito.test(inputtxt.value);
}

function validate(obj) {	
    var valid = true;	

    var nome = document.getElementsByName("nome")[0];
    if(!checkNomeCognome(nome)) {
        valid = false;
        document.getElementById("errNome").innerHTML = "Nome non valido";
        document.getElementById("errNome").style.color = "rgba(208,128,242,1)";
    } else {
        document.getElementById("errNome").innerHTML = "";
    }

    var cognome = document.getElementsByName("cognome")[0];
    if(!checkNomeCognome(cognome)) {
        valid = false;
        document.getElementById("errCognome").innerHTML = "Cognome non valido";
        document.getElementById("errCognome").style.color = "rgba(208,128,242,1)";
    } else {
        document.getElementById("errCognome").innerHTML = "";
    }
    
    var pw = document.getElementsByName("pwd")[0];
    if(!checkPassword(pw)) {
        valid = false;
        document.getElementById("errPwd").innerHTML = "Password non valida";
        document.getElementById("errPwd").style.color = "rgba(208,128,242,1)";
    } else {
        document.getElementById("errPwd").innerHTML = "";
    }

    var tel = document.getElementsByName("telefono")[0];
    if(!checkTelefono(tel)) {
        valid = false;
        document.getElementById("errTelefono").innerHTML = "Telefono non valido";
        document.getElementById("errTelefono").style.color = "rgba(208,128,242,1)";
    } else {
        document.getElementById("errTelefono").innerHTML = "";
    }
    if(valid) {
        obj.submit();
    }
}
    
    function validateCheck(obj) {	
    var valid = true;	
    
     var via = document.getElementsByName("via")[0];
    if(!checkVia(via)) {
        valid = false;
        document.getElementById("errVia").innerHTML = "Via non valido";
        document.getElementById("errVia").style.color = "rgba(208,128,242,1)";
    } else {
        document.getElementById("errVia").innerHTML = "";
    }
    
      var NumCivico = document.getElementsByName("numCivico")[0];
    if(!checkNumCivico(NumCivico)) {
        valid = false;
        document.getElementById("errNumCivico").innerHTML = "Numero civico non valido";
        document.getElementById("errNumCivico").style.color = "rgba(208,128,242,1)";
    } else {
        document.getElementById("errNumCivico").innerHTML = "";
    }
    
      var cap = document.getElementsByName("cap")[0];
    if(!checkCap(cap)) {
        valid = false;
        document.getElementById("errCap").innerHTML = "CAP non valido";
        document.getElementById("errCap").style.color = "rgba(208,128,242,1)";
    } else {
        document.getElementById("errCap").innerHTML = "";
    }
    
       var cartaCredito = document.getElementsByName("cartaDiCredito")[0];
    if(!checkCartaCredito(cartaCredito)) {
        valid = false;
        document.getElementById("errCartaCredito").innerHTML = "Numero carta non valido";
        document.getElementById("errCartaCredito").style.color = "rgba(208,128,242,1)";
    } else {
        document.getElementById("errCartaCredito").innerHTML = "";
    }
    
     if(valid) {
        obj.submit();
    }
    
}
function setNews(img){
	var basePath = './images/';
    var imageUrl = basePath + img;

  document.getElementById('pnews').style.backgroundImage = "url("+imageUrl+")";
 }
function scrolleft(){
		const scrollableContent = document.getElementById('scrollableContent');
        scrollableContent.scrollBy({ left: -100, behavior: 'smooth'});  
}

function scrollright(){
	const scrollableContent = document.getElementById('scrollableContent');	
	 scrollableContent.scrollBy({ left: 100, behavior: 'smooth'});
}