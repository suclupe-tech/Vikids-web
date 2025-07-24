/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.dao.impl.ProductoDAOImpl;
import com.mycompany.vikids.util.conexionSQL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "PublicarProducto", urlPatterns = {"/PublicarProducto"})
public class PublicarProducto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener el ID del producto desde el formulario
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));

        // Crear el DAO y actualizar el campo "publicado"
        ProductoDAOImpl dao = new ProductoDAOImpl();
        boolean exito = dao.publicar(idProducto);

        if (exito) {
            // Publicación exitosa
            response.sendRedirect("vistaAdmin/dashboard.jsp?publicado=ok");
        } else {
            // Error al publicar
            response.sendRedirect("vistaAdmin/dashboard.jsp?publicado=error");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet que publica un producto en el catálogo web";
    }
}
