<!-- Carrito Slide-in -->
<div id="cartSidebar" class="fixed top-0 right-0 h-full w-80 bg-white shadow-lg transform translate-x-full transition-transform duration-300 z-50">
    <div class="flex justify-between items-center p-4 border-b">
        <h2 class="text-lg font-semibold">Carrito</h2>
        <button id="closeCartBtn" class="text-gray-500 hover:text-gray-700">&times;</button>
    </div>

    <!-- Contenido del carrito -->
    <div id="cartItems" class="p-4 space-y-4 overflow-y-auto max-h-[calc(100vh-160px)]">

    </div>

    <!-- Total -->
    <div class="p-4 border-t">
        <p class="font-semibold text-right">Total: <span id="cartTotal"></span></p>
        <button class="mt-3 w-full bg-pink-500 text-white py-2 rounded hover:bg-pink-600">Procesar Pedido</button>
    </div>
</div>