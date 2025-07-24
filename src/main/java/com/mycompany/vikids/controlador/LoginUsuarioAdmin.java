/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.google.common.base.Preconditions;
import com.mycompany.vikids.util.LoginCache;
import com.mycompany.vikids.dao.impl.UsuarioAdminDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import com.mycompany.vikids.util.conexionSQL;

@WebServlet(name = "LoginUsuarioAdmin", urlPatterns = {"/vistaAdmin/LoginUsuarioAdmin"})
public class LoginUsuarioAdmin extends HttpServlet {

    UsuarioAdminDAOImpl dao = new UsuarioAdminDAOImpl(new conexionSQL());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("🚀 Servlet LoginUsuarioAdmin activado");
        System.out.println("Usuario ingresado: " + username);
        System.out.println("Contraseña ingresada: " + password);

        try {
            //validacion con google Guava
            Preconditions.checkNotNull(username, "El usuario es obligatorio");
            Preconditions.checkNotNull(password, "La contraseña es obligatoria");
            Preconditions.checkArgument(!username.isBlank(), "El usuario esta vacio");
            Preconditions.checkArgument(!password.isBlank(), "La contraseña esta vacia");

            //Verificar intentos fallidos
            Integer intentos = LoginCache.loginAttempts.getIfPresent(username);
            if (intentos != null && intentos >= 3) {
                request.setAttribute("error", "Demasiado intentos fallidos. Intentar mas tarde");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
                return;
            }

            //Verificar si ya tiene sesion activa
            if (LoginCache.sessionCache.getIfPresent(username) != null) {

                response.sendRedirect(request.getContextPath() + "/vistaAdmin/dashboard.jsp");
                return;
            }

            //Verificar en la base de datos
            if (dao.autenticar(username, password)) {
                HttpSession session = request.getSession();
                com.mycompany.vikids.modelo.UsuarioAdmin admin = dao.obtenerPorUsuario(username);
                session.setAttribute("adminLogueado", admin);
                session.setAttribute("idAdmin", admin.getId());


                LoginCache.sessionCache.put(username, "activo");
                LoginCache.loginAttempts.invalidate(username);
                response.sendRedirect(request.getContextPath() + "/vistaAdmin/dashboard.jsp");


            } else {
                int nuevoIntento = intentos == null ? 1 : intentos + 1;
                LoginCache.loginAttempts.put(username, nuevoIntento);
                request.setAttribute("error", "Usuario o contraseña incorrectos (" + nuevoIntento + "intento");
                request.getRequestDispatcher("admin.jsp").forward(request, response);

            }

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Entrada invalida: " + e.getMessage());
            request.getRequestDispatcher("admin.jsp").forward(request, response);
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
