/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function generarNumeroComprobante() {
    const tipo = document.getElementById("tipoComprobante").value;
    const random = Math.floor(Math.random() * 1000000).toString().padStart(6, "0");
    const numero = (tipo === "FACTURA" ? "FAC" : "BOL") + random;
    document.getElementById("numeroComprobante").value = numero;
}

// Mostrar precio al seleccionar producto
document.getElementById("productoSelect").addEventListener("change", function () {
    const selected = this.options[this.selectedIndex];
    const precio = selected.getAttribute("data-precio") || "0.00";
    document.getElementById("precioInput").value = precio;
});

// Agregar producto al detalle
function agregarProducto() {
    const select = document.getElementById("productoSelect");
    const producto = select.options[select.selectedIndex].text;
    const cantidad = parseInt(document.getElementById("cantidadInput").value);
    const precio = parseFloat(document.getElementById("precioInput").value);
    const subtotal = (cantidad * precio).toFixed(2);

    if (!producto || isNaN(cantidad) || isNaN(precio))
        return;

    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td>${producto}</td>
      <td>${cantidad}</td>
      <td>S/ ${precio.toFixed(2)}</td>
      <td>S/ ${subtotal}</td>
      <td><button class="btn btn-sm btn-danger rounded-pill" onclick="this.closest('tr').remove(); actualizarTotal()">🗑️</button></td>
    `;

    document.getElementById("detalleVentaBody").appendChild(tr);
    actualizarTotal();
}

function actualizarTotal() {
    let total = 0;
    document.querySelectorAll("#detalleVentaBody tr").forEach(row => {
        const subtotal = parseFloat(row.cells[3].textContent.replace("S/ ", ""));
        total += subtotal;
    });
    document.getElementById("totalVenta").textContent = total.toFixed(2);
}

function guardarVenta() {
    alert("✅ Venta registrada correctamente.");
    // Aquí iría tu lógica de envío al backend
}

function cerrarFormulario() {
    window.location.href = "dashboard.jsp"; // Cambia esto según tu ruta
}

