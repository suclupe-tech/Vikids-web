<!-- Modal flotante reutilizable -->
<div id="modalProducto" class="fixed inset-0 z-50 bg-black bg-opacity-50 flex items-center justify-center hidden">
    <div class="bg-white w-full max-w-3xl rounded-lg shadow-xl p-6 relative">
        <!-- Botón de cerrar -->
        <button onclick="cerrarModalProducto()" class="absolute top-3 right-3 text-gray-500 hover:text-red-600 text-2xl font-bold">&times;</button>

        <div class="flex flex-col md:flex-row gap-6">
            <!-- Imagen -->
            <div class="md:w-1/2">
                <img id="modalImagen" src="" alt="" class="rounded-lg shadow-xl object-cover h-70 w-full" />
            </div>

            <!-- Detalles -->
            <div class="md:w-1/2">
                <h2 id="modalTitulo" class="text-2xl font-bold mb-2"></h2>
                <p id="modalDescripcion" class="text-gray-600 mb-4"></p>
                <p id="modalPrecio" class="text-pink-600 text-xl font-semibold mb-4"></p>

                <label for="talla" class="block font-semibold mb-1">Talla:</label>
                <select id="talla" class="border border-gray-300 rounded px-3 py-2 mb-4 w-full">
                    <option>2 años</option>
                    <option>3 años</option>
                    <option>4 años</option>
                    <option>5 años</option>
                </select>

                <button  onclick="agregarAlCarrito(); agregarDesdeModal()" class="bg-pink-500 text-white rounded-full px-4 py-2 hover:bg-pink-600 w-full transition">
                    Agregar al carrito
                </button>
            </div>
        </div>
    </div>
</div>
<div id="toastCarrito" class="fixed bottom-5 right-5 bg-green-500 text-white px-4 py-2 rounded shadow-lg hidden z-50 transition">
    Producto agregado al carrito
</div>
