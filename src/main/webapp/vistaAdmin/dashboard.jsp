<%-- 
    Document   : admin
    Created on : 1 jun. 2025, 1:18:51 a. m.
    Author     : USER
--%>

<%@page import="com.mycompany.vikids.dao.impl.ProductoDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.mycompany.vikids.dao.impl.ProductoDAOImpl" %>
<%@page import="com.mycompany.vikids.modelo.Producto" %>
<%@page import="com.mycompany.vikids.util.conexionSQL" %>
<%@page import="java.util.List" %>

<%HttpSession sesion = request.getSession(false);
    String usuario = (sesion != null) ? (String) sesion.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
%>

<%
    ProductoDAOImpl dao = new ProductoDAOImpl(conexionSQL.conectar());
    List<Producto> lista = dao.listarTodos();
%>

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

        <%@include file="../includes/adminPrincipal.jsp" %>
        <!-- Contenido principal -->
        <div id="mainContent" class="max-w-7xl mx-auto bg-white p-6 rounded-xl shadow-lg ml-64 mt-20 p-6">
            <h5 class="text-2xl font-semibold mb-4">Lista de Productos</h5>
            <h3 class="text-xl font-semibold mb-2">Bienvenido, <%= usuario%> 👋</h3>

            <!-- Barra de herramientas -->
            <div class="flex flex-col md:flex-row items-center justify-between gap-4 mb-6">
                <!-- Buscador -->
                <div class="w-full max-w-xl">
                    <div class="flex items-center bg-white border rounded-full shadow px-3 py-2">
                        <i class="bi bi-search text-gray-500 mr-2"></i>
                        <input type="text" id="buscador" placeholder="Buscar producto..." class="w-full outline-none"/>
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
                <table  id="tablaProductos" class="w-full table-auto border text-center text-base">
                    <thead class="bg-gray-800 text-white">
                        <tr>
                            <th class="px-4 py-3"><input type="checkbox" id="checkAll" onclick="toggleAll(this)"></th>
                            <th class="px-4 py-3">Código</th>
                            <th class="px-4 py-3">Nombre</th>
                            <th class="px-4 py-3">Descripción</th>
                            <th class="px-4 py-3">Stock</th>
                            <th class="px-4 py-3">Precio</th>
                            <th class="px-4 py-3">Categoría</th>
                            <th class="px-4 py-3">Marca</th>
                            <th class="px-4 py-3">Unidad</th>
                            <th class="px-4 py-3">Imagen</th>
                            <th class="px-4 py-3">Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Producto p : lista) {%>
                        <tr class="hover:bg-gray-100">
                            <td class="px-4 py-3"><input type="checkbox" class="product-check" value="1"></td>
                            <td class="px-4 py-3"><%=p.getCodigo()%></td>
                            <td class="px-4 py-3"><%=p.getNombre()%></td>
                            <td class="px-4 py-3"><%=p.getDescripcion()%></td>
                            <td class="px-4 py-3"><%=p.getStock()%></td>
                            <td class="px-4 py-3">S/.<%=p.getPrecio()%></td>
                            <td class="px-4 py-3"><%=p.getCategoria()%></td>
                            <td class="px-4 py-3"><%=p.getMarca()%></td>
                            <td class="px-4 py-3"><%=p.getUnidad()%></td>
                            <td class="px-4 py-3">
                                <img src="../imagen/<%=p.getImagen()%>" class="w-10 h-10 object-contain mx-auto rounded shadow" alt="Imagen del producto"/>
                            </td>
                            <td class="px-4 py-3">
                                <div class="flex justify-center gap-2">
                                    <a href="verProducto.jsp?id=1" class="text-lg hover:text-blue-600"><i class="bi bi-eye mr-2"></i>️</a>
                                    <a href="editarProducto.jsp?id=1" class="text-lg hover:text-yellow-600"><i class="bi bi-pencil-square mr-2"></i>️</a>
                                    <a href="DesactivarProducto?codigo=<%=p.getCodigo()%>" onclick="return confirm('¿Estás seguro de desactivar este producto?')" class="text-lg hover:text-red-600">🚫</a>
                                </div>
                            </td>
                        </tr>
                        <%}%>
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

        <script src="<%= context%>/JS/dasboard.js"></script>
        <script src="<%= context%>/JS/menuUsuario.js"></script>
        <script src="<%= context%>/JS/sidebar.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/datatable-init.js"></script>
    </body>
</html>
