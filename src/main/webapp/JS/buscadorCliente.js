/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
// Buscador personalizado para tabla
document.addEventListener("DOMContentLoaded", function () {
    const tabla = $('#tablaClientes').DataTable({
        language: {
            url: '//cdn.datatables.net/plug-ins/1.13.4/i18n/es-ES.json'
        }
    });

    // Búsqueda desde input externo
    document.getElementById("buscarCliente").addEventListener("keyup", function () {
        tabla.search(this.value).draw();
    });
});


