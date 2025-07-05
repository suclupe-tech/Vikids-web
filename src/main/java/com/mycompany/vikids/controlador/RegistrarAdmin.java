/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.google.common.base.Preconditions;
import com.mycompany.vikids.util.LoginCache;
import com.mycompany.vikids.dao.impl.UsuarioAdminDAOImpl;
import com.mycompany.vikids.modelo.UsuarioAdmin;
import com.mycompany.vikids.util.HashUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import com.mycompany.vikids.util.conexionSQL;
/**
 *
 * @author USER
 */
@WebServlet(name = "RegistrarAdmin", urlPatterns = {"/RegistrarAdmin"})
public class RegistrarAdmin extends HttpServlet {

    UsuarioAdminDAOImpl dao = new UsuarioAdminDAOImpl(new conexionSQL());
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        String telefono = request.getParameter("telefono");

        try {
            // Validaciones
            Preconditions.checkNotNull(nombre, "Nombre requerido");
            Preconditions.checkNotNull(usuario, "Usuario requerido");
            Preconditions.checkNotNull(password, "Contraseña requerida");
            Preconditions.checkNotNull(telefono, "Teléfono requerido");

            // Hashear contraseña
            String passwordHash = HashUtil.hashPassword(password);

            // Crear objeto
            UsuarioAdmin admin = new UsuarioAdmin();
            admin.setNombre(nombre);
            admin.setUsuario(usuario);
            admin.setContraseña(passwordHash);
            admin.setTelefono(telefono);
            admin.setActivo(1);

            // Guardar en BD
            if (dao.insert(admin)) {
                response.sendRedirect("admin.jsp?registro=1");
            } else {
                request.setAttribute("error", "No se pudo registrar al administrador");
                request.getRequestDispatcher("vistaAdmin/registroAdmin.jsp").forward(request, response);
            }

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("vistaAdmin/registroAdmin.jsp").forward(request, response);
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
