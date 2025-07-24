/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.modelo.UsuarioAdmin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.mycompany.vikids.dao.UsuarioAdminDAO;
import com.mycompany.vikids.dao.impl.UsuarioAdminDAOImpl;
import com.mycompany.vikids.dao.impl.VentaDAOImpl;
import com.mycompany.vikids.modelo.DetalleVenta;
import com.mycompany.vikids.modelo.Venta;
import com.mycompany.vikids.util.conexionSQL;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GuardarVenta", urlPatterns = {"/GuardarVenta"})
public class GuardarVenta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("🚀 Entrando al Servlet GuardarVenta");

        try {
            // Mostrar parámetros recibidos
            java.util.Enumeration<String> paramNames = request.getParameterNames();
            while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();
                String[] paramValues = request.getParameterValues(paramName);
                System.out.println("   " + paramName + " = " + java.util.Arrays.toString(paramValues));
            }

            // Obtener datos principales
            String tipoComprobante = request.getParameter("tipoComprobante");
            String fecha = request.getParameter("fechaVenta");
            String tipoPago = request.getParameter("tipoPago");
            String descuentoStr = request.getParameter("descuento");
            String subtotalStr = request.getParameter("subtotal");
            String igvStr = request.getParameter("igv");
            String totalStr = request.getParameter("total");
            String idClienteStr = request.getParameter("idCliente");

            double descuento = (descuentoStr != null && !descuentoStr.isEmpty()) ? Double.parseDouble(descuentoStr) : 0;
            double subtotal = (subtotalStr != null && !subtotalStr.isEmpty()) ? Double.parseDouble(subtotalStr) : 0;
            double igv = (igvStr != null && !igvStr.isEmpty()) ? Double.parseDouble(igvStr) : 0;
            double total = (totalStr != null && !totalStr.isEmpty()) ? Double.parseDouble(totalStr) : 0;
            int idCliente = (idClienteStr != null && !idClienteStr.isEmpty()) ? Integer.parseInt(idClienteStr) : 0;

            // Validar admin
            HttpSession session = request.getSession();
            UsuarioAdmin admin = (UsuarioAdmin) session.getAttribute("adminLogueado");

            if (admin == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int idAdmin = admin.getId(); // Ya lo tienes en sesión, no necesitas volver a consultar
            System.out.println("✅ ID del admin obtenido de sesión: " + idAdmin);
            if (idAdmin == 0) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Estado de la venta
            String estado = "REGISTRADO";

            // Obtener productos desde los inputs del formulario
            String[] ids = request.getParameterValues("idProducto[]");
            String[] nombres = request.getParameterValues("nombreProducto[]");
            String[] cantidades = request.getParameterValues("cantidad[]");
            String[] preciosUnitarios = request.getParameterValues("precioUnitario[]");
            String[] subtotales = request.getParameterValues("subtotalProducto[]");

            if (ids == null || ids.length == 0) {
                response.sendRedirect("vistaAdmin/nuevaVenta.jsp?error=sinproductos");
                return;
            }

            List<DetalleVenta> listaProductos = new ArrayList<>();
            for (int i = 0; i < ids.length; i++) {
                try {
                    DetalleVenta detalle = new DetalleVenta();
                    detalle.setIdProducto(Integer.parseInt(ids[i]));
                    detalle.setNombreProducto(nombres != null && i < nombres.length ? nombres[i] : "Sin nombre");
                    detalle.setCantidad(cantidades != null && i < cantidades.length ? Integer.parseInt(cantidades[i]) : 0);
                    detalle.setPrecioUnitario(preciosUnitarios != null && i < preciosUnitarios.length ? Double.parseDouble(preciosUnitarios[i]) : 0.0);
                    detalle.setSubtotal(subtotales != null && i < subtotales.length ? Double.parseDouble(subtotales[i]) : 0.0);
                    listaProductos.add(detalle);
                } catch (Exception e) {
                    System.out.println("❌ Error procesando producto: " + e.getMessage());
                }
            }

            // Convertir fecha (con respaldo en caso de error)
            LocalDateTime fechaVenta;
            try {
                fechaVenta = LocalDateTime.now(); // Aquí puedes aplicar un DateTimeFormatter si deseas
            } catch (Exception e) {
                fechaVenta = LocalDateTime.now();
            }

            Connection conn = new conexionSQL().getConnection();
            VentaDAOImpl dao = new VentaDAOImpl(conn);
            String numeroComprobante = dao.generarNumeroComprobante(tipoComprobante);

            Venta venta = new Venta(0,
                    fechaVenta,
                    idCliente,
                    idAdmin,
                    total,
                    descuento,
                    tipoComprobante,
                    numeroComprobante,
                    igv,
                    tipoPago,
                    estado);
            System.out.println("🧪 Objeto Venta creado: idAdmin = " + venta.getIdAdmin());

            System.out.println("👉 Enviando venta a guardarVentaConDetalle...");
            boolean exito = dao.guardarVentaConDetalle(venta, listaProductos);
            System.out.println("🔁 Resultado insertar venta: " + exito);

            if (exito) {
                response.sendRedirect("ListarVentas");
            } else {
                response.sendRedirect("vistaAdmin/nuevaVenta.jsp?error=guardar");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("vistaAdmin/nuevaVenta.jsp?error=exception");
        }
    }

    @Override
    public String getServletInfo() {
        return "Guarda una nueva venta con detalle";
    }
}
