<%-- 
    Document   : usuarios
    Created on : 29 jun. 2025, 8:42:18 p. m.
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.mycompany.vikids.modelo.UsuarioAdmin" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Usuarios</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 p-8">
        <%@include file="../includes/adminPrincipal.jsp" %>
        <div id="mainContent" class="max-w-7xl mx-auto bg-white p-6 rounded-xl shadow-lg ml-64 mt-20 p-6">
            <h1 class="text-2xl font-bold mb-4">Usuarios Administradores</h1>

            <!-- Campo de búsqueda -->
            <div class="flex justify-between items-center mb-4">
                <input type="text" id="busqueda" placeholder="Buscar por nombre..." 
                       class="border border-gray-300 p-2 rounded w-full max-w-md" onkeyup="filtrarUsuarios()">

                <a href="<%= request.getContextPath()%>/vistaAdmin/registroAdmin.jsp" 
                   class="ml-4 bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-4 rounded transition">
                    <i class="bi bi-person-plus-fill"></i> Crear Usuario
                </a>
            </div>

            <table id="tablaUsuarios" class="min-w-full table-auto text-left border">
                <thead>
                    <tr class="bg-gray-200 text-gray-700">
                        <th class="p-2">ID</th>
                        <th class="p-2">Nombre</th>
                        <th class="p-2">Apellido</th>
                        <th class="p-2">Usuario</th>
                        <th class="p-2">Teléfono</th>
                        <th class="p-2">Acciones</th>
                    </tr>
                </thead>
                <tbody >
                    <%
                        List<UsuarioAdmin> listUsuario = (List< UsuarioAdmin>) request.getAttribute("listUsuario");
                        if (listUsuario != null && !listUsuario.isEmpty()) {
                            for (UsuarioAdmin u : listUsuario) {
                    %>
                    <tr class="border-t hover:bg-gray-50">
                        <td class="p-2"><%= u.getId()%></td>
                        <td class="p-2"><%= u.getNombre()%></td>
                        <td class="p-2"><%= u.getApellido()%></td>
                        <td class="p-2"><%= u.getUsuario()%></td>
                        <td class="p-2"><%= u.getTelefono()%></td>
                        <td class="p-2 space-x-2">
                            <a href="EditarUsuarioAdmin?id=<%= u.getId()%>" 
                               class="text-blue-500 hover:text-blue-700" 
                               title="Editar">
                                <i class="bi bi-pencil-square"></i>
                            </a>
                            <a href="EliminarUsuarioAdmin?id=<%= u.getId()%>" 
                               class="text-red-500 hover:text-red-700" 
                               onclick="return confirm('¿Eliminar este usuario?')" 
                               title="Eliminar">
                                <i class="bi bi-trash"></i>
                            </a>
                        </td>

                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr><td colspan="6" class="text-center text-yellow-600">⚠️ No hay usuarios registrados aún.</td></tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <!-- JS del sistema -->
        <script src="<%= context%>/JS/usuarios.js"></script>
        <script src="<%= context%>/JS/sidebar.js"></script>
        <script src="<%= context%>/JS/menuUsuario.js"></script>
        <script src="<%= context%>/JS/dasboard.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/datatable-init.js"></script>

    </body>
</html>
