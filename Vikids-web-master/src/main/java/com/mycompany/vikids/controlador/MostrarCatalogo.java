/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.dao.impl.ProductoDAOImpl;
import com.mycompany.vikids.modelo.Producto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MostrarCatalogo", urlPatterns = {"/MostrarCatalogo"})
public class MostrarCatalogo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String categoria = request.getParameter("categoria");

        ProductoDAOImpl dao = new ProductoDAOImpl();
        List<Producto> productosPublicados = dao.listarPublicadosPorCategoria(categoria); // Solo activos y publicados

        request.setAttribute("productos", productosPublicados);

        if ("polos".equalsIgnoreCase(categoria)) {
            request.getRequestDispatcher("vistaUsuario/catalogoPolo.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("vistaUsuario/catalogoPantalon.jsp").forward(request, response);
        }
    }
}
