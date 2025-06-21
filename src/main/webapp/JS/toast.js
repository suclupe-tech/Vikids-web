/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
setTimeout(() => {
    const toast = document.getElementById("toast");
    if (toast) toast.remove();
}, 3000);

function mostrarToast(mensaje, tipo = "success") {
    const toast = document.getElementById("toast");
    toast.textContent = mensaje;

    toast.className = `fixed top-4 right-4 p-4 rounded-xl z-50 transition-opacity duration-500 shadow-lg ${
        tipo === "success" ? "bg-green-500" : "bg-red-500"
    }`;

    toast.classList.remove("hidden");

    setTimeout(() => {
        toast.classList.add("hidden");
    }, 3000);
}

