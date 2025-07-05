/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.dao.impl.UsuarioAdminDAOImpl;
import com.mycompany.vikids.util.conexionSQL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

/**
 *
 * @author USER
 */
@WebServlet(name = "DesactivarUsuario", urlPatterns = {"/DesactivarUsuario"})
public class DesactivarUsuario extends HttpServlet {

    UsuarioAdminDAOImpl dao = new UsuarioAdminDAOImpl(new conexionSQL());
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       try {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.cambiarEstado(id, 0); // 0 = inactivo
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("vistaAdmin/usuarios.jsp");
    }

   
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
