
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@3.3.2/dist/tailwind.min.css" rel="stylesheet" />
    </head>
    <body class="bg-gray-50">
        <!-- Botón para abrir el modal -->
        <button onclick="document.getElementById('modalProducto').classList.remove('hidden')" class="bg-pink-500 text-white px-4 py-2 rounded hover:bg-pink-600">
            Ver Detalles
        </button>

        <!-- Modal -->
        <div id="modalProducto" class="fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center hidden">
            <div class="bg-white w-full max-w-3xl rounded-lg shadow-xl p-6 relative">
                <!-- Botón de cerrar -->
                <button onclick="document.getElementById('modalProducto').classList.add('hidden')" class="absolute top-3 right-3 text-gray-500 hover:text-red-600 text-2xl font-bold">&times;</button>

                <div class="flex flex-col md:flex-row gap-6">
                    <!-- Imagen del producto -->
                    <div class="md:w-1/2">
                        <img src="imagen/image1.png" alt="Pantalón Jean para Niña" class="rounded-lg shadow-xl object-cover h-64 w-full" />
                    </div>

                    <!-- Detalles -->
                    <div class="md:w-1/2">
                        <h2 class="text-2xl font-bold mb-2">Pantalón Jean para Niña</h2>
                        <p class="text-gray-600 mb-4">Comodidad y estilo para todas las edades. Disponible en varias tallas.</p>
                        <p class="text-pink-600 text-xl font-semibold mb-4">S/ 79.90</p>

                        <label for="talla" class="block font-semibold mb-1">Talla:</label>
                        <select id="talla" class="border border-gray-300 rounded px-3 py-2 mb-4 w-full">
                            <option>2 años</option>
                            <option>3 años</option>
                            <option>4 años</option>
                            <option>5 años</option>
                        </select>

                        <button class="bg-pink-500 text-white rounded-full px-4 py-2 hover:bg-pink-600 w-full transition">
                            Agregar al carrito
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
