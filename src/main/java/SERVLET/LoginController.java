/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nicol
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

        // Método que procesa la solicitud POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String usuario = request.getParameter("txtusuario");
        String clave = request.getParameter("txtclave");

        
        boolean credencialesCorrectas = validarCredenciales(usuario, clave);

        if (credencialesCorrectas) {
            response.sendRedirect("dashboard.jsp");
        } else {

            request.setAttribute("error", "Usuario o clave incorrectos");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
    }

    // Reemplazarlo por consulta a base de datos
    private boolean validarCredenciales(String usuario, String clave) {
        return "admin".equals(usuario) && "1234".equals(clave);
    }
}
