<%-- 
    Document   : usuarios
    Created on : 29 jun. 2025, 8:42:18 p. m.
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.mycompany.vikids.modelo.UsuarioAdmin" %>
<%
    List<UsuarioAdmin> listUsuario = (List < UsuarioAdmin >) request.getAttribute("usuarios");
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Usuarios</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100 p-8">
        <%@include file="../includes/adminPrincipal.jsp" %>
    <div class="max-w-6xl mx-auto bg-white p-6 rounded shadow">
        <h1 class="text-2xl font-bold mb-4">Usuarios Administradores</h1>

        <input type="text" id="busqueda" placeholder="Buscar por nombre..." 
               class="border border-gray-300 p-2 rounded mb-4 w-full" onkeyup="filtrarUsuarios()">

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
            <% for (UsuarioAdmin u : listUsuario) { %>
                <tr class="border-t hover:bg-gray-50">
                    <td class="p-2"><%= u.getId() %></td>
                    <td class="p-2"><%= u.getNombre() %></td>
                    <td class="p-2"><%= u.getApellido() %></td>
                    <td class="p-2"><%= u.getUsuario() %></td>
                    <td class="p-2"><%= u.getTelefono() %></td>
                    <td class="p-2">
                        <a href="EditarUsuarioAdmin?id=<%= u.getId() %>" class="text-blue-500 hover:underline">Editar</a> |
                        <a href="EliminarUsuarioAdmin?id=<%= u.getId() %>" class="text-red-500 hover:underline" onclick="return confirm('¿Eliminar este usuario?')">Eliminar</a>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
    </div>
            <script src="../JS/usuarios.js"></script>
    </body>
</html>
