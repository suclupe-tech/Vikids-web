
<%@page import="java.util.List"%>
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
        <div id="mainContent" class="max-w-7xl mx-auto bg-white p-6 rounded-xl shadow-lg ml-64 mt-20 p-6">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0">Ventas Registradas</h2>
                <div class="d-flex gap-2 no-print">
                    <a href="<%= context %>/NuevaVenta" class="btn btn-success"><i class="bi bi-plus-circle"></i> Nueva Venta</a>
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

            <table id="tablaVentas" class="table table-bordered table-hover text-center align-middle" id="tablaVentasExportar">
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
                <tbody >
                    <%    List<com.mycompany.vikids.modelo.Venta> ventas = (List<com.mycompany.vikids.modelo.Venta>) request.getAttribute("ventas");
                        int i = 1;
                        if (ventas != null) {
                            for (com.mycompany.vikids.modelo.Venta v : ventas) {
                    %>
                    <tr>
                        <td><%= i++%></td>
                        <td><%= v.getFecha().toLocalDate()%></td>
                        <td><%= v.getIdCliente()%></td>
                        <td><%= v.getTipoComprobante()%></td>
                        <td><%= v.getNumeroComprobante()%></td>
                        <td><%= String.format("%.2f", v.getTotal())%></td>
                        <td>
                            <span class="badge <%= v.getEstado().equals("Pagado") ? "bg-success"
                : v.getEstado().equals("Pendiente") ? "bg-warning text-dark"
                : "bg-danger"%>"><%= v.getEstado()%></span>
                        </td>
                        <td class="no-print">
                            <a href="#" class="btn btn-sm btn-primary"><i class="bi bi-eye"></i></a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>


            </table>
        </div>

        <script src="<%= context%>/JS/historialventas.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
        <script src="<%= context%>/JS/dasboard.js"></script>
        <script src="<%= context%>/JS/sidebar.js"></script>
        <script src="<%= context%>/JS/menuUsuario.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/datatable-init.js"></script>
    </body>
</html>
