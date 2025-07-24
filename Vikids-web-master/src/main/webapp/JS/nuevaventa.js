/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function generarNumeroComprobante() {
    const tipo = document.getElementById("tipoComprobante").value;
    const prefijo = tipo === "BOLETA" ? "BO-" : "FA-";
    const numero = Math.floor(100000 + Math.random() * 900000);
    document.getElementById("numeroComprobante").value = prefijo + numero;
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

function verificarFormulario() {
    const form = document.getElementById("formVenta");
    const formData = new FormData(form);

    console.log("=== CONTENIDO DEL FORMULARIO ===");
    for (let [key, value] of formData.entries()) {
        console.log(key, value);
    }
    console.log("=== FIN CONTENIDO ===");
}

// Agregar producto al detalle
function agregarProducto() {
    const codigoInput = document.getElementById("codigoProductoInput");
    const nombreInput = document.getElementById("nombreProducto");
    const precioInput = document.getElementById("precioInput");
    const cantidadInput = document.getElementById("cantidadInput");
    const codigo = codigoInput.value.trim();
    const nombre = nombreInput.value.trim();
    const precio = parseFloat(precioInput.value);
    const cantidad = parseInt(cantidadInput.value);
    if (!codigo || !nombre || isNaN(precio) || isNaN(cantidad) || cantidad <= 0) {
        alert("⚠️ Por favor, completa correctamente todos los campos del producto.");
        return;
    }
    const total = (precio * cantidad).toFixed(2);

    // ✅ Crear el HTML de la fila incluyendo los inputs hidden desde el inicio
    const tr = document.createElement("tr");
    tr.setAttribute("data-id-producto", codigoInput.dataset.id);

    // Crear los inputs hidden como string
    let inputsHidden = '';
    const campos = [
        {name: "idProducto[]", value: codigoInput.dataset.id || ""},
        {name: "nombreProducto[]", value: nombre},
        {name: "cantidad[]", value: cantidad.toString()},
        {name: "precioUnitario[]", value: precio.toFixed(2)},
        {name: "subtotalProducto[]", value: total}
    ];

    campos.forEach(field => {
        inputsHidden += `<input type="hidden" name="${field.name}" value="${field.value}">`;
        console.log(`✅ Input creado: ${field.name} = ${field.value}`);
    });

    // Crear todo el contenido de la fila de una vez
    tr.innerHTML = `
        <td>${codigo}</td>
        <td>${nombre}</td>
        <td>${cantidad}</td>
        <td>S/ ${precio.toFixed(2)}</td>
        <td>S/ ${total}</td>
        <td>
            <button type="button" class="btn btn-danger btn-sm rounded-circle" onclick="eliminarFila(this)" title="Eliminar">
                <i class="bi bi-trash3-fill"></i>
            </button>
        </td>
        ${inputsHidden} <!-- Agregar los inputs hidden aquí -->
    `;

    document.getElementById("detalleVentaBody").appendChild(tr);
    actualizarTotales();

    // Limpiar campos
    codigoInput.value = "";
    nombreInput.value = "";
    precioInput.value = "";
    cantidadInput.value = "1";
    delete codigoInput.dataset.id;
    codigoInput.focus();

    // ✅ Verificar que se crearon los inputs
    console.log("📊 Producto agregado. Total productos en tabla:", document.querySelectorAll('#detalleVentaBody tr').length);
    setTimeout(() => {
        verificarFormulario();
    }, 100);
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
    console.log("🚀 Iniciando guardarVenta()");
    
    const form = document.getElementById("formVenta");
    const filas = document.querySelectorAll("#detalleVentaBody tr");
    
    if (filas.length === 0) {
        alert("⚠️ Debes agregar al menos un producto.");
        return;
    }
    
    // Debug productos antes de enviar
    debugProductos();
    
    // Verificar que los datos de los productos existen
    const ids = document.querySelectorAll('input[name="idProducto[]"]');
    console.log("📊 Productos encontrados:", ids.length);
    if (ids.length === 0) {
        alert("⚠️ No se encontraron productos en el detalle.");
        return;
    }
    
    // Recopilar datos del formulario
    const tipoComprobante = document.getElementById("tipoComprobante").value;
    const fechaVenta = document.getElementById("fechaVenta").value;
    const tipoPago = document.getElementById("tipoPago").value;
    const descuento = parseFloat(document.getElementById("descuentoVenta").value) || 0;
    const subtotal = document.getElementById("subtotalVenta").textContent;
    const igv = document.getElementById("igvVenta").textContent;
    const total = document.getElementById("totalVenta").textContent;
    const idCliente = document.getElementById("idCliente") ?
            document.getElementById("idCliente").value || 0 : 0;
    
    // Asegurarse de que tipoPago no sea null
    if (!tipoPago) {
        alert("⚠️ Debes seleccionar un tipo de pago.");
        return;
    }
    
    // ✅ ELIMINAR EL CONTENEDOR PROBLEMÁTICO
    let contenedor = document.getElementById("inputsOcultos");
    if (contenedor) {
        contenedor.remove(); // Eliminar completamente el div problemático
    }
    
    // ✅ AGREGAR INPUTS HIDDEN DIRECTAMENTE AL FORMULARIO
    // Primero eliminar inputs antiguos si existen
    const inputsAntiguos = form.querySelectorAll('.input-dinamico');
    inputsAntiguos.forEach(input => input.remove());
    
    // ✅ Función auxiliar para crear inputs hidden y agregarlos directamente al form
    function crearInputOculto(name, value) {
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = name;
        input.value = value;
        input.className = "input-dinamico"; // Para identificarlos
        form.appendChild(input); // Agregar directamente al formulario
        console.log(`✅ Input oculto creado: ${name} = ${value}`);
    }
    
    // ✅ Agregar campos de la venta directamente al formulario
    crearInputOculto("tipoComprobante", tipoComprobante);
    crearInputOculto("fechaVenta", fechaVenta);
    crearInputOculto("tipoPago", tipoPago);
    crearInputOculto("descuento", descuento);
    crearInputOculto("subtotal", subtotal);
    crearInputOculto("igv", igv);
    crearInputOculto("total", total);
    crearInputOculto("idCliente", idCliente);
    
    console.log("📝 Datos a enviar:");
    console.log("Tipo Comprobante:", tipoComprobante);
    console.log("Fecha:", fechaVenta);
    console.log("Tipo Pago:", tipoPago);
    console.log("Descuento:", descuento);
    console.log("Subtotal:", subtotal);
    console.log("IGV:", igv);
    console.log("Total:", total);
    console.log("ID Cliente:", idCliente);
    console.log("Productos:", ids.length);
    
    // Verificar formulario completo antes de enviar
    setTimeout(() => {
        verificarFormulario();
    }, 100);
    
    // ✅ Enviar formulario
    form.submit();
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

function debugProductos() {
    console.log("=== DEBUG PRODUCTOS ===");
    console.log("Inputs idProducto[]:", document.querySelectorAll('input[name="idProducto[]"]').length);
    console.log("Inputs nombreProducto[]:", document.querySelectorAll('input[name="nombreProducto[]"]').length);
    console.log("Inputs cantidad[]:", document.querySelectorAll('input[name="cantidad[]"]').length);
    console.log("Inputs precioUnitario[]:", document.querySelectorAll('input[name="precioUnitario[]"]').length);
    console.log("Inputs subtotalProducto[]:", document.querySelectorAll('input[name="subtotalProducto[]"]').length);

    // Mostrar valores
    document.querySelectorAll('input[name="idProducto[]"]').forEach((input, i) => {
        console.log(`Producto ${i + 1} ID:`, input.value);
    });
}