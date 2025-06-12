<!-- Topbar -->
<div class="fixed top-0 left-0 right-0 bg-[#E0BBE4] text-white flex items-center px-4 py-2 shadow z-50">
    <span id="menuToggle" class="text-black text-3xl cursor-pointer mr-4">
        <img src="../imagen/menu.png" alt="menu" class="h-10 mr-4"/>
    </span>
    <img src="../imagen/logo 3d vikid.png" alt="Logo" class="h-14 mr-4">
    <h2 class="text-black text-2xl font-semibold">Sistema de Ventas</h2>
    <div x-data="{ open: false }" class="relative ml-auto">
        <button @click="open = !open" class="flex items-center font-bold">
            <i class="bi bi-person-circle text-2xl mr-1"></i>
            <span>Admin</span>
        </button>

        <!-- Menú -->
        <ul 
            x-show="open"
            @click.away="open = false"
            x-transition
            class="absolute right-0 mt-2 w-40 bg-white text-black rounded shadow-md z-50"
            style="display: none;"
            >
            <li><a class="block px-4 py-2 hover:bg-gray-100" href="perfil.jsp">
                    <img src="../imagen/usuario (1).png" alt="usuario" class="h-5 mr-4" />
                    Perfil
                </a></li>
            <li><hr class="border-gray-200 my-1"></li>
            <li><a class="block px-4 py-2 hover:bg-gray-100" href="index.jsp">
                    <img src="../imagen/cerrar-sesion.png" alt="alt" class="h-5 mr-4"/>
                    Cerrar Sesion
                </a></li>
        </ul>
    </div>


</div>

<!-- Sidebar -->
<aside id="sidebar" class="fixed top-14 left-0 w-64 bg-gray-800 text-white h-full p-4 space-y-2 z-40">
    <!-- ejemplo de submenú -->
    <a href="#" class="block px-4 py-2 font-semibold hover:bg-gray-700 transition-all" data-target="submenuInicio">Inicio</a>
    <div id="submenuInicio" class="pl-4 max-h-0 overflow-hidden transition-all duration-300 ease-in-out">
        <a href="admin.jsp" class="block py-1 hover:text-blue-600 text-blue-400">Panel principal</a>
        <a href="perfil.jsp" class="block py-1 hover:text-blue-600 text-blue-400">Perfil</a>
    </div>

    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuProducto">Producto</a>
    <div id="submenuProducto" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="registrarProducto.jsp" class="block hover:bg-gray-700 text-blue-400">Nuevo Producto</a>
        <a href="../ADMIN/dashboard.jsp" class="block hover:bg-gray-700 text-blue-400">Listar Productos</a>
        <a href="categorias.jsp" class="block hover:bg-gray-700 text-blue-400">Categorías</a>
    </div>

    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuInventario">Inventario</a>
    <div id="submenuInventario" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="verInventario.jsp" class="block hover:bg-gray-700 text-blue-400">Ver Inventario</a>
        <a href="agregarStock.jsp" class="block hover:bg-gray-700 text-blue-400">Agregar Stock</a>
    </div>

    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuVentas">Ventas</a>
    <div id="submenuVentas" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="nuevaVenta.jsp" class="block hover:bg-gray-700 text-blue-400">Nueva Venta</a>
        <a href="historialVentas.jsp" class="block hover:bg-gray-700 text-blue-400">Historial de Ventas</a>
    </div>

    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuMantenimiento">Mantenimiento</a>
    <div id="submenuMantenimiento" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="usuarios.jsp" class="block hover:bg-gray-700 text-blue-400">Usuarios</a>
        <a href="clientes.jsp" class="block hover:bg-gray-700 text-blue-400">Clientes</a>
        <a href="configuracion.jsp" class="block hover:bg-gray-700 text-blue-400">Configuración</a>
    </div>

    <a href="#" class="block py-2 px-4 hover:bg-gray-700 rounded menu-link" data-target="submenuSalir">Salir</a>
    <div id="submenuSalir" class="submenu ml-4 space-y-2 hidden transition-all duration-300">
        <a href="index.jsp" class="block hover:bg-gray-700 text-blue-400">Cerrar sesión</a>
    </div>
</aside>