<%-- 
    Document   : index
    Created on : 11 jun. 2025, 12:28:17 a. m.
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>tienda vikids</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-white text-gray-800">
        <%@ include file="../includes/header.jsp" %>
        <!-- Carrusel -->
        <div class="relative w-screen mx-auto mt-6 overflow-hidden rounded-lg shadow-lg">
            <!-- Slides -->
            <div id="carousel" class="flex transition-transform duration-700 ease-in-out">
                <img src="../imagen/carrucel 1.jpg" class="w-screen h-80 sm:h-60 md:h-80 object-cover flex-shrink-0" alt="Imagen 1">
                <img src="../imagen/carrucel 2.jpg" class="w-screen h-80 sm:h-60 md:h-80 object-cover flex-shrink-0" alt="Imagen 2">
                <img src="../imagen/carrucel 3.jpg" class="w-screen h-80 sm:h-60 md:h-80 object-cover flex-shrink-0" alt="Imagen 3">
            </div>

            <!-- Botón Anterior -->
            <button onclick="prevSlide()" class="absolute top-1/2 left-4 -translate-y-1/2 bg-white bg-opacity-70 p-2 rounded-full shadow hover:bg-opacity-100">
                &#10094;
            </button>

            <!-- Botón Siguiente -->
            <button onclick="nextSlide()" class="absolute top-1/2 right-4 -translate-y-1/2 bg-white bg-opacity-70 p-2 rounded-full shadow hover:bg-opacity-100">
                &#10095;
            </button>

            <!-- Indicadores -->
            <div class="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2">
                <span class="indicator w-3 h-3 bg-white rounded-full opacity-50"></span>
                <span class="indicator w-3 h-3 bg-white rounded-full opacity-50"></span>
                <span class="indicator w-3 h-3 bg-white rounded-full opacity-50"></span>
            </div>
        </div>

        <!-- Sección de Promociones -->
        <div class="container mx-auto px-4 mt-10">
            <h1 class="text-5xl font-bold text-center mb-6 text-pink-600">Promociones</h1>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 text-center">
                <!-- Producto -->
                <div class="relative bg-white p-4 rounded-lg shadow-lg hover:shadow-2xl transition">
                    <span class="absolute top-2 left-2 bg-orange-400 text-white px-2 py-1 text-xs font-bold rounded">OFERTA</span>
                    <img src="../imagen/image1.png" class="mx-auto shadow-2xl h-70 w-full object-cover rounded mb-4" alt="Pantalón">
                    <h5 class="titulo-prod font-semibold text-lg">Pantalón Jean para Niña</h5>
                    <p class="descripcion-prod text-sm mb-4">Comodidad y estilo para todas las edades. Disponible en varias tallas.</p>
                    <button onclick="abrirModalProducto('image1.png', 'Pantalón Jean para Niña', 'Comodidad y estilo para todas las edades. Disponible en varias tallas.', 'S/ 79.90')" 
                            class="mt-3 bg-pink-500 text-white px-4 py-2 rounded-full hover:bg-pink-600 transition">
                        Ver detalles
                    </button>
                    <button onclick="agregarAlCarrito(); agregarDesdeProducto(this)" 
                            class="mt-3 bg-orange-500 text-white rounded-full px-4 py-2 hover:bg-orange-600 transition">
                        Agregar al carrito
                    </button>
                </div>

                <!-- Producto -->
                <div class="relative bg-white p-4 rounded-lg shadow-lg hover:shadow-2xl transition">
                    <span class="absolute top-2 left-2 bg-orange-400 text-white px-2 py-1 text-xs font-bold rounded">OFERTA</span>
                    <img src="../imagen/image2.png" class="mx-auto shadow-2xl h-70 w-full object-cover rounded mb-4" alt="Polo">
                    <h5 class="font-semibold text-lg">Polo de Algodón para Niña</h5>
                    <p class="text-sm mb-4">Suave al tacto y con diseños coloridos. Ideal para el verano.</p>
                    <button onclick="abrirModalProducto('image2.png', 'Polo de Algodón para Niña', 'Suave al tacto y con diseños coloridos. Ideal para el verano.', 'S/ 20.00')" 
                            class="mt-3 bg-pink-500 text-white px-4 py-2 rounded-full hover:bg-pink-600 transition">
                        Ver detalles
                    </button>
                    <button onclick="agregarAlCarrito(); agregarDesdeProducto(this)" 
                            class="mt-3 bg-orange-500 text-white rounded-full px-4 py-2 hover:bg-orange-600  transition">
                        Agregar al carrito
                    </button>
                </div>

                <!-- Producto -->
                <div class="relative bg-white p-4 rounded-lg shadow-lg hover:shadow-2xl transition">
                    <span class="absolute top-2 left-2 bg-orange-400 text-white px-2 py-1 text-xs font-bold rounded">OFERTA</span>
                    <img src="../imagen/image3.png" class="mx-auto shadow-2xl h-70 w-full object-cover rounded mb-4" alt="Short">
                    <h5 class="titulo-prod font-semibold text-lg">Short Casual para Niña</h5>
                    <p class="descripcion-prod text-sm mb-4">Frescos y cómodos. Perfectos para días calurosos y juegos al aire libre.</p>
                    <button onclick="abrirModalProducto('image3.png', 'Short Casual para Niña', 'Frescos y cómodos. Perfectos para días calurosos y juegos al aire libre.', 'S/ 45.00')" 
                            class="mt-3 bg-pink-500 text-white px-4 py-2 rounded-full hover:bg-pink-600 transition">
                        Ver detalles
                    </button>
                    <button onclick="agregarAlCarrito(); agregarDesdeProducto(this)" 
                            class=" mt-3 bg-orange-500 text-white rounded-full px-4 py-2 hover:bg-orange-600 transition">
                        Agregar al carrito
                    </button>
                </div>
            </div>
        </div>
        <%@include file="../includes/footer.jsp" %>
        <%@include file="../includes/modalCarrito.jsp" %>
        <%@include file="../includes/modalProducto.jsp" %>
        <script src="../JS/index.js"></script>


    </body>

</html>
