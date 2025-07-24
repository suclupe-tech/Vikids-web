/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function filtrarUsuarios() {
    const filtro = document.getElementById("busqueda").value.toLowerCase();
    const filas = document.querySelectorAll("#tablaUsuarios tr");

    filas.forEach(fila => {
        const nombre = fila.children[1].textContent.toLowerCase();
        fila.style.display = nombre.includes(filtro) ? "" : "none";
    });
}
