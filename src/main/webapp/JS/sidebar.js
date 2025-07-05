/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



// Submenús desplegables
document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".menu-link").forEach(link => {
        link.addEventListener("click", function (e) {
            e.preventDefault();

            const targetId = this.getAttribute("data-target");
            const submenu = document.getElementById(targetId);

            if (!submenu)
                return;

            document.querySelectorAll(".submenu").forEach(sm => {
                if (sm !== submenu) {
                    sm.classList.add("hidden");
                }
            });

            submenu.classList.toggle("hidden");
        });
    });
});


