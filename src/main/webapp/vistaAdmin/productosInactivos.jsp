

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.vikids.modelo.Producto" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos Inactivos</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>

    </head>
    <body class="bg-gray-100">

        <%@include file="../includes/adminPrincipal.jsp" %>

        <!-- ✅ CONTENIDO PRINCIPAL -->
        <div id="mainContent" class="ml-64 mt-20 p-6">
            <h2 class="text-2xl font-semibold mb-4">Productos Inactivos</h2>
            <div class="overflow-x-auto bg-white rounded-lg shadow">
                <table class="min-w-full table-auto text-center">
                    <thead class="bg-gray-800 text-white">
                        <tr>
                            <th class="px-4 py-2">ID</th>
                            <th class="px-4 py-2">Nombre</th>
                            <th class="px-4 py-2">Categoría</th>
                            <th class="px-4 py-2">Acción</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            List<Producto> listaInactivos = (List<Producto>) request.getAttribute("listaInactivos");
                            if (listaInactivos != null && !listaInactivos.isEmpty()) {
                                for (Producto p : listaInactivos) {
                        %>
                        <tr class="border-b hover:bg-gray-100">
                            <td class="px-4 py-2"><%= p.getId()%></td>
                            <td class="px-4 py-2"><%= p.getNombre()%></td>
                            <td class="px-4 py-2"><%= p.getCategoria()%></td>
                            <td class="px-4 py-2">
                                <form method="post" action="../../ReactivarProducto">
                                    <input type="hidden" name="codigo" value="<%= p.getCodigo()%>"/>
                                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-4 py-1 rounded shadow-md transition duration-200">
                                        <i class="bi bi-arrow-counterclockwise mr-1"></i> Reactivar
                                    </button>

                                </form>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="4" class="text-center py-4 text-gray-500">No hay productos inactivos.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- ✅ SCRIPT para ocultar el toast -->
        <script src="../JS/toast.js"></script>
        <script src="../JS/dasboard.js"></script>
        <script src="../JS/sidebar.js"></script>

    </body>
    <!-- ✅ TOAST SI REACTIVADO -->
    <% if (request.getParameter("reactivado") != null) { %>
    <div id="toast"
         class="fixed top-6 right-6 bg-green-600 text-white px-6 py-3 rounded-lg shadow-lg flex items-center gap-3 transition transform duration-300 ease-out translate-y-0 opacity-100 z-50">
        <i class="bi bi-check-circle-fill text-xl"></i>
        <span>Producto reactivado exitosamente</span>
    </div>
    <% }%>
</html>