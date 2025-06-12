
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registroProducto</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js" defer></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    </head>
    <body >
        <%@include file="../CODIGO-REUTILIZABLE/adminPrincipal.jsp" %>
        <div class="container mx-auto py-10 mt-20">
            <div class="bg-white shadow-lg rounded-lg p-8 max-w-4xl mx-auto">

                <div class="flex justify-end">
                    <a href="../ADMIN/dashboard.jsp" class="text-red-500 hover:text-white border border-red-500 hover:bg-red-500 rounded-full p-2" title="Cerrar y volver">
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="currentColor" viewBox="0 0 16 16">
                        <path d="M4.646 4.646a.5.5 0 011 0L8 6.293l2.354-2.647a.5.5 0 01.708.708L8.707 7l2.647 2.354a.5.5 0 01-.708.708L8 7.707l-2.354 2.647a.5.5 0 01-.708-.708L7.293 7 4.646 4.646a.5.5 0 010-.708z"/>
                        </svg>
                    </a>
                </div>

                <h3 class="text-xl font-semibold text-center mb-6 flex items-center justify-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 text-blue-600" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M8 0a.5.5 0 01.5.5v7h7a.5.5 0 010 1h-7v7a.5.5 0 01-1 0v-7h-7a.5.5 0 010-1h7v-7A.5.5 0 018 0z"/>
                    </svg>
                    Crear Nuevo Producto
                </h3>

                <form method="post" enctype="multipart/form-data" action="crearProducto.jsp" class="space-y-6">
                    <div class="grid md:grid-cols-3 gap-4">
                        <div>
                            <label for="codigo" class="block text-sm font-medium text-gray-700">Código</label>
                            <input type="text" id="codigo" name="codigo" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:ring-blue-500 focus:border-blue-500">
                        </div>
                        <div>
                            <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre</label>
                            <input type="text" id="nombre" name="nombre" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:ring-blue-500 focus:border-blue-500">
                        </div>
                        <div>
                            <label for="stock" class="block text-sm font-medium text-gray-700">Stock</label>
                            <input type="number" id="stock" name="stock" min="0" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:ring-blue-500 focus:border-blue-500">
                        </div>
                    </div>

                    <div class="grid md:grid-cols-3 gap-4">
                        <div>
                            <label for="precio" class="block text-sm font-medium text-gray-700">Precio (S/)</label>
                            <input type="number" step="0.01" id="precio" name="precio" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2 focus:ring-blue-500 focus:border-blue-500">
                        </div>

                        <div>
                            <label for="categoria" class="block text-sm font-medium text-gray-700">Categoría</label>
                            <select id="categoria" name="categoria" onchange="toggleNuevaCategoria()" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2">
                                <option disabled selected value="">Seleccionar</option>
                                <option value="Ropa">Ropa</option>
                                <option value="Calzado">Calzado</option>
                                <option value="Accesorios">Accesorios</option>
                                <option value="otra">Otra...</option>
                            </select>
                            <input type="text" id="nuevaCategoria" name="nuevaCategoria" placeholder="Escribe nueva categoría" class="mt-2 hidden border border-gray-300 rounded-md p-2 w-full">
                        </div>

                        <div>
                            <label for="marca" class="block text-sm font-medium text-gray-700">Marca</label>
                            <select id="marca" name="marca" onchange="toggleNuevaMarca()" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2">
                                <option disabled selected value="">Seleccionar</option>
                                <option value="FantasyKids">FantasyKids</option>
                                <option value="NiñaModa">NiñaModa</option>
                                <option value="PequeStyle">PequeStyle</option>
                                <option value="otra">Otra...</option>
                            </select>
                            <input type="text" id="nuevaMarca" name="nuevaMarca" placeholder="Escribe nueva marca" class="mt-2 hidden border border-gray-300 rounded-md p-2 w-full">
                        </div>
                    </div>

                    <div class="grid md:grid-cols-3 gap-4">
                        <div>
                            <label for="unidad" class="block text-sm font-medium text-gray-700">Unidad</label>
                            <select id="unidad" name="unidad" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2">
                                <option value="Unidad">Unidad</option>
                                <option value="Par">Par</option>
                                <option value="Docena">Docena</option>
                            </select>
                        </div>

                        <div class="md:col-span-2">
                            <label for="imagen" class="block text-sm font-medium text-gray-700">Imagen del producto</label>
                            <input type="file" id="imagen" name="imagen" accept="image/*" onchange="previewImage(event)" class="mt-1 block w-full text-sm border border-gray-300 rounded-md shadow-sm p-2">
                            <div class="mt-3">
                                <img id="preview-img" src="#" alt="Vista previa" class="hidden max-h-40 object-contain">
                            </div>
                        </div>
                    </div>

                    <div class="text-center mt-6">
                        <button type="submit" class="bg-green-600 text-white px-6 py-2 rounded-md hover:bg-green-700 transition">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 inline-block mr-1" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M8.5 1a.5.5 0 00-1 0v6H1.5a.5.5 0 000 1h6v6a.5.5 0 001 0v-6h6a.5.5 0 000-1h-6V1z"/>
                            </svg>
                            Registrar Producto
                        </button>
                        <a href="dashboard.jsp" class="ml-4 bg-gray-500 text-white px-6 py-2 rounded-md hover:bg-gray-600 transition">
                            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 inline-block mr-1" fill="currentColor" viewBox="0 0 16 16">
                            <path d="M4.646 4.646a.5.5 0 01.708 0L8 7.293l2.646-2.647a.5.5 0 01.708.708L8.707 8l2.647 2.646a.5.5 0 01-.708.708L8 8.707l-2.646 2.647a.5.5 0 01-.708-.708L7.293 8 4.646 5.354a.5.5 0 010-.708z"/>
                            </svg>
                            Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <script src="../JS/dasboard.js"></script>
        <script src="../JS/registroProducto.js"></script>
    </body>

</html>
