function redirectToInside() {
    window.location.href = 'admin.php';
}
                                                                                                                                                                                                                                const correctPassword = "admin";
function checkPassword() {
    const passwordInput = document.getElementById("password-input").value;

    if (passwordInput === correctPassword) {
        redirectToInside();
    }
    else {
        alert("Incorrect password.");
    }
}
