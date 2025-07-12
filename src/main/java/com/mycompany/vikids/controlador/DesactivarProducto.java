/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.dao.impl.ProductoDAOImpl;
import com.mycompany.vikids.util.conexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
@WebServlet(name = "DesactivarProducto", urlPatterns = {"/DesactivarProducto"})
public class DesactivarProducto extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        ProductoDAOImpl dao = new ProductoDAOImpl();

        if (dao.desactivar(codigo)) {
            response.sendRedirect("listarProductos.jsp?mensaje=desactivado");
        } else {
            response.sendRedirect("listarProductos.jsp?error=1");
        }
    }


@Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
