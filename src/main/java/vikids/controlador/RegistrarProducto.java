/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vikids.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.nio.file.Paths;
import java.rmi.ServerError;
import java.rmi.ServerException;
import vikids.modelo.Producto;
import vikids.dao.impl.ProductoDAOImpl;
import vikids.util.conexionSQL;

/**
 *
 * @author USER
 */
@WebServlet(name = "RegistrarProducto", urlPatterns = {"/RegistrarProducto"})
@MultipartConfig
public class RegistrarProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String codigo = request.getParameter("codigo");
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            int stock = Integer.parseInt(request.getParameter("stock"));
            double precio = Double.parseDouble("precio");
            String categoria = request.getParameter("categoria");
            String marca = request.getParameter("marca");
            String unidad = request.getParameter("unidad");
            Part archivoImagen = request.getPart("imagen");
            String nombreArchivo = Paths.get(archivoImagen.getSubmittedFileName()).getFileName().toString();

            String rutaCarpeta = getServletContext().getRealPath("/imagen");
            File carpetaImagenes = new File(rutaCarpeta);
            if (!carpetaImagenes.exists()) {
                carpetaImagenes.mkdirs();
            }
            archivoImagen.write(rutaCarpeta + File.separator + nombreArchivo);

            Producto prod = new Producto();
            prod.setCodigo(codigo);
            prod.setNombre(nombre);
            prod.setDescripcion(descripcion);
            prod.setStock(stock);
            prod.setPrecio(precio);
            prod.setCategoria(categoria);
            prod.setMarca(marca);
            prod.setUnidad(unidad);
            prod.setImagen(nombreArchivo);

            ProductoDAOImpl dao = new ProductoDAOImpl((conexionSQL) conexionSQL.conectar());
            boolean exito = dao.insert(prod);

            if (exito) {
                request.setAttribute("mensaje", "Producto registrado correctamente");
            } else {
                request.setAttribute("error", "No se pudo registrar el producto");
                request.getRequestDispatcher("registarProducto.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServerException("Error al registrar producto", e);
        }
    }
}
