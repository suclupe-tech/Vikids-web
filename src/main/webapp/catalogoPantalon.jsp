
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CatalogoPantalones</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-white text-gray-800">
        <%@include file="CODIGO-REUTILIZABLE/header.jsp" %>

        <!-- Productos pantalon-->
        <div class="container mx-auto px-4 mt-10">
            <h2 class="text-3xl font-bold text-center mb-6 text-pink-600">Pantalón Niña</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6" id="productos">
                <!-- Ejemplo producto -->
                <div class="producto bg-white border rounded-lg shadow hover:shadow-md transition p-4" data-categoria="pantalones">
                    <img src="imagen/alb1.jpg" alt="Pantalón" class="w-full h-70 object-cover rounded-md mb-3">
                    <h2 class="titulo-prod text-lg font-semibold text-gray-800">Pantalón Niña Azul</h2>
                    <p class="precio-prod text-pink-600 font-bold text-sm mb-2">S/ 39.90</p>
                    <div class="flex justify-between mt-3">
                        <button onclick="agregarAlCarrito(); agregarDesdeProducto(this)"
                                class="bg-orange-500 text-white px-3 py-1 rounded-full hover:bg-orange-600 text-sm">
                            Agregar al carrito
                        </button>
                        <button onclick="abrirModalProducto('alb1.jpg', 'Pantalon niña azul', 'S/.39.90')"
                                class="bg-pink-500 text-white px-3 py-1 rounded-full hover:bg-pink-600 text-sm">
                            Ver detalle
                        </button>
                    </div>
                </div>

                <div class="producto bg-white border rounded-lg shadow hover:shadow-md transition p-4" data-categoria="polos">
                    <img src="imagen/alb2.jpg" alt="Polo" class="w-full h-70 object-cover rounded-md mb-3">
                    <h2 class="titulo-prod text-lg font-semibold text-gray-800">Polo Rosado</h2>
                    <p class="precio-prod text-pink-600 font-bold text-sm mb-2">S/ 24.90</p>
                    <div class="flex justify-between mt-3">
                        <button onclick="agregarAlCarrito(); agregarDesdeProducto(this)"
                                class="bg-orange-500 text-white px-3 py-1 rounded-full hover:bg-orange-600 text-sm">
                            Agregar al carrito
                        </button>
                        <button onclick="abrirModalProducto('alb2.jpg', 'Polo rosado', 'S/.24.90')" 
                                class="bg-pink-500 text-white px-3 py-1 rounded-full hover:bg-pink-600 text-sm">
                            Ver detalle
                        </button>
                    </div>
                </div>

                <!-- Puedes seguir duplicando esta estructura para más productos -->
            </div>
        </div>
        <%@include file="CODIGO-REUTILIZABLE/modalCarrito.jsp" %>
        <%@include file="CODIGO-REUTILIZABLE/footer.jsp" %>
        <%@include file="CODIGO-REUTILIZABLE/modalProducto.jsp" %>
        <script src="JS/index.js"></script>
    </body>

</html>
