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
        String apellido = request.getParameter("apellido");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        String telefono = request.getParameter("telefono");

        // 👀 Imprime lo que llega desde el formulario
        System.out.println("🟡 Datos recibidos del formulario:");
        System.out.println("Nombre: " + nombre);
        System.out.println("Apellido: " + apellido);
        System.out.println("Usuario: " + usuario);
        System.out.println("Contraseña: " + password);
        System.out.println("Teléfono: " + telefono);

        try {
            // Validaciones
            Preconditions.checkNotNull(nombre, "Nombre requerido");
            Preconditions.checkNotNull(apellido, "Apellido requerido");
            Preconditions.checkNotNull(usuario, "Usuario requerido");
            Preconditions.checkNotNull(password, "Contraseña requerida");
            Preconditions.checkNotNull(telefono, "Teléfono requerido");

            // Hashear contraseña
            String passwordHash = HashUtil.hashPassword(password);

            // Crear objeto
            UsuarioAdmin admin = new UsuarioAdmin();
            admin.setNombre(nombre);
            admin.setApellido(apellido);
            admin.setUsuario(usuario);
            admin.setContraseña(passwordHash);
            admin.setTelefono(telefono);

            // Guardar en BD
            if (dao.existeUsuario(usuario)) {
                request.setAttribute("error", "❌ El nombre de usuario ya está registrado. Elige otro.");
            } else if (dao.insert(admin)) {
                request.setAttribute("exito", "✅ Registro exitoso del administrador");
            } else {
                request.setAttribute("error", "❌ No se pudo registrar al administrador");
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
