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
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">


    </head>
    <body>

        <%@include file="../CODIGO-REUTILIZABLE/adminPrincipal.jsp" %>
        <!-- Contenido principal -->
        <div id="mainContent" class="ml-64 mt-20 p-6">
            <h5 class="text-2xl font-semibold mb-4">Lista de Productos</h5>

            <!-- Barra de herramientas -->
            <div class="flex flex-col md:flex-row items-center justify-between gap-4 mb-6">
                <!-- Buscador -->
                <div class="w-full max-w-xl">
                    <div class="flex items-center bg-white border rounded-full shadow px-3 py-2">
                        <i class="bi bi-search text-gray-500 mr-2"></i>
                        <input type="text" id="buscarInput" placeholder="Buscar producto..." class="w-full outline-none"/>
                    </div>
                </div>

                <!-- Botones -->
                <div class="flex flex-wrap gap-2">
                    <button onclick="exportarExcel()" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-full shadow">📁 Exportar a Excel</button>
                    <a href="registrarProducto.jsp" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-full shadow">➕ Nuevo Producto</a>
                </div>
            </div>

            <!-- Tabla -->
            <div class="w-full overflow-x-auto px-4 max-w-screen-2xl mx-auto">
                <table class="w-full table-auto border text-center text-base">
                    <thead class="bg-gray-800 text-white">
                        <tr>
                            <th class="px-4 py-3"><input type="checkbox" id="checkAll" onclick="toggleAll(this)"></th>
                            <th class="px-4 py-3">ID</th>
                            <th class="px-4 py-3">Código</th>
                            <th class="px-4 py-3">Nombre</th>
                            <th class="px-4 py-3">Stock</th>
                            <th class="px-4 py-3">Precio</th>
                            <th class="px-4 py-3">Categoría</th>
                            <th class="px-4 py-3">Marca</th>
                            <th class="px-4 py-3">Unidad</th>
                            <th class="px-4 py-3">Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="hover:bg-gray-100">
                            <td class="px-4 py-3"><input type="checkbox" class="product-check" value="1"></td>
                            <td class="px-4 py-3">1</td>
                            <td class="px-4 py-3">PROD001</td>
                            <td class="px-4 py-3">Jean Niña Azul</td>
                            <td class="px-4 py-3">50</td>
                            <td class="px-4 py-3">S/ 39.90</td>
                            <td class="px-4 py-3">Ropa</td>
                            <td class="px-4 py-3">FantasyKids</td>
                            <td class="px-4 py-3">Unidad</td>
                            <td class="px-4 py-3">
                                <div class="flex justify-center gap-2">
                                    <a href="verProducto.jsp?id=1" class="text-lg hover:text-blue-600">👁️</a>
                                    <a href="editarProducto.jsp?id=1" class="text-lg hover:text-yellow-600">✏️</a>
                                    <button onclick="eliminarProducto(1)" class="text-lg hover:text-red-600">🗑️</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>


            <!-- Paginación -->
            <div class="mt-6 flex justify-end">
                <ul class="inline-flex items-center -space-x-px text-sm">
                    <li><a href="#" class="px-3 py-2 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg">Anterior</a></li>
                    <li><a href="#" class="px-3 py-2 leading-tight text-white bg-blue-600 border border-gray-300">1</a></li>
                    <li><a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300">2</a></li>
                    <li><a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300">3</a></li>
                    <li><a href="#" class="px-3 py-2 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg">Siguiente</a></li>
                </ul>
            </div>
        </div>

        <script src="../JS/dasboard.js"></script>
    </body>
</html>
