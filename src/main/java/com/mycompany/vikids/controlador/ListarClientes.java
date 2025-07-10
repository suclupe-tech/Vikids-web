/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import com.mycompany.vikids.dao.impl.ClienteDAOImpl;
import com.mycompany.vikids.modelo.Cliente;
import com.mycompany.vikids.util.conexionSQL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListarClientes", urlPatterns = {"/ListarClientes"})
public class ListarClientes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ClienteDAOImpl dao = new ClienteDAOImpl(new conexionSQL());
        List<Cliente> listaClientes = dao.listarTodos();

        request.setAttribute("clientes", listaClientes);
        request.getRequestDispatcher("vistaAdmin/clientes.jsp").forward(request, response);
    }
}
