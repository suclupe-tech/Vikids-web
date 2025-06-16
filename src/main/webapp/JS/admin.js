/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.getElementById("loginForm").addEventListener("submit", function (e) {
    const usuario = document.getElementById("txtusuario");
    const clave = document.getElementById("txtclave");
    const errorUsuario = document.getElementById("errorUsuario");
    const errorClave = document.getElementById("errorClave");
    let valido = true;
    if (usuario.value.trim() === "") {
        errorUsuario.classList.remove("hidden");
        valido = false;
    } else {
        errorUsuario.classList.add("hidden");
    }

    if (clave.value.trim() === "") {
        errorClave.classList.remove("hidden");
        valido = false;
    } else {
        errorClave.classList.add("hidden");
    }

    if (!valido) {
        e.preventDefault(); // Cancela el envío del formulario
    }
});


