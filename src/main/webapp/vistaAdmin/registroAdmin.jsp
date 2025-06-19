<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registro de Administrador</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-100">

        <div class="flex justify-center items-center min-h-screen">
            <form method="post" action="/SistemaVikids/RegistrarAdmin" class="bg-white p-8 rounded shadow-md w-full max-w-md">
                <h2 class="text-2xl font-semibold text-center mb-6 text-purple-700">Registrar Administrador</h2>

                <% String error = (String) request.getAttribute("error");
                if (error != null) {%>
                <div class="bg-red-100 border border-red-400 text-red-700 p-3 rounded mb-4">
                    <%= error%>
                </div>
                <% }%>

                <!-- Nombre -->
                <label class="block mb-2 text-sm text-gray-700">Nombre</label>
                <input type="text" name="nombre" required
                       class="w-full px-4 py-2 border border-gray-300 rounded mb-4 focus:outline-none focus:ring-2 focus:ring-purple-400" />

                <!-- Usuario -->
                <label class="block mb-2 text-sm text-gray-700">Usuario</label>
                <input type="text" name="usuario" required
                       class="w-full px-4 py-2 border border-gray-300 rounded mb-4 focus:outline-none focus:ring-2 focus:ring-purple-400" />

                <!-- Contraseña -->
                <label class="block mb-2 text-sm text-gray-700">Contraseña</label>
                <input type="password" name="password" required
                       class="w-full px-4 py-2 border border-gray-300 rounded mb-4 focus:outline-none focus:ring-2 focus:ring-purple-400" />

                <!-- Teléfono -->
                <label class="block mb-2 text-sm text-gray-700">Teléfono</label>
                <input type="text" name="telefono" required
                       class="w-full px-4 py-2 border border-gray-300 rounded mb-6 focus:outline-none focus:ring-2 focus:ring-purple-400" />

                <!-- Botón -->
                <button type="submit"
                        class="w-full bg-purple-600 text-white py-2 rounded hover:bg-purple-700 transition">
                    Registrar
                </button>
            </form>
        </div>

    </body>
</html>
