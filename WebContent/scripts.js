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