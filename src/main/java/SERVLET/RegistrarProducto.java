/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "RegistrarProducto", urlPatterns = {"/RegistrarProducto"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 5, // 5MB
        maxRequestSize = 1024 * 1024 * 10 // 10MB
)
public class RegistrarProducto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Obtener datos del formulario
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        String stock = request.getParameter("stock");
        String precio = request.getParameter("precio");
        String categoria = request.getParameter("categoria");
        String marca = request.getParameter("marca");
        String unidad = request.getParameter("unidad");

        // 2. Obtener imagen
        Part filePart = request.getPart("imagen");
        String fileName = filePart.getSubmittedFileName();

        // 3. Ruta donde se guardará la imagen
        String uploadPath = getServletContext().getRealPath("") + File.separator + "imagenes";

        // 4. Crear la carpeta si no existe
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // 5. Guardar archivo
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);
// 6. Guardar en base de datos
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=BDVIKIDS;encrypt=false";
            String user = "cesar";
            String password = "123456";

            Connection conn = DriverManager.getConnection(url, user, password);

            String sql = "INSERT INTO Producto (codigo, nombre, stock, precio, categoria, marca, unidad, imagen) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, codigo);
            stmt.setString(2, nombre);
            stmt.setInt(3, Integer.parseInt(stock));
            stmt.setBigDecimal(4, new java.math.BigDecimal(precio));
            stmt.setString(5, categoria);
            stmt.setString(6, marca);
            stmt.setString(7, unidad);
            stmt.setString(8, fileName); // nombre del archivo, no la ruta completa

            stmt.executeUpdate();
            stmt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al guardar en la base de datos: " + e.getMessage());
            return;
        }
        // 6. Mostrar confirmación (puedes cambiar esto luego por guardar en BD)
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><body>");
            out.println("<h2>Producto registrado correctamente</h2>");
            out.println("<p>Código: " + codigo + "</p>");
            out.println("<p>Nombre: " + nombre + "</p>");
            out.println("<p>Stock: " + stock + "</p>");
            out.println("<p>Precio: " + precio + "</p>");
            out.println("<p>Categoría: " + categoria + "</p>");
            out.println("<p>Marca: " + marca + "</p>");
            out.println("<p>Unidad: " + unidad + "</p>");
            out.println("<p>Imagen: " + fileName + "</p>");
            out.println("</body></html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("Acceso no permitido por GET.");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para registrar productos con imagen";
    }
}
