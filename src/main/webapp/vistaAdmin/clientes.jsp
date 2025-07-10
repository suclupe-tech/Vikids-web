
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.mycompany.vikids.modelo.Cliente" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>

        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/>
    </head>
    <body class="bg-gray-100 p-8">

        <%@include file="../includes/adminPrincipal.jsp" %>

        <div id="mainContent" class="max-w-7xl mx-auto bg-white p-6 rounded-xl shadow-lg ml-64 mt-20 p-6">
            <h2 class="text-2xl font-semibold mb-4 text-gray-700">Lista de Clientes</h2>

            <div class="flex justify-between items-center mb-4">
                <!-- Campo de búsqueda personalizado (opcional si usas DataTables) -->
                <input type="text" id="buscarCliente" placeholder="Buscar cliente..." 
                       class="px-3 py-2 border border-gray-300 rounded-lg shadow-sm w-1/2 focus:outline-none focus:ring focus:border-blue-400" />

                <!-- Botón para registrar nuevo cliente -->
                <a href="vistaAdmin/registrarCliente.jsp"
                   class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 shadow inline-flex items-center">
                    <i class="bi bi-person-plus-fill mr-2"></i> Nuevo Cliente
                </a>
            </div>

            <div class="overflow-x-auto">
                <table id="tablaClientes" class="stripe hover w-full text-sm text-center">
                    <thead class="bg-gray-200">
                        <tr>
                            <th class="py-2">Nombre</th>
                            <th>Apellido</th>
                            <th>DNI</th>
                            <th>Teléfono</th>
                            <th>Dirección</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
                            if (clientes != null) {
                                for (Cliente c : clientes) {
                        %>
                        <tr class="hover:bg-gray-50">
                            <td><%= c.getNombre()%></td>
                            <td><%= c.getApellido()%></td>
                            <td><%= c.getDni()%></td>
                            <td><%= c.getTelefono()%></td>
                            <td><%= c.getDireccion()%></td>
                            <td class="flex items-center justify-center gap-2 py-2">
                                <!-- Botón editar -->
                                <a href="EditarCliente?id=<%= c.getId()%>" class="text-blue-600 hover:text-blue-800" title="Editar">
                                    <i class="bi bi-pencil-square text-lg"></i>
                                </a>
                                <!-- Botón eliminar -->
                                <a href="EliminarCliente?id=<%= c.getId()%>"
                                   onclick="return confirm('¿Seguro que deseas eliminar este cliente?')"
                                   class="text-red-600 hover:text-red-800" title="Eliminar">
                                    <i class="bi bi-trash text-lg"></i>
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="<%= context%>/JS/sidebar.js"></script>
        <script src="<%= context%>/JS/menuUsuario.js"></script>
        <script src="<%= context%>/JS/dasboard.js"></script>
        <script src="<%= context%>/JS/buscadorCliente.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/datatable-init.js"></script>

    </body>
</html>
