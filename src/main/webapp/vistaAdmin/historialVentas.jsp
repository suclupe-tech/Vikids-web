
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HistorialVentas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="../styleCss/historialventas.css"/>
        
    </head>
    <body class="p-4">
        <%@include file="../includes/adminPrincipal.jsp" %>
        <div id="mainContent" class="container table-wrapper ml-64 mt-20 p-6">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">Ventas Registradas</h2>
                <div class="d-flex gap-2 no-print">
                    <a href="nuevaVenta.jsp" class="btn btn-success"><i class="bi bi-plus-circle"></i> Nueva Venta</a>
                    <button class="btn btn-secondary" onclick="window.print()"><i class="bi bi-printer"></i> Imprimir</button>
                    <button class="btn btn-success" onclick="exportarExcel()"><i class="bi bi-file-earmark-excel"></i> Excel</button>
                    <button class="btn btn-danger" onclick="exportarPDF()"><i class="bi bi-file-earmark-pdf"></i> PDF</button>
                </div>
            </div>

            <div class="row mb-3 filter-group d-flex justify-content-center no-print">
                <div class="col-md-3">
                    <label class="form-label">Buscar por Fecha</label>
                    <input type="date" class="form-control" id="filtroFecha" oninput="filtrarTabla()">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Buscar por Cliente</label>
                    <input type="text" class="form-control" id="filtroCliente" placeholder="Nombre cliente" oninput="filtrarTabla()">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Filtrar por Estado</label>
                    <select class="form-select" id="filtroEstado" onchange="filtrarTabla()">
                        <option value="">Todos</option>
                        <option value="Pagado">Pagado</option>
                        <option value="Pendiente">Pendiente</option>
                        <option value="Anulado">Anulado</option>
                    </select>
                </div>
            </div>

            <table class="table table-bordered table-hover text-center align-middle" id="tablaVentasExportar">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Fecha</th>
                        <th>Cliente</th>
                        <th>Tipo</th>
                        <th>N° Comprobante</th>
                        <th>Total (S/)</th>
                        <th>Estado</th>
                        <th class="no-print">Acción</th>
                    </tr>
                </thead>
                <tbody id="tablaVentas">
                    <tr>
                        <td>001</td>
                        <td>2025-05-30</td>
                        <td>Juan Pérez</td>
                        <td>Factura</td>
                        <td>FAC000522</td>
                        <td>89.90</td>
                        <td><span class="badge bg-warning text-dark">Pendiente</span></td>
                        <td class="no-print"><a href="#" class="btn btn-sm btn-primary"><i class="bi bi-eye"></i></a></td>
                    </tr>
                    <tr>
                        <td>002</td>
                        <td>2025-05-29</td>
                        <td>María López</td>
                        <td>Boleta</td>
                        <td>BOL350233</td>
                        <td>120.50</td>
                        <td><span class="badge bg-success">Pagado</span></td>
                        <td class="no-print"><a href="#" class="btn btn-sm btn-primary"><i class="bi bi-eye"></i></a></td>
                    </tr>
                    <tr>
                        <td>003</td>
                        <td>2025-05-28</td>
                        <td>Carlos Ramos</td>
                        <td>Boleta</td>
                        <td>BOL350234</td>
                        <td>200.00</td>
                        <td><span class="badge bg-danger">Anulado</span></td>
                        <td class="no-print"><a href="#" class="btn btn-sm btn-primary"><i class="bi bi-eye"></i></a></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <script src="../JS/historialventas.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
        <script src="../JS/dasboard.js"></script>
        <script src="../JS/sidebar.js"></script>
        <script src="../JS/menuUsuario.js"></script>
    </body>
</html>
