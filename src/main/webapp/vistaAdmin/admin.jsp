<%-- 
    Document   : admin
    Created on : 12 jun. 2025, 12:53:35 a. m.
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <title>Login Admin</title>
    </head>
    <body>

        <% String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
            <%= error%>
        </div>
        <% } %>


        <%
            String logoutMsg = request.getParameter("logout");
            if ("1".equals(logoutMsg)) {
        %>
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
            Sesión cerrada correctamente.
        </div>
        <%
            }
        %>
        <!-- Encabezado con logo -->
        <div class="bg-[#E6DAF0] px-4 py-4 flex justify-center items-center">
            <img src="../imagen/logo 3d vikid.png" alt="Logo de la Empresa" class="h-[60px]">
        </div>

        <!-- Formulario responsive centrado -->
        <div class="flex justify-center mt-10 px-4">
            <form id="loginForm" method="post" action="/SistemaVikids/vistaAdmin/LoginUsuarioAdmin" class="w-full max-w-md bg-white shadow-xl rounded-lg p-8">
                <h2 class="text-2xl font-semibold text-center mb-6">Iniciar Sesión</h2>

                <!-- Usuario -->
                <input type="text" id="txtusuario" name="username" placeholder="Ingrese Usuario" required
                       class="w-full mt-2 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-pink-400"/>
                <p id="errorUsuario" class="text-sm text-red-500 mt-1 hidden">Por favor, ingrese un usuario.</p>

                <!-- Contraseña -->
                <input type="password" id="txtclave" name="password" placeholder="Ingrese Clave" required
                       class="w-full mt-4 px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-pink-400"/>
                <p id="errorClave" class="text-sm text-red-500 mt-1 hidden">Por favor, ingrese su clave.</p>

                <!-- Recordarme -->
                <div class="flex items-center mt-4">
                    <input id="recordar" type="checkbox" name="recordar"
                           class="mr-2 h-4 w-4 text-pink-600 border-gray-300 rounded focus:ring-pink-500">
                    <label for="recordar" class="text-sm text-gray-700">Recordarme</label>
                </div>

                <!-- Botón animado con ícono -->
                <button type="submit"
                        class="w-full mt-6 flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white py-2 rounded transition-all duration-300">
                    <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" stroke-width="2"
                         viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M5 13l4 4L19 7"></path>
                    </svg>
                    Ingresar
                </button>

                <!-- Enlace -->
                <!--<div class="mt-4 text-left">
                    <a href="dashboard.jsp" class="text-blue-600 hover:underline text-sm">
                        ¿No tienes cuenta? Crear una
                    </a>
                </div>-->
            </form>
        </div>
        <script src="../JS/admin.js"></script>

    </body>
</html>
