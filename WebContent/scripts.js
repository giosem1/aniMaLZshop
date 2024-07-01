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
    
    var basePath = '../images/';
    var imageName = getImageName();
    var imageUrl = basePath + imageName;

    var newsElement = document.getElementById('news');
    
    if (newsElement) {
        newsElement.style.backgroundImage = 'url(' + imageUrl + ')';
    }
})

function getImageName() {
    // Logica per calcolare dinamicamente il nome dell'immagine
    
}