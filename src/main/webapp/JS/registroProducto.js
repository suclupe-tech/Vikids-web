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

