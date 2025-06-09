<%-- 
    Document   : admin
    Created on : 1 jun. 2025, 1:18:51 a. m.
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap JS (para dropdowns) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            body {
                margin: 0;
                height: 100vh;
                overflow: hidden;
            }
            .topbar {
                height: 60px;
                background-color: #343a40;
                color: #ddd;
                display: flex;
                align-items: center;
                padding: 0 20px;
            }
            .topbar img {
                height: 50px;
                margin-right: 15px;
            }
            .sidebar {
                width: 220px;
                background-color: #001f3f;
                height: 100vh;
                position: fixed;
                top: 60px;
                left: 0;
                transition: left 0.3s ease;
                padding-top: 20px;
                overflow-y: auto;
            }
            .sidebar.hide {
                left: -220px;
            }
            .sidebar a {
                display: block;
                padding: 10px 20px;
                color: #ddd;
                text-decoration: none;
            }
            .sidebar a:hover {
                background-color: #0d6efd;
            }
            .content {
                margin-left: 220px;
                margin-top: 60px;
                padding: 20px;
                transition: margin-left 0.3s ease;
            }
            .content.full {
                margin-left: 0;
            }
            #menuToggle {
                cursor: pointer;
                font-size: 24px;
                margin-right: 15px;
            }
            .submenu {
                display: none;
                background-color: #0d6efd;
                padding-left: 30px;
            }
            .submenu a {
                font-size: 0.95rem;
                color: white;
                text-decoration: none;
            }
            .submenu a:hover {
                background-color: #003366;
            }
            .btn i {
                transition: transform 0.2s ease, color 0.2s ease;
            }
            .btn:hover i {
                transform: scale(1.2);
                color: #0d6efd; /* azul Bootstrap para resaltar */
            }
        </style>
    </head>
    <body>
        <!-- Topbar -->
        <div class="topbar fixed-top d-flex align-items-center">
            <span id="menuToggle">☰</span>
            <img src="../imagen/logo 3d vikid.png" alt="Logo">
            <h3 class="mb-0">Sistema de Ventas</h3>
            <!-- Menú de usuario a la derecha -->
            <div class="ms-auto dropdown">
                <a class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="bi bi-person-circle fs-4 me-1"></i>
                    <span class="fw-bold"><%= session.getAttribute("nombreAdmin") != null ? session.getAttribute("nombreAdmin") : "Admin"%></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="perfil.jsp">👤 Perfil</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="index.jsp">🚪 Cerrar sesión</a></li>
                </ul>
            </div>
        </div>
        <!-- Sidebar -->
        <div id="sidebar" class="sidebar">
            <!-- INICIO -->
            <a href="#" class="menu-link" data-target="submenuInicio">Inicio</a>
            <div id="submenuInicio" class="submenu">
                <a href="admin.jsp">Panel principal</a>
                <a href="perfil.jsp">Perfil</a>
            </div>

            <!-- PRODUCTO -->
            <a href="#" class="menu-link" data-target="submenuProducto">Producto</a>
            <div id="submenuProducto" class="submenu">
                <a href="registrarProducto.jsp">Nuevo Producto</a>
                <a href="admin.jsp">Listar Productos</a>
                <a href="categorias.jsp">Categorías</a>
            </div>

            <!-- INVENTARIO -->
            <a href="#" class="menu-link" data-target="submenuInventario">Inventario</a>
            <div id="submenuInventario" class="submenu">
                <a href="verInventario.jsp">Ver Inventario</a>
                <a href="agregarStock.jsp">Agregar Stock</a>
            </div>

            <!-- VENTAS -->
            <a href="#" class="menu-link" data-target="submenuVentas">Ventas</a>
            <div id="submenuVentas" class="submenu">
                <a href="nuevaVenta.jsp">Nueva Venta</a>
                <a href="historialVentas.jsp">Historial de Ventas</a>
            </div>

            <!-- MANTENIMIENTO -->
            <a href="#" class="menu-link" data-target="submenuMantenimiento">Mantenimiento</a>
            <div id="submenuMantenimiento" class="submenu">
                <a href="usuarios.jsp">Usuarios</a>
                <a href="clientes.jsp">Clientes</a>
                <a href="configuracion.jsp">Configuración</a>
            </div>

            <!-- SALIR -->
            <a href="#" class="menu-link" data-target="submenuSalir">Salir </a>
            <div id="submenuSalir" class="submenu">
                <a href="index.jsp">Cerrar sesión</a>
            </div>
        </div>

        <!-- Contenido -->
        <div id="mainContent" class="content">
            <h5>Lista de Productos</h5>

            <!-- Contenedor de herramientas -->
            <div class="d-flex flex-column flex-md-row align-items-center justify-content-between gap-3 mb-4">

                <!-- Buscador centrado y amplio -->
                <div class="w-100 d-flex justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <span class="input-group-text bg-light rounded-start-pill"><i class="bi bi-search"></i></span>
                        <input type="text" class="form-control rounded-end-pill" placeholder="Buscar producto..." id="buscarInput">
                    </div>
                </div>

                <!-- Botones separados y redondeados -->
                <div class="d-flex flex-wrap justify-content-center gap-2">
                    <button class="btn btn-success rounded-pill px-4" onclick="exportarExcel()">
                        📁 Exportar a Excel
                    </button>
                    <a href="registrarProducto.jsp" class="btn btn-primary rounded-pill px-4">
                        ➕ Nuevo Producto
                    </a>
                </div>
            </div>

            <!-- Tabla de productos -->
            <div class="table-responsive">
                <table id="tablaProductos" class="table table-bordered table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th><input type="checkbox" id="checkAll" onclick="toggleAll(this)"></th> <!-- Checkbox general -->
                            <th>ID</th>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Stock</th>
                            <th>Precio</th>
                            <th>Categoría</th>
                            <th>Marca</th>
                            <th>Unidad</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Ejemplo de producto -->
                        <tr>
                            <td><input type="checkbox" class="product-check" value="1"></td>
                            <td>1</td>
                            <td>PROD001</td>
                            <td>Jean Niña Azul</td>
                            <td>50</td>
                            <td>S/ 39.90</td>
                            <td>Ropa</td>
                            <td>FantasyKids</td>
                            <td>Unidad</td>
                            <td>
                                <div class="d-flex justify-content-center gap-2">
                                    <a href="verProducto.jsp?id=1" class="btn btn-sm btn-info rounded-pill px-2 py-1" title="Ver detalles">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                    <a href="editarProducto.jsp?id=1" class="btn btn-sm btn-warning rounded-pill px-2 py-1" title="Editar">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <button class="btn btn-sm btn-danger rounded-pill px-2 py-1" onclick="eliminarProducto(1)" title="Eliminar">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" class="product-check" value="1"></td>
                            <td>2</td>
                            <td>PROD002</td>
                            <td>polo niña azul</td>
                            <td>20</td>
                            <td>S/ 19.90</td>
                            <td>Ropa</td>
                            <td>FantasyKids</td>
                            <td>Unidad</td>
                            <td>
                                <div class="d-flex justify-content-center gap-2">
                                    <a href="verProducto.jsp?id=1" class="btn btn-sm btn-info rounded-pill px-2 py-1" title="Ver detalles">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                    <a href="editarProducto.jsp?id=1" class="btn btn-sm btn-warning rounded-pill px-2 py-1" title="Editar">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <button class="btn btn-sm btn-danger rounded-pill px-2 py-1" onclick="eliminarProducto(1)" title="Eliminar">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <!-- Aquí irán más productos dinámicamente -->
                    </tbody>
                </table>
            </div>
            <!-- Paginación -->
            <nav aria-label="Paginación de productos">
                <ul class="pagination justify-content-end mt-3">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Anterior</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Siguiente</a>
                    </li>
                </ul>
            </nav>
        </div>

        <script>
            const menuToggle = document.getElementById("menuToggle");
            const sidebar = document.getElementById("sidebar");
            const content = document.getElementById("mainContent");

            menuToggle.addEventListener("click", () => {
                sidebar.classList.toggle("hide");
                content.classList.toggle("full");
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
            function exportarExcel() {
                // Aquí llamas a tu backend o generas el Excel desde JS
                alert("Función para exportar a Excel");
            }
            function eliminarProducto(id) {
                if (confirm("¿Estás seguro de eliminar este producto?")) {
                    // Aquí va tu lógica de eliminación
                    alert("Producto con ID " + id + " eliminado (simulado).");
                }
            }
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
            function toggleAll(source) {
                const checkboxes = document.querySelectorAll('.product-check');
                checkboxes.forEach(cb => cb.checked = source.checked);
            }
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
        </script>
    </body>
</html>
