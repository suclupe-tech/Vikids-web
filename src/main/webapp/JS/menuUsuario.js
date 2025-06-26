/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
//menu de usuario
const adminButton = document.getElementById("adminButton");
const adminMenu = document.getElementById("adminMenu");

// Alternar visibilidad del menú
adminButton.addEventListener("click", (e) => {
    e.stopPropagation(); // evitar que se cierre inmediatamente
    adminMenu.classList.toggle("hidden");
});

// Cerrar menú si se hace clic fuera
document.addEventListener("click", (e) => {
    if (!adminMenu.classList.contains("hidden")) {
        adminMenu.classList.add("hidden");
    }
});

// Evitar cierre si se hace clic dentro del menú
adminMenu.addEventListener("click", (e) => {
    e.stopPropagation();
});

