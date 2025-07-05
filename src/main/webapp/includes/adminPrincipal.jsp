

<!-- Topbar -->
<div class="fixed top-0 left-0 right-0 bg-[#E0BBE4] text-white flex items-center px-4 py-2 shadow z-50">
    <span id="menuToggle" class="text-black text-3xl cursor-pointer mr-4">
        <img src="../imagen/menu.png" alt="menu" class="h-10 mr-4"/>
    </span>
    <img src="../imagen/logo 3d vikid.png" alt="Logo" class="h-14 mr-4">
    <h2 class="text-black text-2xl font-semibold">Sistema de Ventas</h2>

    <div class="relative ml-auto">
        <button id="adminButton" class="flex items-center font-bold">
            <i class="bi bi-person-circle text-2xl mr-1 text-black"></i>
            <span class="text-black"><%= (session.getAttribute("usuario") != null) ? session.getAttribute("usuario") : "Administrador"%></span>
        </button>

        <!-- Menú -->
        <ul 
            id="adminMenu"
            class="absolute right-0 mt-2 w-40 bg-white text-black rounded shadow-md z-50 hidden"
            >
            <li>
                <a class="block px-4 py-2 hover:bg-gray-100" href="perfil.jsp">
                    <img src="../imagen/usuario (1).png" alt="usuario" class="h-5 mr-4" />
                    Perfil
                </a>
            </li>
            <li><hr class="border-gray-200 my-1"></li>
            <li>
                <a class="block px-4 py-2 hover:bg-gray-100" href="<%= request.getContextPath()%>/LogoutServlet">
                    <img src="../imagen/cerrar-sesion.png" alt="alt" class="h-5 mr-4"/>
                    Cerrar Sesion
                </a>
            </li>
        </ul>
    </div>
</div>

<!-- Sidebar -->
<aside id="sidebar" class="fixed top-14 left-0 w-64 bg-gray-800 text-white h-full p-4 space-y-2 z-40 transform translate-x-0 transition-transform duration-300">
    
    <!-- ejemplo de submenú -->
    
    <!-- Inicio -->
    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuInicio">
        <i class="bi bi-house-door mr-2"></i>Inicio</a>
    <div id="submenuInicio" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="dashboard.jsp" class="block hover:bg-gray-700 text-blue-400"><i class="bi bi-grid mr-2"></i>Panel principal</a>
        <a href="#" class="block hover:bg-gray-700 text-blue-400"><i class="bi bi-person-fill mr-2"></i>Perfil</a>
    </div>
    
<!-- Producto -->
    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuProducto">
        <i class="bi bi-box-seam mr-2"></i>Producto</a>
    <div id="submenuProducto" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="registrarProducto.jsp" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-plus-circle mr-2"></i>Nuevo Producto</a>
        <a href="../vistaAdmin/dashboard.jsp" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-box-seam mr-2"></i>Listar Productos</a>
        <a href="../vistaAdmin/productosInactivos.jsp"
           class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-box-seam mr-2"></i> Productos Inactivos
        </a>

        <a href="categorias.jsp" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-folder2-open mr-2"></i>Categorías</a>
    </div>
           
<!-- Inventario -->
    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuInventario">
        <i class="bi bi-boxes mr-2"></i>Inventario</a>
    <div id="submenuInventario" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="verInventario.jsp" class="block hover:bg-gray-700 text-blue-400 ">
            <i class="bi bi-box-seam mr-2"></i>Ver Inventario</a>
        <a href="agregarStock.jsp" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-boxes mr-2"></i>Agregar Stock</a>
    </div>

<!-- Ventas -->
    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuVentas">
        <i class="bi bi-cart-check mr-2"></i>Ventas</a>
    <div id="submenuVentas" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="../vistaAdmin/nuevaVenta.jsp" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-plus-circle mr-2"></i>Nueva Venta</a>
        <a href="../vistaAdmin/historialVentas.jsp" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-clock-history mr-2"></i>Historial de Ventas</a>
    </div>

<!-- Mantenimiento -->
    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuMantenimiento">
        <i class="bi bi-tools mr-2"></i>Mantenimiento</a>
    <div id="submenuMantenimiento" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="usuarios.jsp" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-person mr-2"></i>Usuarios</a>
        <a href="ListarUsuariosAdmin" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-people mr-2"></i>Clientes</a>
        <a href="configuracion.jsp" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-gear mr-2"></i>Configuración</a>
    </div>

<!-- Cerrar Sesion -->
    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuSalir">
        <i class="bi bi-box-arrow-right mr-2"></i>Salir</a>
    <div id="submenuSalir" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="index.jsp" class="block hover:bg-gray-700 text-blue-400">
            <i class="bi bi-box-arrow-right mr-2"></i>Cerrar sesión</a>
    </div>
</aside>