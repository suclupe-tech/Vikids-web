

// Menú desplegable
document.addEventListener("DOMContentLoaded", () => {
    const dropdown = document.querySelector("#dropdownToggle");
    const menu = document.querySelector("#dropdownMenu");

    dropdown.addEventListener("click", () => {
        menu.classList.toggle("hidden");
    });
});
function abrirModalProducto(imagen, titulo, descripcion, precio) {
    document.getElementById('modalImagen').src = 'imagen/' + imagen;
    document.getElementById('modalTitulo').textContent = titulo;
    document.getElementById('modalDescripcion').textContent = descripcion;
    document.getElementById('modalPrecio').textContent = precio;
    document.getElementById('modalProducto').classList.remove('hidden');
}

function cerrarModalProducto() {
    document.getElementById('modalProducto').classList.add('hidden');
}
function agregarAlCarrito() {
    // Mostrar el toast
    const toast = document.getElementById('toastCarrito');
    toast.classList.remove('hidden');
    toast.classList.add('opacity-100');

    // Ocultar el modal (opcional)
    //cerrarModalProducto();

    // Ocultar el toast después de 3 segundos
    setTimeout(() => {
        toast.classList.add('hidden');
    }, 3000);
}

function abrirModalProducto(imagen, titulo, descripcion, precio) {
    document.getElementById('modalImagen').src = 'imagen/' + imagen;
    document.getElementById('modalTitulo').textContent = titulo;
    document.getElementById('modalDescripcion').textContent = descripcion;
    document.getElementById('modalPrecio').textContent = precio;
    document.getElementById('modalProducto').classList.remove('hidden');
}

function cerrarModalProducto() {
    document.getElementById('modalProducto').classList.add('hidden');
}
const menuBtn = document.getElementById('menuBtn');
const menuMobile = document.getElementById('menuMobile');

menuBtn.addEventListener('click', () => {
    menuMobile.classList.toggle('hidden');
});
const carousel = document.getElementById('carousel');
const indicators = document.querySelectorAll('.indicator');
const slides = carousel.children;
let index = 0;

function updateSlide() {
    carousel.style.transform = `translateX(-${index * 100}%)`;
    indicators.forEach((dot, i) => {
        dot.classList.toggle('opacity-100', i === index);
        dot.classList.toggle('opacity-50', i !== index);
    });
}

function nextSlide() {
    index = (index + 1) % slides.length;
    updateSlide();
}

function prevSlide() {
    index = (index - 1 + slides.length) % slides.length;
    updateSlide();
}

// Auto slide cada 5 segundos
setInterval(nextSlide, 5000);

// Iniciar el primer estado
updateSlide();
// Carrito 
const openCartBtn = document.getElementById('openCartBtn');
const closeCartBtn = document.getElementById('closeCartBtn');
const cartSidebar = document.getElementById('cartSidebar');

openCartBtn.addEventListener('click', function (e) {
    e.preventDefault();
    cartSidebar.classList.remove('translate-x-full');
});

closeCartBtn.addEventListener('click', function () {
    cartSidebar.classList.add('translate-x-full');
});
let cart = [];

function renderCart() {
    const cartItems = document.getElementById("cartItems");
    const cartTotal = document.getElementById("cartTotal");
    cartItems.innerHTML = "";
    let total = 0;

    cart.forEach((item, index) => {
        total += item.price * item.quantity;

        const itemDiv = document.createElement("div");
        itemDiv.className = "flex items-center justify-between border-b pb-2";

        itemDiv.innerHTML = `
        <div class="flex items-center space-x-3">
          <img src="${item.image}" alt="${item.name}" class="w-14 h-14 rounded object-cover">
          <div>
            <h3 class="text-sm font-medium">${item.name}</h3>
            <p class="text-xs text-gray-500">S/ ${item.price.toFixed(2)}</p>
          </div>
        </div>
        <div class="flex items-center space-x-2">
          <button onclick="changeQty(${index}, -1)" class="text-gray-600 hover:text-pink-600 px-2">-</button>
          <span class="text-sm">${item.quantity}</span>
          <button onclick="changeQty(${index}, 1)" class="text-gray-600 hover:text-pink-600 px-2">+</button>
          <button onclick="removeItem(${index})" class="text-red-500 hover:text-red-700">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
            </svg>
          </button>
        </div>
      `;
        cartItems.appendChild(itemDiv);
    });

    cartTotal.textContent = `S/ ${total.toFixed(2)}`;
}

function addToCart(name, price, image) {
    const existing = cart.find(item => item.name === name);
    if (existing) {
        existing.quantity += 1;
    } else {
        cart.push({name, price, image, quantity: 1});
    }
    renderCart();
}

function changeQty(index, delta) {
    if (cart[index].quantity + delta <= 0)
        return;
    cart[index].quantity += delta;
    renderCart();
}

function removeItem(index) {
    cart.splice(index, 1);
    renderCart();
}

// Mostrar carrito
document.getElementById("openCartBtn").addEventListener("click", function (e) {
    e.preventDefault();
    document.getElementById("cartSidebar").classList.remove("translate-x-full");
});

// Cerrar carrito
function closeCart() {
    document.getElementById("cartSidebar").classList.add("translate-x-full");
}
function agregarDesdeProducto(button) {
    const contenedor = button.closest('.relative');
    const titulo = contenedor.querySelector('.titulo-prod')?.innerText || 'Producto';
    const descripcion = contenedor.querySelector('.descripcion-prod')?.innerText || '';
    const imagen = contenedor.querySelector('img')?.getAttribute('src') || '';

    // Extrae precio desde el botón de "Ver detalles"
    const botonDetalles = contenedor.querySelector('button[onclick^="abrirModalProducto"]');
    const onclickText = botonDetalles?.getAttribute('onclick');
    let precio = 0;

    if (onclickText) {
        const match = onclickText.match(/'S\/\s?([\d.]+)'/);
        if (match && match[1]) {
            precio = parseFloat(match[1]);
        }
    }

    // Llama a tu función de carrito con los datos
    addToCart(titulo, precio, imagen);
}
document.getElementById('carritoVacio').style.display = 'none';
if (carrito.length === 0) {
    document.getElementById('carritoVacio').style.display = 'block';
}




