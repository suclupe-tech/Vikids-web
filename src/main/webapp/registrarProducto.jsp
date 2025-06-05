
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registroProducto</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .form-card {
                background-color: white;
                padding: 2rem;
                border-radius: 1rem;
                box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            }
            .form-title {
                color: #0d6efd;
            }
            .btn-custom {
                background-color: #0d6efd;
                border-color: #0d6efd;
                color: white;
            }
            .btn-custom:hover {
                background-color: #0b5ed7;
            }
            #preview-img {
                max-height: 150px;
                border-radius: 8px;
                object-fit: cover;
            }
        </style>
    </head>
    <body >
        <div class="container py-5">
            <div class="form-card mx-auto" style="max-width: 850px;">
                <div class="d-flex justify-content-end">
                    <a href="admin.jsp" class="btn btn-sm btn-outline-danger rounded-circle" title="Cerrar y volver">
                        <i class="bi bi-x-lg"></i>
                    </a>
                </div>
                <h3 class="form-title text-center mb-4">
                    <i class="bi bi-plus-circle-fill me-2"></i>Crear Nuevo Producto
                </h3>

                <form method="post" enctype="multipart/form-data" action="crearProducto.jsp">
                    <div class="row mb-3">
                        <div class="col-md-4 mb-3">
                            <label for="codigo" class="form-label">Código</label>
                            <input type="text" class="form-control " id="codigo" name="codigo" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="stock" class="form-label">Stock</label>
                            <input type="number" class="form-control" id="stock" name="stock" min="0" required>
                        </div>
                    </div>

                    <div class="row mb-3 mb-3">
                        <div class="col-md-4">
                            <label for="precio" class="form-label">Precio (S/)</label>
                            <input type="number" step="0.01" class="form-control" id="precio" name="precio" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="categoria" class="form-label">Categoría</label>
                            <select class="form-select" id="categoria" name="categoria" onchange="toggleNuevaCategoria()" required>
                                <option selected disabled value="">Seleccionar</option>
                                <option value="Ropa">Ropa</option>
                                <option value="Calzado">Calzado</option>
                                <option value="Accesorios">Accesorios</option>
                                <option value="otra">Otra...</option>
                            </select>

                            <input type="text" class="form-control mt-2" id="nuevaCategoria" name="nuevaCategoria" placeholder="Escribe nueva categoría" style="display: none;">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="marca" class="form-label">Marca</label>
                            <select class="form-select" id="marca" name="marca" onchange="toggleNuevaMarca()" required>
                                <option selected disabled value="">Seleccionar</option>
                                <option value="FantasyKids">FantasyKids</option>
                                <option value="NiñaModa">NiñaModa</option>
                                <option value="PequeStyle">PequeStyle</option>
                                <option value="otra">Otra...</option>
                            </select>

                            <input type="text" class="form-control mt-2" id="nuevaMarca" name="nuevaMarca" placeholder="Escribe nueva marca" style="display: none;">
                        </div>
                    </div>

                    <div class="row mb-4 mb-3">
                        <div class="col-md-4">
                            <label for="unidad" class="form-label">Unidad</label>
                            <select class="form-select" id="unidad" name="unidad" required>
                                <option value="Unidad">Unidad</option>
                                <option value="Par">Par</option>
                                <option value="Docena">Docena</option>
                            </select>
                        </div>
                        <div class="col-md-8">
                            <label for="imagen" class="form-label">Imagen del producto</label>
                            <input class="form-control" type="file" id="imagen" name="imagen" accept="image/*" onchange="previewImage(event)">
                            <div class="mt-3">
                                <img id="preview-img" src="#" alt="Vista previa" style="display:none;">
                            </div>
                        </div>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-success px-4 me-2">
                            <i class="bi bi-save me-1"></i>Registrar Producto
                        </button>
                        <a href="admin.jsp" class="btn btn-secondary px-4">
                            <i class="bi bi-x-circle me-1"></i>Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </div>
        <script>
            function previewImage(event) {
                const input = event.target;
                const preview = document.getElementById('preview-img');
                if (input.files && input.files[0]) {
                    const reader = new FileReader();
                    reader.onload = e => {
                        preview.src = e.target.result;
                        preview.style.display = 'block';
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            function toggleNuevaMarca() {
                const selectMarca = document.getElementById("marca");
                const inputNuevaMarca = document.getElementById("nuevaMarca");

                if (selectMarca.value === "otra") {
                    inputNuevaMarca.style.display = "block";
                    inputNuevaMarca.required = true;
                } else {
                    inputNuevaMarca.style.display = "none";
                    inputNuevaMarca.required = false;
                    inputNuevaMarca.value = "";
                }
            }
            function toggleNuevaMarca() {
                const select = document.getElementById("marca");
                const input = document.getElementById("nuevaMarca");
                input.style.display = (select.value === "otra") ? "block" : "none";
                input.required = (select.value === "otra");
                if (select.value !== "otra")
                    input.value = "";
            }

            function toggleNuevaCategoria() {
                const select = document.getElementById("categoria");
                const input = document.getElementById("nuevaCategoria");
                input.style.display = (select.value === "otra") ? "block" : "none";
                input.required = (select.value === "otra");
                if (select.value !== "otra")
                    input.value = "";
            }
        </script>
    </body>

</html>
