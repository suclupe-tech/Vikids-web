/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.getElementById("dniCliente").addEventListener("blur", function () {
    const dni = this.value;

    if (dni.length === 8) {
        fetch(`BuscarClienteDni?dni=${dni}`)
            .then(response => response.json())
            .then(data => {
                if (data.id) {
                    document.getElementById("nombreCliente").value = data.nombre + ' ' + data.apellido;
                    document.getElementById("direccionCliente").value = data.direccion;
                    document.getElementById("idCliente").value = data.id;
                } else {
                    alert("Cliente no encontrado");
                    document.getElementById("nombreCliente").value = "";
                    document.getElementById("direccionCliente").value = "";
                    document.getElementById("idCliente").value = "";
                }
            })
            .catch(error => {
                console.error("Error al buscar cliente:", error);
            });
    }
});




