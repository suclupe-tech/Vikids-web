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
            Object usuarioObj = sesion.getAttribute("usuario");
            if (usuarioObj != null) {
                String usuario = usuarioObj.toString();
                if (LoginCache.sessionCache != null) {
                    LoginCache.sessionCache.invalidate(usuario);
                }
            }
            sesion.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/vistaAdmin/admin.jsp?logout=1");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
}
