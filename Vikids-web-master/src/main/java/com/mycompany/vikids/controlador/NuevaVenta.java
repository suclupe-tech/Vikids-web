/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.dao.impl.VentaDAOImpl;
import com.mycompany.vikids.util.conexionSQL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "NuevaVenta", urlPatterns = {"/NuevaVenta"})
public class NuevaVenta extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener el tipo de comprobante desde parámetro GET
        String tipoComprobante = request.getParameter("tipo");
        if (tipoComprobante == null || tipoComprobante.isEmpty()) {
            tipoComprobante = "BOLETA"; // Valor por defecto
        }

        // Obtener fecha y hora actual
        LocalDateTime fechaActual = LocalDateTime.now();
        String fechaFormateada = fechaActual.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

       VentaDAOImpl dao = new VentaDAOImpl(new conexionSQL().getConnection());

        String numeroComprobante = dao.generarNumeroComprobante(tipoComprobante);

        // Enviar datos al JSP
        request.setAttribute("fechaVenta", fechaFormateada);
        request.setAttribute("numeroComprobante", numeroComprobante);
        request.setAttribute("tipoComprobante", tipoComprobante);

       request.getRequestDispatcher("vistaAdmin/nuevaVenta.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Muestra la pantalla para registrar una nueva venta con tipo de comprobante";
    }
}
