/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.dao.impl.ClienteDAOImpl;
import com.mycompany.vikids.util.conexionSQL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(name = "EliminarCliente", urlPatterns = {"/EliminarCliente"})
public class EliminarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        if (idStr == null || !idStr.matches("\\d+")) {
            response.sendRedirect("ListarClientes?error=id_invalido");
            return;
        }

        int id = Integer.parseInt(idStr);

        ClienteDAOImpl dao = new ClienteDAOImpl(new conexionSQL());
        boolean eliminado = dao.delete(id);

        if (eliminado) {
            response.sendRedirect("ListarClientes?mensaje=eliminado");
        } else {
            response.sendRedirect("ListarClientes?error=no_se_pudo_eliminar");
        }
    }
}
