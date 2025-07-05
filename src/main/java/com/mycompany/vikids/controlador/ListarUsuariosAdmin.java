/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import java.io.IOException;
import java.util.List;
import com.mycompany.vikids.dao.impl.UsuarioAdminDAOImpl;
import com.mycompany.vikids.modelo.UsuarioAdmin;
import com.mycompany.vikids.util.conexionSQL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

/**
 *
 * @author USER
 */
@WebServlet(name = "ListarUsuariosAdmin", urlPatterns = {"/ListarUsuariosAdmin"})
public class ListarUsuariosAdmin extends HttpServlet {

    UsuarioAdminDAOImpl dao = new UsuarioAdminDAOImpl(new conexionSQL());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<UsuarioAdmin> lista = dao.listarTodos();

            request.setAttribute("listUsuario", lista);
            request.getRequestDispatcher("vistaAdmin/usuarios.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error al listar usuarios" + e.getMessage());
            request.getRequestDispatcher("vistaAdmin/usuarios.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
