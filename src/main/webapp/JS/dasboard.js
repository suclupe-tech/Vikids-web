/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const menuToggle = document.getElementById("menuToggle");
const sidebar = document.getElementById("sidebar");
const content = document.getElementById("mainContent");

menuToggle.addEventListener("click", () => {
    sidebar.classList.toggle("hidden"); // oculta o muestra el sidebar

    // Ajusta el margen del contenido
    if (sidebar.classList.contains("hidden")) {
        content.classList.remove("ml-64");
        content.classList.add("ml-0");
    } else {
        content.classList.remove("ml-0");
        content.classList.add("ml-64");
    }
});

document.querySelectorAll('.menu-link').forEach(link => {
    link.addEventListener('click', function (e) {
        e.preventDefault();
        const targetId = this.getAttribute('data-target');
        const submenu = document.getElementById(targetId);

        if (submenu.style.display === "block") {
            submenu.style.display = "none";
            this.innerHTML = this.innerHTML.replace("▲", "▼");
        } else {
            // Cierra otros submenús abiertos
            document.querySelectorAll('.submenu').forEach(sm => sm.style.display = "none");
            document.querySelectorAll('.menu-link').forEach(l => l.innerHTML = l.innerHTML.replace("▲", "▼"));

            submenu.style.display = "block";
            this.innerHTML = this.innerHTML.replace("▼", "▲");
        }
    });
});

//exportar a excel
function exportarExcel() {
    // Aquí llamas a tu backend o generas el Excel desde JS
    alert("Función para exportar a Excel");
}
// eliminar producto
function eliminarProducto(id) {
    if (confirm("¿Estás seguro de eliminar este producto?")) {
        // Aquí va tu lógica de eliminación
        alert("Producto con ID " + id + " eliminado (simulado).");
    }
}

//mostrar producto
$(document).ready(function () {
    $('#tablaProductos').DataTable({
        "language": {
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ productos",
            "infoEmpty": "Mostrando 0 a 0 de 0 productos",
            "infoFiltered": "(filtrado de _MAX_ registros totales)",
            "search": "Buscar:",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }
    });
});

//check de seleccion
function toggleAll(source) {
    const checkboxes = document.querySelectorAll('.product-check');
    checkboxes.forEach(cb => cb.checked = source.checked);
}
//buscar producto
document.getElementById('buscarInput').addEventListener('input', function () {
    const filtro = this.value.toLowerCase().trim();
    const filas = document.querySelectorAll('table tbody tr');

    filas.forEach(fila => {
        const codigo = fila.cells[2].textContent.toLowerCase();
        const nombre = fila.cells[3].textContent.toLowerCase();

        if (codigo.includes(filtro) || nombre.includes(filtro)) {
            fila.style.display = '';
        } else {
            fila.style.display = 'none';
        }
    });
});
document.querySelectorAll('[data-target]').forEach(link => {
    link.addEventListener('click', e => {
        e.preventDefault();

        const targetId = link.dataset.target;
        const targetSubmenu = document.getElementById(targetId);

        // Cierra todos los submenús
        document.querySelectorAll('.submenu').forEach(submenu => {
            if (submenu !== targetSubmenu) {
                submenu.classList.add('max-h-0');
                submenu.classList.remove('max-h-80');
            }
        });

        // Alterna el submenú actual
        if (targetSubmenu.classList.contains('max-h-0')) {
            targetSubmenu.classList.remove('max-h-0');
            targetSubmenu.classList.add('max-h-80');
        } else {
            targetSubmenu.classList.add('max-h-0');
            targetSubmenu.classList.remove('max-h-80');
        }
    });
});


