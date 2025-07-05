
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS (para dropdowns) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <title>Nueva Venta</title>
    </head>
    <body>
        <%@include file="../includes/adminPrincipal.jsp" %>
        <div class="container ml-64 mt-20 p-6">
            <div class="card shadow-lg rounded-4">
                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center rounded-top-4">
                    <h5 class="mb-0">🧾 Registro de Venta</h5>
                    <button class="btn btn-sm btn-light rounded-circle" onclick="cerrarFormulario()">
                        <i class="bi bi-x-lg"></i>
                    </button>
                </div>
                <div class="card-body p-4">

                    <!-- Datos generales -->
                    <div class="row mb-4 g-3">
                        <div class="col-md-4">
                            <label class="form-label">Cliente</label>
                            <select class="form-select rounded-pill">
                                <option value="">Seleccionar cliente</option>
                                <option>Juan Pérez</option>
                                <option>Empresa XYZ</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Tipo de Comprobante</label>
                            <select class="form-select rounded-pill" id="tipoComprobante" onchange="generarNumeroComprobante()">
                                <option value="BOLETA">Boleta</option>
                                <option value="FACTURA">Factura</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">N° Comprobante</label>
                            <input type="text" class="form-control rounded-pill bg-light" id="numeroComprobante" readonly>
                        </div>
                    </div>

                    <!-- Agregar producto -->
                    <div class="row g-3 mb-4">
                        <div class="col-md-5">
                            <label class="form-label">Producto</label>
                            <select class="form-select rounded-pill" id="productoSelect">
                                <option value="">Seleccionar producto</option>
                                <option value="1" data-precio="39.9">Jean Niña Azul</option>
                                <option value="2" data-precio="45.5">Polera Blanca</option>
                            </select>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label">Cantidad</label>
                            <input type="number" min="1" value="1" class="form-control rounded-pill" id="cantidadInput">
                        </div>

                        <div class="col-md-2">
                            <label class="form-label">Precio (S/)</label>
                            <input type="text" class="form-control rounded-pill bg-light" id="precioInput" readonly>
                        </div>

                        <div class="col-md-2 d-flex align-items-end">
                            <button class="btn btn-success w-100 rounded-pill" onclick="agregarProducto()">➕ Agregar</button>
                        </div>
                    </div>

                    <!-- Detalle de venta -->
                    <div class="table-responsive mb-4">
                        <table class="table table-bordered text-center align-middle">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th>Precio</th>
                                    <th>Subtotal</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>
                            <tbody id="detalleVentaBody"></tbody>
                        </table>
                    </div>

                    <!-- Total -->
                    <div class="text-end mb-3">
                        <h5>Total: <span class="text-success">S/ <span id="totalVenta">0.00</span></span></h5>
                    </div>

                    <!-- Botones -->
                    <div class="d-flex justify-content-end gap-3">
                        <button class="btn btn-secondary rounded-pill" onclick="cerrarFormulario()">Cancelar</button>
                        <button class="btn btn-success rounded-pill" onclick="guardarVenta()">💾 Guardar Venta</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="../JS/dasboard.js"></script>
        <script src="../JS/sidebar.js"></script>
        <script src="../JS/dasboard.js"></script>
        <script src="../JS/nuevaventa.js"></script>
        <script src="../JS/menuUsuario.js"></script>


    </body>

</html>
