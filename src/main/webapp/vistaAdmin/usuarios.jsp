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
        <div id="mainContent" class="ml-64 mt-20 p-6">
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

            <table class="min-w-full table-auto text-left border">
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
                <tbody id="tablaUsuarios">
                    <%
                        List<UsuarioAdmin> listUsuario = (List< UsuarioAdmin>) request.getAttribute("listUsuario");
                        if (listUsuario != null) {
                            for (UsuarioAdmin u : listUsuario) {
                    %>
                    <tr class="border-t hover:bg-gray-50">
                        <td class="p-2"><%= u.getId()%></td>
                        <td class="p-2"><%= u.getNombre()%></td>
                        <td class="p-2"><%= u.getApellido()%></td>
                        <td class="p-2"><%= u.getUsuario()%></td>
                        <td class="p-2"><%= u.getTelefono()%></td>
                        <td class="p-2"><%= u.getActivo() == 1 ? "Activo" : "Inactivo"%>
                        </td>
                        <td class="p-2">
                            <a href="EditarUsuarioAdmin?id=<%= u.getId()%>" class="text-blue-500 hover:underline">Editar</a> |
                            <a href="EliminarUsuarioAdmin?id=<%= u.getId()%>" class="text-red-500 hover:underline" onclick="return confirm('¿Eliminar este usuario?')">Eliminar</a>
                            
                            
                            <% if (u.getActivo() == 1) {%>
                            <a href="DesactivarUsuario?id=<%= u.getId()%>" class="text-yellow-500 hover:underline"
                               onclick="return confirm('¿Deseas desactivar este usuario?')">Desactivar</a>
                            <% } else {%>
                            <a href="ActivarUsuario?id=<%= u.getId()%>" class="text-green-500 hover:underline"
                               onclick="return confirm('¿Deseas activar este usuario?')">Activar</a>
                            <% } %>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr><td colspan="6" class="text-center text-red-600">⚠️ No se pudo cargar la lista de usuarios.</td></tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <script src="../JS/usuarios.js"></script>
        <script src="../JS/dasboard.js"></script>
        <script src="../JS/sidebar.js"></script>
        <script src="../JS/menuUsuario.js"></script>
    </body>
</html>
