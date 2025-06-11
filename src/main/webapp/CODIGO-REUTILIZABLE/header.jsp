

<div class="bg-pink-400 text-center text-white py-2 font-semibold">
    ¡Envío gratis por compras mayores a S/ 100!
</div>

<nav class="bg-white shadow sticky top-0 z-50 ">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center space-x-12">

        <!-- Logo -->
        <a href="#" class="flex items-center space-x-3">
            <img src="imagen/logo vk png.png" alt="Logo" class="w-20">
                <span class="font-bold text-xl">Vikids</span>
        </a>

        <!-- link menu -->
        <div class="hidden md:flex items-center space-x-3 px-10">
            <a href="index.jsp" class="hover:text-pink-600">Inicio</a>

            <!-- Catálogo desplegable -->
            <div class="relative group inline-block">
                <button class="cursor-pointer text-gray-700 hover:text-pink-600">Catálogo</button>

                <ul class="absolute left-0 mt-2 w-40 bg-white border border-gray-300 rounded-md shadow-lg opacity-0 invisible group-hover:visible group-hover:opacity-100 transition-opacity duration-200 z-50">
                    <li><a href="catalogoPantalon.jsp" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">Pantalón</a></li>
                    <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">Polos</a></li>
                    <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">Blusas</a></li>
                    <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">MiniFaldas</a></li>
                    <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">MiniShort</a></li>
                    <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">Casacas</a></li>
                </ul>
            </div>
            <a href="#" class="hover:text-pink-600">Contacto</a>
        </div>

        <!-- Botón hamburguesa -->
        <button id="menuBtn" class="md:hidden text-gray-700">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
            </svg>
        </button>

        <!-- Menú (Escritorio) -->
        <div class="hidden md:flex items-center w-full">

            <div class="flex justify-center items-center w-full max-w-lg">
                <div class="flex items-center border border-gray-300 rounded-full overflow-hidden w-full">
                    <input type="text" placeholder="Buscar productos..." class="w-full px-4 py-2 focus:outline-none text-sm">
                        <button class="bg-pink-500 text-white px-4 py-2">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M12.9 14.32a8 8 0 111.414-1.414l4.387 
                                      4.387a1 1 0 01-1.414 1.414l-4.387-4.387zM14 8a6 6 0 11-12 
                                      0 6 6 0 0112 0z" clip-rule="evenodd"/>
                            </svg>
                        </button>
                </div>
            </div>
        </div>
        <div class="hidden md:flex items-center space-x-2">

            <!-- Íconos -->
            <div class="flex space-x-4">
                <a href="#" class="text-gray-700">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                              d="M5.121 17.804A13.937 13.937 0 0112 15c2.5 0 
                              4.847.657 6.879 1.804M15 11a3 3 0 11-6 0 
                              3 3 0 016 0z"/>
                    </svg>
                </a>
                <a href="#" id="openCartBtn" class="text-gray-700">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-7 w-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M3 3h2l.4 2M7 13h10l1-5H6.4M7 
                              13l-1.5 7h11a1 1 0 001-1.2l-1.2-5.8M7 
                              13H5.4m0 0L4 6H2"/>
                    </svg>
                </a>
            </div>
        </div>
    </div>

    <!-- Menú móvil -->
    <div id="menuMobile" class="md:hidden hidden px-4 pb-4 space-y-3">
        <a href="#" class="block text-gray-700 hover:text-pink-600">Inicio</a>
        <!-- Menú desplegable con hover -->
        <div class="relative group inline-block">
            <button class="cursor-pointer text-gray-700 hover:text-pink-600">Catálogo</button>

            <ul class="absolute left-0 mt-2 w-40 bg-white border border-gray-300 rounded-md shadow-lg opacity-0 invisible group-hover:visible group-hover:opacity-100 transition-opacity duration-200 z-50">
                <li><a href="catalogoPantalon.jsp" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">Pantalón</a></li>
                <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">Polos</a></li>
                <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">Blusas</a></li>
                <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">MiniFaldas</a></li>
                <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">MiniShort</a></li>
                <li><a href="#" class="block px-4 py-2 text-gray-600 hover:bg-pink-100">Casacas</a></li>
            </ul>
        </div>
        <a href="#" class="block text-gray-700 ">Contacto</a>
        <div class="flex items-center border border-gray-300 rounded-full overflow-hidden">
            <input type="text" placeholder="Buscar..." class="w-full px-4 py-2 focus:outline-none">
                <button class="bg-pink-500 text-white px-4 py-2">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M12.9 14.32a8 8 0 111.414-1.414l4.387 
                              4.387a1 1 0 01-1.414 1.414l-4.387-4.387zM14 8a6 6 0 11-12 
                              0 6 6 0 0112 0z" clip-rule="evenodd"/>
                    </svg>
                </button>
        </div>
    </div>
</nav>
