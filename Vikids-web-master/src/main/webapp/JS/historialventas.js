/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function filtrarTabla() {
    const fecha = document.getElementById("filtroFecha").value;
    const cliente = document.getElementById("filtroCliente").value.toLowerCase();
    const estado = document.getElementById("filtroEstado").value;

    const filas = document.querySelectorAll("#tablaVentas tr");

    filas.forEach(fila => {
        const fechaFila = fila.cells[1].textContent.trim();
        const clienteFila = fila.cells[2].textContent.trim().toLowerCase();
        const estadoFila = fila.cells[6].textContent.trim();

        const coincideFecha = !fecha || fecha === fechaFila;
        const coincideCliente = !cliente || clienteFila.includes(cliente);
        const coincideEstado = !estado || estadoFila === estado;

        fila.style.display = (coincideFecha && coincideCliente && coincideEstado) ? "" : "none";
    });
}

function exportarExcel() {
    const tabla = document.getElementById('tablaVentasExportar');
    const wb = XLSX.utils.table_to_book(tabla, {sheet: "Ventas"});
    XLSX.writeFile(wb, "ventas.xlsx");
}

function exportarPDF() {
    const doc = new jspdf.jsPDF();
    doc.text("Lista de Ventas", 14, 10);
    doc.autoTable({
        html: '#tablaVentasExportar',
        startY: 20,
        headStyles: {fillColor: [40, 40, 40]},
    });
    doc.save("ventas.pdf");
}

