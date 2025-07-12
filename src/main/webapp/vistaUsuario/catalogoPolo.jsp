<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.vikids.modelo.Producto" %>
<%
    List<Producto> productos = (List<Producto>) request.getAttribute("productos");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Catálogo Polos</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white text-gray-800">
    <%@include file="../includes/header.jsp" %>

    <!-- Productos Polos -->
    <div class="container mx-auto px-4 mt-10">
        <h2 class="text-3xl font-bold text-center mb-6 text-pink-600">Polos para Niñas</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6" id="productos">

            <% if (productos != null && !productos.isEmpty()) {
                for (Producto p : productos) {
                    if (p.getCategoria().equalsIgnoreCase("polos")) { %>
                        <div class="producto bg-white border rounded-lg shadow hover:shadow-md transition p-4" data-categoria="polos">
                            <img src="imagen/<%= p.getImagen() %>" alt="<%= p.getNombre() %>" class="w-full h-70 object-cover rounded-md mb-3">
                            <h2 class="titulo-prod text-lg font-semibold text-gray-800"><%= p.getNombre() %></h2>
                            <p class="precio-prod text-pink-600 font-bold text-sm mb-2">S/ <%= p.getPrecio() %></p>
                            <div class="flex justify-between mt-3">
                                <button onclick="agregarAlCarrito(); agregarDesdeProducto(this)"
                                        class="bg-orange-500 text-white px-3 py-1 rounded-full hover:bg-orange-600 text-sm">
                                    Agregar al carrito
                                </button>
                                <button onclick="abrirModalProducto('<%= p.getImagen() %>', '<%= p.getNombre() %>', 'S/.<%= p.getPrecio() %>')"
                                        class="bg-pink-500 text-white px-3 py-1 rounded-full hover:bg-pink-600 text-sm">
                                    Ver detalle
                                </button>
                            </div>
                        </div>
            <%      }
                }
            } else { %>
                <p class="text-center text-gray-500 col-span-full">No hay polos publicados aún.</p>
            <% } %>

        </div>
    </div>

    <%@include file="../includes/modalCarrito.jsp" %>
    <%@include file="../includes/footer.jsp" %>
    <%@include file="../includes/modalProducto.jsp" %>
    <script src="../JS/index.js"></script>
</body>
</html>

