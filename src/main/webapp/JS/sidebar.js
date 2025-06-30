/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



    // Submenús desplegables
    document.querySelectorAll(".menu-link").forEach(link => {
        link.addEventListener("click", function (e) {
            e.preventDefault();

            const targetId = this.getAttribute("data-target");
            const submenu = document.getElementById(targetId);

            // Cerrar otros submenús
            document.querySelectorAll(".submenu").forEach(sm => {
                if (sm !== submenu) {
                    sm.classList.add("hidden");
                }
            });

            // Mostrar/ocultar el submenú actual
            submenu.classList.toggle("hidden");
        });
    });

