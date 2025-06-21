/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
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
    const select = document.getElementById("marca");
    const input = document.getElementById("nuevaMarca");

    if (select.value === "otra") {
        input.classList.remove("hidden");
        input.setAttribute("name", "marca");   // activamos el input
        select.removeAttribute("name");        // desactivamos el select
        input.required = true;
    } else {
        input.classList.add("hidden");
        input.removeAttribute("name");         // desactivamos el input
        select.setAttribute("name", "marca");  // activamos el select
        input.required = false;
        input.value = "";
    }
}

function toggleNuevaCategoria() {
    const select = document.getElementById("categoria");
    const input = document.getElementById("nuevaCategoria");

    if (select.value === "otra") {
        input.classList.remove("hidden");
        input.setAttribute("name", "categoria");
        select.removeAttribute("name");
        input.required = true;
    } else {
        input.classList.add("hidden");
        input.removeAttribute("name");
        select.setAttribute("name", "categoria");
        input.required = false;
        input.value = "";
    }
}
