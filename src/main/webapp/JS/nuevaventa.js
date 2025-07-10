/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function generarNumeroComprobante() {
    const tipo = document.getElementById("tipoComprobante").value;
    const numero = tipo === "BOLETA" ? "B" : "F";
    const aleatorio = Math.floor(100000 + Math.random() * 900000);
    document.getElementById("numeroComprobante").value = numero + "-" + aleatorio;
}


// buscar producto por codigo
function buscarProductoPorCodigo() {
    const codigo = document.getElementById("codigoProductoInput").value;
    if (!codigo)
        return;

    fetch(contextPath + "/BuscarProducto?codigo=" + codigo)

            .then(res => res.json())
            .then(data => {
                console.log("Respuesta del servidor:", data);
                // Si el producto existe, llena los campos
                if (data && data.nombre) {
                    document.getElementById("nombreProducto").value = data.nombre;
                    document.getElementById("precioInput").value = data.precio.toFixed(2);
                    document.getElementById("codigoProductoInput").dataset.id = data.id; // Guardar id del producto
                } else {
                    // Si no existe, muestra alerta y limpia campos
                    alert("❌ Producto no encontrado");
                    document.getElementById("nombreProducto").value = '';
                    document.getElementById("precioInput").value = '';
                }
            })
            .catch(() => alert("Error al buscar el producto"));
}

// Agregar producto al detalle
function agregarProducto() {
    const codigoInput = document.getElementById("codigoProductoInput");
    const nombreInput = document.getElementById("nombreProducto");
    const precioInput = document.getElementById("precioInput");
    const cantidadInput = document.getElementById("cantidadInput");

    const codigo = codigoInput.value.trim();
    const nombre = nombreInput.value.trim();
    const precio = parseFloat(precioInput.value); // Precio incluye IGV
    const cantidad = parseInt(cantidadInput.value);

    if (!codigo || !nombre || isNaN(precio) || isNaN(cantidad) || cantidad <= 0) {
        alert("⚠️ Por favor, completa correctamente todos los campos del producto.");
        return;
    }

    const total = (precio * cantidad).toFixed(2);

    const tr = document.createElement("tr");
    tr.setAttribute("data-id-producto", codigoInput.dataset.id);
    tr.innerHTML = `
        <td>${codigo}</td>
        <td>${nombre}</td>
        <td>${cantidad}</td>
        <td>S/ ${precio.toFixed(2)}</td>
        <td>S/ ${total}</td>
        <td>
            <button class="btn btn-danger btn-sm rounded-circle" onclick="eliminarFila(this)" title="Eliminar">
                <i class="bi bi-trash3-fill"></i>
            </button>
        </td>
    `;

    document.getElementById("detalleVentaBody").appendChild(tr);
    actualizarTotales();

    // Limpiar campos
    codigoInput.value = "";
    nombreInput.value = "";
    precioInput.value = "";
    cantidadInput.value = 1;
    delete codigoInput.dataset.id;
    codigoInput.focus();
}



function actualizarTotales() {
    let totalVenta = 0;

    // Recorremos la columna "Total" de la tabla
    document.querySelectorAll("#detalleVentaBody tr").forEach(row => {
        const totalProducto = parseFloat(row.cells[4].innerText.replace("S/ ", "")); // columna Total
        totalVenta += totalProducto;
    });

    const subtotal = totalVenta / 1.18;
    const igv = totalVenta - subtotal;

    // Descuento (si quieres aplicarlo después)
    const descuento = parseFloat(document.getElementById("descuentoVenta").value) || 0;
    const totalFinal = totalVenta - descuento;

    document.getElementById("subtotalVenta").textContent = subtotal.toFixed(2);
    document.getElementById("igvVenta").textContent = igv.toFixed(2);
    document.getElementById("totalVenta").textContent = totalFinal.toFixed(2);
}




function cerrarFormulario() {
    window.history.back();
}

function guardarVenta() {
    const tipoComprobante = document.getElementById("tipoComprobante").value;
    const numeroComprobante = document.getElementById("numeroComprobante").value;
    const fechaVenta = document.getElementById("fechaVenta").value;

    const dniCliente = document.getElementById("dniCliente").value;
    const nombreCliente = document.getElementById("nombreCliente").value;
    const direccionCliente = document.getElementById("direccionCliente").value;

    const tipoPago = document.getElementById("tipoPago").value;
    const descuento = parseFloat(document.getElementById("descuentoVenta").value) || 0;
    const subtotal = document.getElementById("subtotalVenta").textContent;
    const igv = document.getElementById("igvVenta").textContent;
    const total = document.getElementById("totalVenta").textContent;
    const idCliente = document.getElementById("idCliente").value;
    const idAdmin = document.getElementById("idAdmin").value;
    const estado = "REALIZADA"; // o "ACTIVA" según tu lógica

    const productos = [];
    document.querySelectorAll("#detalleVentaBody tr").forEach(row => {
        const idProducto = parseInt(row.getAttribute("data-id-producto"));
        const nombreProducto = row.cells[1].innerText;
        const cantidad = parseInt(row.cells[2].innerText);
        const precioUnitario = parseFloat(row.cells[3].innerText.replace("S/ ", ""));
        const subtotalProducto = parseFloat(row.cells[4].innerText.replace("S/ ", ""));

        productos.push({
            idProducto,
            nombreProducto,
            cantidad,
            precioUnitario,
            subtotal: subtotalProducto
        });
    });

    if (productos.length === 0) {
        alert("⚠️ Agrega al menos un producto a la venta.");
        return;
    }

    const formData = new URLSearchParams(); // ✅ Primero declara formData
    formData.append("tipoComprobante", tipoComprobante);
    formData.append("numeroComprobante", numeroComprobante);
    formData.append("fechaVenta", fechaVenta);
    formData.append("dniCliente", dniCliente);
    formData.append("nombreCliente", nombreCliente);
    formData.append("direccionCliente", direccionCliente);
    formData.append("tipoPago", tipoPago);
    formData.append("descuento", descuento);
    formData.append("subtotal", subtotal);
    formData.append("igv", igv);
    formData.append("total", total);
    formData.append("idCliente", idCliente); // ✅ Ahora sí, correctamente
    formData.append("productos", JSON.stringify(productos));
    formData.append("idAdmin", idAdmin);
    formData.append("estado", estado);
    fetch(contextPath + "/GuardarVenta", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: formData.toString()
    })
            .then(res => {
                if (res.redirected) {
                    window.location.href = res.url;
                } else {
                    alert("✅ Venta guardada correctamente");
                    document.getElementById("detalleVentaBody").innerHTML = "";
                    document.getElementById("subtotalVenta").textContent = "0.00";
                    document.getElementById("igvVenta").textContent = "0.00";
                    document.getElementById("totalVenta").textContent = "0.00";
                }
            })
            .catch(err => {
                console.error(err);
                alert("❌ Error al guardar la venta");
            });
}

function cerrarFormulario() {
    window.location.href = "dashboard.jsp"; // Cambia esto según tu ruta
}
// Generar fecha automática
window.onload = () => {
    const now = new Date();
    const fechaHora = now.toLocaleString('es-PE');
    document.getElementById("fechaVenta").value = fechaHora;
}
function eliminarFila(boton) {
    boton.closest("tr").remove();
    actualizarTotales();
}
function cambiarTipoComprobante() {
    const tipo = document.getElementById("tipoComprobante").value;
    window.location.href = contextPath + "/NuevaVenta?tipo=" + tipo;
}

