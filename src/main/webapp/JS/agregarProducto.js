/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function agregarProductoATabla(producto) {
    const tabla = document.getElementById("tablaProductosBody");
    const fila = document.createElement("tr");
    fila.innerHTML = `
        <td>${producto.id}</td>
        <td>${producto.codigo}</td>
        <td>${producto.nombre}</td>
        <td>${producto.descripcion}</td>
        <td>${producto.stock}</td>
        <td>${producto.precio}</td>
        <td>${producto.categoria}</td>
        <td>${producto.marca}</td>
        <td>${producto.unidad}</td>
        <td>${producto.imagen}</td>
        <td>${producto.activo ? "Activo" : "Inactivo"}</td>
        <td>
            <button class="bg-red-500 text-white px-2 py-1 rounded" onclick="desactivar(${producto.id})">
                Desactivar
            </button>
        </td>
    `;
    tabla.appendChild(fila);
}
