/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.getElementById("registroProducto").addEventListener("submit", function (e) {
    e.preventDefault();

    const formData = new FormData(this);

    fetch("RegistrarProducto", {
        method: "POST",
        body: formData
    })
            .then(res => res.json())
            .then(data => {
                // Suponiendo que devuelves el producto insertado
                if (data && data.nombre) {
                    agregarProductoATabla(data);
                    mostrarToast("✅ Producto registrado correctamente", "success");
                    this.reset();
                } else {
                    mostrarToast("⚠️ Error al registrar producto", "error");
                }
            })
            .catch(err => {
                mostrarToast("⚠️ Error en la conexión", "error");
                console.error(err);
            });
});

