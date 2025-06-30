<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registro de Administrador</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/toast.css"/>
    </head>
    <body class="bg-gradient-to-br from-purple-100 to-white min-h-screen flex items-center justify-center">
        <%@include file="../includes/adminPrincipal.jsp" %>
        <div class="bg-white shadow-xl rounded-2xl p-8 w-full max-w-lg border border-gray-200">
            <h2 class="text-3xl font-bold text-center text-purple-700 mb-6">Registrar Administrador</h2>

            <% String error = (String) request.getAttribute("error");
                if (error != null) {%>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-2 rounded mb-4 text-sm">
                <%= error%>
            </div>
            <% }%>

            <form action="/SistemaVikids/RegistrarAdmin" method="post" class="space-y-5">

                <!-- Nombre -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Nombre <span class="text-red-500">*</span></label>
                    <input type="text" name="nombre" required
                           class="mt-1 w-full px-4 py-2 border rounded-lg shadow-sm focus:ring-2 focus:ring-purple-400 focus:outline-none border-gray-300"/>
                </div>

                <!-- Usuario -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Usuario <span class="text-red-500">*</span></label>
                    <input type="text" name="usuario" required
                           class="mt-1 w-full px-4 py-2 border rounded-lg shadow-sm focus:ring-2 focus:ring-purple-400 focus:outline-none border-gray-300"/>
                </div>

                <!-- Contraseña -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Contraseña <span class="text-red-500">*</span></label>
                    <input type="password" name="password" required
                           class="mt-1 w-full px-4 py-2 border rounded-lg shadow-sm focus:ring-2 focus:ring-purple-400 focus:outline-none border-gray-300"/>
                </div>

                <!-- Teléfono -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Teléfono <span class="text-red-500">*</span></label>
                    <input type="text" name="telefono" required
                           class="mt-1 w-full px-4 py-2 border rounded-lg shadow-sm focus:ring-2 focus:ring-purple-400 focus:outline-none border-gray-300"/>
                </div>

                <!-- Estado -->
                <div>
                    <label class="block text-sm font-medium text-gray-700">Estado</label>
                    <select name="estado"
                            class="mt-1 w-full px-4 py-2 border rounded-lg shadow-sm focus:ring-2 focus:ring-purple-400 focus:outline-none border-gray-300">
                        <option value="1" selected>Activo</option>
                        <option value="0">Inactivo</option>
                    </select>
                </div>

                <!-- Botón -->
                <div>
                    <button type="submit"
                            class="w-full bg-purple-600 hover:bg-purple-700 text-white font-semibold py-2 px-4 rounded-lg shadow transition duration-300">
                        Registrar
                    </button>
                </div>
            </form>
        </div>
        <script src="../JS/toastUsuario.js"></script>
        <script src="../JS/dasboard.js"></script>
        <script src="../JS/menuUsuario.js"></script>

    </body>
    <% String mensaje = (String) request.getAttribute("mensaje"); %>

    <% if (mensaje != null) {%>
    <div id="toast"
         class="fixed top-5 right-5 bg-green-500 text-white px-6 py-3 rounded-lg shadow-lg z-50 transition-opacity duration-300 animate-fade-in">
        <%= mensaje%>
    </div>
    <% }%>
</html>
