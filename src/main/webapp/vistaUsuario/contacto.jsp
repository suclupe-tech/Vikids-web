<%-- 
    Document   : contacto
    Created on : 11 jun. 2025, 1:45:01 a. m.
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Lógica sencilla para mostrar mensaje después de enviar
    String mensaje = null;
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String comentario = request.getParameter("comentario");

        // Aquí podrías guardar en base de datos si lo deseas

        mensaje = "¡Gracias por contactarnos, " + nombre + "! Te responderemos pronto.";
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contacto/Vikids</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-white text-gray-800">
        <%@ include file="../includes/header.jsp" %>

        <main class="max-w-lg mx-auto px-4 py-12">
            <h1 class="text-3xl font-bold text-center text-pink-600 mb-8">Contáctanos</h1>
            <% if (mensaje != null) { %>
            <div class="bg-green-100 text-green-800 border border-green-300 rounded-md px-4 py-3 mb-6 text-center">
                <%= mensaje %>
            </div>
            <% } %>

            <form action="#" method="post" class="bg-white shadow-2xl rounded-lg p-6 space-y-6">
                <div>
                    <label for="nombre" class="block text-sm font-medium text-gray-700 mb-1">Nombre</label>
                    <input type="text" id="nombre" name="nombre" required
                           class="w-full border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-pink-400" />
                </div>

                <div>
                    <label for="correo" class="block text-sm font-medium text-gray-700 mb-1">Correo electrónico</label>
                    <input type="email" id="correo" name="correo" required
                           class="w-full border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-pink-400" />
                </div>

                <div>
                    <label for="telefono" class="block text-sm font-medium text-gray-700 mb-1">Teléfono</label>
                    <input type="tel" id="telefono" name="telefono"
                           class="w-full border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-pink-400" />
                </div>

                <div>
                    <label for="comentario" class="block text-sm font-medium text-gray-700 mb-1">Comentario</label>
                    <textarea id="comentario" name="comentario" rows="4" required
                              class="w-full border border-gray-300 rounded-md px-4 py-2 focus:outline-none focus:ring-2 focus:ring-pink-400"></textarea>
                </div>

                <div class="text-center">
                    <button type="submit"
                            class="bg-pink-500 hover:bg-pink-600 text-white font-semibold px-6 py-2 rounded-md transition duration-300">
                        Enviar mensaje
                    </button>
                </div>
            </form>
        </main>

            <%@ include file="../includes/footer.jsp" %>
            <%@include file="../includes/modalCarrito.jsp" %>
        
    </body>
</html>
