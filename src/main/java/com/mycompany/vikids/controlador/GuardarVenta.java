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
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mycompany.vikids.dao.impl.VentaDAOImpl;
import com.mycompany.vikids.modelo.DetalleVenta;
import com.mycompany.vikids.modelo.Venta;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "GuardarVenta", urlPatterns = {"/GuardarVenta"})
public class GuardarVenta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tipoComprobante = request.getParameter("tipoComprobante");
        String numeroComprobante = request.getParameter("numeroComprobante");
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

        HttpSession session = request.getSession();
        UsuarioAdmin admin = (UsuarioAdmin) session.getAttribute("adminLogueado");
        int idAdmin = (admin != null) ? admin.getId() : 0;

        String estado = "REGISTRADO";

        // Leer productos desde JSON
        String productosJson = request.getParameter("productos");
        Gson gson = new Gson();
        Type listType = new TypeToken<List<DetalleVenta>>() {
        }.getType();
        List<DetalleVenta> listaProductos = gson.fromJson(productosJson, listType);

        // Depurar valores nulos o incompletos si fuera necesario
        if (listaProductos == null || listaProductos.isEmpty()) {
            response.sendRedirect("vistaAdmin/nuevaVenta.jsp?error=sinproductos");
            return;
        }

        // Convertir fecha
        LocalDateTime fechaVenta;
        try {
            // Si viene como "2025-07-07 15:30:00", convertir a LocalDateTime
            fechaVenta = LocalDateTime.parse(fecha.replace(" ", "T"));
        } catch (Exception e) {
            fechaVenta = LocalDateTime.now(); // respaldo por si falla
        }

        // Crear objeto Venta
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

        // Guardar en BD
        VentaDAOImpl dao = new VentaDAOImpl(new com.mycompany.vikids.util.conexionSQL().getConnection());

        System.out.println("➡️ Preparando venta:");
        System.out.println("ID Cliente: " + idCliente);
        System.out.println("ID Admin: " + idAdmin);
        System.out.println("Total: " + total);
        System.out.println("N° productos: " + (listaProductos != null ? listaProductos.size() : 0));
        System.out.println("JSON productos: " + productosJson);

        System.out.println("🧾 Venta recibida:");
        System.out.println(new Gson().toJson(venta));

        System.out.println("🧾 Productos:");
        System.out.println(new Gson().toJson(listaProductos));

        boolean exito = dao.guardarVentaConDetalle(venta, listaProductos);

        if (exito) {
            response.sendRedirect("ListarVentas");
        } else {
            response.sendRedirect("vistaAdmin/nuevaVenta.jsp?error=guardar");
        }
    }

    @Override
    public String getServletInfo() {
        return "Guarda una nueva venta con detalle";
    }
}
