
document.addEventListener("DOMContentLoaded", () => {
  // Menú desplegable
  const dropdown = document.querySelector("#dropdownToggle");
  const menu = document.querySelector("#dropdownMenu");

  if (dropdown && menu) {
    dropdown.addEventListener("click", () => {
      menu.classList.toggle("hidden");
    });
  }

  // Menú móvil
  const menuBtn = document.getElementById('menuBtn');
  const menuMobile = document.getElementById('menuMobile');
  if (menuBtn && menuMobile) {
    menuBtn.addEventListener('click', () => {
      menuMobile.classList.toggle('hidden');
    });
  }

  // Carrusel
  const carousel = document.getElementById('carousel');
  const indicators = document.querySelectorAll('.indicator');
  if (carousel && indicators.length) {
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

    setInterval(nextSlide, 5000);
    updateSlide();
  }

  // Carrito
  const openCartBtn = document.getElementById('openCartBtn');
  const closeCartBtn = document.getElementById('closeCartBtn');
  const cartSidebar = document.getElementById('cartSidebar');

  if (openCartBtn && closeCartBtn && cartSidebar) {
    openCartBtn.addEventListener('click', function (e) {
      e.preventDefault();
      cartSidebar.classList.remove('translate-x-full');
    });

    closeCartBtn.addEventListener('click', function () {
      cartSidebar.classList.add('translate-x-full');
    });
  }

  // Modal producto
  window.abrirModalProducto = function (imagen, titulo, descripcion, precio) {
    const modal = document.getElementById('modalProducto');
    if (!modal) return;

    document.getElementById('modalImagen').src = 'imagen/' + imagen;
    document.getElementById('modalTitulo').textContent = titulo;
    document.getElementById('modalDescripcion').textContent = descripcion;
    document.getElementById('modalPrecio').textContent = precio;
    modal.classList.remove('hidden');
  };

  window.cerrarModalProducto = function () {
    const modal = document.getElementById('modalProducto');
    if (modal) modal.classList.add('hidden');
  };

  window.agregarAlCarrito = function () {
    const toast = document.getElementById('toastCarrito');
    if (!toast) return;

    toast.classList.remove('hidden');
    toast.classList.add('opacity-100');

    setTimeout(() => {
      toast.classList.add('hidden');
    }, 3000);
  };

  let cart = [];

  window.renderCart = function () {
    const cartItems = document.getElementById("cartItems");
    const cartTotal = document.getElementById("cartTotal");
    if (!cartItems || !cartTotal) return;

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
  };

  window.addToCart = function (name, price, image) {
    const existing = cart.find(item => item.name === name);
    if (existing) {
      existing.quantity += 1;
    } else {
      cart.push({ name, price, image, quantity: 1 });
    }
    renderCart();
  };

  window.changeQty = function (index, delta) {
    if (cart[index].quantity + delta <= 0) return;
    cart[index].quantity += delta;
    renderCart();
  };

  window.removeItem = function (index) {
    cart.splice(index, 1);
    renderCart();
  };

  window.closeCart = function () {
    const sidebar = document.getElementById("cartSidebar");
    if (sidebar) sidebar.classList.add("translate-x-full");
  };

  window.agregarDesdeProducto = function (button) {
    const contenedor = button.closest('.relative');
    if (!contenedor) return;

    const titulo = contenedor.querySelector('.titulo-prod')?.innerText || 'Producto';
    const descripcion = contenedor.querySelector('.descripcion-prod')?.innerText || '';
    const imagen = contenedor.querySelector('img')?.getAttribute('src') || '';

    const botonDetalles = contenedor.querySelector('button[onclick^="abrirModalProducto"]');
    const onclickText = botonDetalles?.getAttribute('onclick');
    let precio = 0;

    if (onclickText) {
      const match = onclickText.match(/'S\/\s?([\d.]+)'/);
      if (match && match[1]) {
        precio = parseFloat(match[1]);
      }
    }

    addToCart(titulo, precio, imagen);
  };

  const carritoVacio = document.getElementById('carritoVacio');
  if (carritoVacio) {
    if (cart.length === 0) {
      carritoVacio.style.display = 'block';
    } else {
      carritoVacio.style.display = 'none';
    }
  }
});
