
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Nueva Venta</title>

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Tailwind -->
        <script src="https://cdn.tailwindcss.com"></script>
        <!-- AlpineJS -->
        <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
    </head>

    <body>
        <%@include file="../includes/adminPrincipal.jsp" %>

        <input type="hidden" id="idAdmin" value="<%= session.getAttribute("idAdmin")%>">


        <div id="mainContent" class="container ml-64 mt-24 p-6">
            <div class="bg-white shadow-xl rounded-3xl">
                <!-- Cabecera -->
                <div class="bg-primary text-white px-6 py-3 rounded-t-3xl flex items-center justify-between">
                    <h2 class="text-xl font-bold">🧾 Nueva Venta</h2>
                    <button class="btn btn-light btn-sm rounded-circle" onclick="cerrarFormulario()">
                        <i class="bi bi-x-lg"></i>
                    </button>
                </div>

                <!-- Contenido -->
                <div class="p-6 space-y-6">

                    <!-- 🧾 Información General -->
                    <div>
                        <h3 class="text-lg font-semibold mb-3">🧾 Información General</h3>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <div>
                                <label class="form-label text-sm">Tipo de Comprobante</label>
                                <select class="form-select form-select-sm rounded-pill" id="tipoComprobante" name="tipoComprobante" onchange="cambiarTipoComprobante()">
                                    <option value="BOLETA" <%= "BOLETA".equals(request.getAttribute("tipoComprobante")) ? "selected" : ""%>>Boleta</option>
                                    <option value="FACTURA" <%= "FACTURA".equals(request.getAttribute("tipoComprobante")) ? "selected" : ""%>>Factura</option>
                                </select>

                            </div>
                            <div>
                                <label class="form-label text-sm">N° Comprobante</label>
                                <input type="text" id="numeroComprobante" name="numeroComprobante" class="form-control form-control-sm rounded-pill bg-light" readonly
                                       value="<%= request.getAttribute("numeroComprobante") != null ? request.getAttribute("numeroComprobante") : ""%>">


                            </div>
                            <div>
                                <label class="form-label text-sm">Fecha y Hora</label>
                                <input type="text" id="fechaVenta" name="fechaVenta" class="form-control ... bg-light" readonly 
                                       value="<%= request.getAttribute("fechaVenta") != null ? request.getAttribute("fechaVenta") : ""%>">

                            </div>
                        </div>
                    </div>

                    <!-- 👤 Cliente -->
                    <div>
                        <h3 class="text-lg font-semibold mb-3">👤 Datos del Cliente</h3>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <div>
                                <label class="form-label text-sm">DNI/RUC</label>
                                <div class="input-group input-group-sm">
                                    <input type="text" id="dniCliente" name="dniCliente" class="form-control rounded-pill" placeholder="Ingrese DNI/RUC">
                                    <input type="hidden" id="idCliente" name="idCliente">

                                    <button class="btn btn-primary rounded-pill ms-2" type="button" onclick="buscarClientePorDNI()">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>
                            </div>
                            <div>
                                <label class="form-label text-sm">Nombre/Razón Social</label>
                                <input type="text" id="nombreCliente" class="form-control form-control-sm rounded-pill bg-light" readonly>
                            </div>
                            <div>
                                <label class="form-label text-sm">Dirección</label>
                                <input type="text" id="direccionCliente" class="form-control form-control-sm rounded-pill bg-light" readonly>
                            </div>
                        </div>
                    </div>

                    <!-- 🧾 Datos adicionales -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="form-label text-sm">Tipo de Pago</label>
                            <select id="tipoPago" class="form-select form-select-sm rounded-pill">
                                <option value="EFECTIVO">Efectivo</option>
                                <option value="YAPE">Yape</option>
                                <option value="PLIN">Plin</option>
                                <option value="TARJETA">Tarjeta</option>
                            </select>
                        </div>
                        <div>
                            <label class="form-label text-sm">Descuento (S/)</label>
                            <input type="number" id="descuentoVenta" min="0" value="0" class="form-control form-control-sm rounded-pill">
                        </div>
                    </div>

                    <!-- 📦 Buscar Producto -->
                    <div>
                        <h3 class="text-lg font-semibold mb-3">📦 Agregar Producto</h3>
                        <div class="grid grid-cols-1 md:grid-cols-5 gap-4 items-end">
                            <div>
                                <label class="form-label text-sm">Código Producto</label>
                                <input type="text" id="codigoProductoInput" class="form-control form-control-sm rounded-pill" placeholder="Ej. 123456" onblur="buscarProductoPorCodigo()">
                            </div>
                            <div>
                                <label class="form-label text-sm">Nombre Producto</label>
                                <input type="text" id="nombreProducto" class="form-control form-control-sm rounded-pill bg-light" readonly>
                            </div>
                            <div>
                                <label class="form-label text-sm">Precio (S/)</label>
                                <input type="text" id="precioInput" class="form-control form-control-sm rounded-pill bg-light" readonly>
                            </div>
                            <div>
                                <label class="form-label text-sm">Cantidad</label>
                                <input type="number" id="cantidadInput" min="1" value="1" class="form-control form-control-sm rounded-pill">
                            </div>
                            <div>
                                <button class="btn btn-success w-100 rounded-pill" onclick="agregarProducto()">
                                    <i class="bi bi-plus-circle"></i> Agregar
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- 🧾 Detalle -->
                    <div class="table-responsive">
                        <table class="table table-bordered text-center align-middle text-sm">
                            <thead class="table-secondary">
                                <tr>
                                    <th>Código</th>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th>Precio Unitario</th>
                                    <th>Total</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>
                            <tbody id="detalleVentaBody">

                            </tbody>
                        </table>
                    </div>



                    <!-- 💵 Resumen de Totales -->
                    <div class="text-end space-y-1">
                        <div>
                            <span class="font-medium">Subtotal:</span>
                            <span>S/ <span id="subtotalVenta">0.00</span></span>
                        </div>
                        <div>
                            <span class="font-medium">IGV (18%):</span>
                            <span>S/ <span id="igvVenta">0.00</span></span>
                        </div>
                        <div>
                            <h5 class="text-lg font-semibold">Total a Pagar: 
                                <span class="text-success">S/ <span id="totalVenta">0.00</span></span>
                            </h5>
                        </div>
                    </div>

                    <!-- Botones -->
                    <div class="d-flex justify-content-end gap-3">
                        <button class="btn btn-secondary rounded-pill" onclick="cerrarFormulario()">
                            <i class="bi bi-x-circle"></i> Cancelar
                        </button>
                        <button class="btn btn-success rounded-pill" onclick="guardarVenta()">
                            <i class="bi bi-save"></i> Guardar Venta
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const contextPath = "<%= request.getContextPath()%>";
        </script>

        <script src="<%= request.getContextPath()%>/JS/dasboard.js"></script>
        <script src="<%= request.getContextPath()%>/JS/sidebar.js"></script>
        <script src="<%= request.getContextPath()%>/JS/nuevaventa.js"></script>
        <script src="<%= request.getContextPath()%>/JS/menuUsuario.js"></script>
        <script src="<%= request.getContextPath()%>/JS/guardarVenta.js"></script>
        <script src="<%= request.getContextPath()%>/JS/buscarClienteVenta.js"></script>
    </body>
</html>

