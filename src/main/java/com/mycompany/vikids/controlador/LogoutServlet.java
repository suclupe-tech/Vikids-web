/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.mycompany.vikids.util.LoginCache;

/**
 *
 * @author USER
 */
@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession(false);
        if (sesion != null) {

            Object usuarioObj = sesion.getAttribute("adminLogueado");

            if (usuarioObj instanceof com.mycompany.vikids.modelo.UsuarioAdmin) {
                com.mycompany.vikids.modelo.UsuarioAdmin admin = (com.mycompany.vikids.modelo.UsuarioAdmin) usuarioObj;
                String usuario = admin.getUsuario();
                if (LoginCache.sessionCache != null) {
                    LoginCache.sessionCache.invalidate(usuario);
                    System.out.println("✅ Sesión de " + usuario + " invalidada del cache.");
                }
            }

            sesion.invalidate();
            System.out.println("🧼 Sesión cerrada completamente.");
        }

        response.sendRedirect(request.getContextPath() + "/vistaAdmin/admin.jsp?logout=1");
    }

}
