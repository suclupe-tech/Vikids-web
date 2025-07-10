/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.google.gson.Gson;
import com.mycompany.vikids.dao.impl.ClienteDAOImpl;
import com.mycompany.vikids.modelo.Cliente;
import com.mycompany.vikids.util.conexionSQL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "BuscarClienteDni", urlPatterns = {"/BuscarClienteDni"})
public class BuscarClienteDni extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dni = request.getParameter("dni");

        // Validar formato de DNI (8 dígitos)
        if (dni == null || !dni.matches("\\d{8}")) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{}");
            return;
        }

        try {
            conexionSQL conn = new conexionSQL();
            ClienteDAOImpl dao = new ClienteDAOImpl(conn);

            Cliente cliente = dao.buscarPorDni(dni);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            if (cliente != null) {
                String json = new Gson().toJson(cliente);
                response.getWriter().write(json);
            } else {
                response.getWriter().write("{}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Error al buscar cliente\"}");
        }
    }
}
