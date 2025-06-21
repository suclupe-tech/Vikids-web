/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.dao.ProductoDAO;
import com.mycompany.vikids.dao.impl.ProductoDAOImpl;
import com.mycompany.vikids.modelo.Producto;
import com.mycompany.vikids.util.conexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author USER
 */
@WebServlet(name = "ListarInactivos", urlPatterns = {"/ListarInactivos"})
public class ListarInactivos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductoDAO dao = new ProductoDAOImpl(conexionSQL.conectar());

        List<Producto> lista = dao.listarInactivos(); // tu método en DAO

        request.setAttribute("listaInactivos", lista);
        request.getRequestDispatcher("vistaAdmin/productosInactivos.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
