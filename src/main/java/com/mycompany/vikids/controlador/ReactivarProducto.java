/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.dao.impl.ProductoDAOImpl;
import com.mycompany.vikids.util.conexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
@WebServlet(name = "ReactivarProducto", urlPatterns = {"/ReactivarProducto"})
public class ReactivarProducto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        ProductoDAOImpl dao = new ProductoDAOImpl(conexionSQL.conectar());

        if (dao.reactivar(codigo)) {
            response.sendRedirect("productosInactivos.jsp?reactivado=1");
        } else {
            response.sendRedirect("productosInactivos.jsp?error=1");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
