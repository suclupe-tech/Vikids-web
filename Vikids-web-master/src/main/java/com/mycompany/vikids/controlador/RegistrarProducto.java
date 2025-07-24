/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.vikids.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.nio.file.Paths;
import java.sql.Connection;
import java.rmi.ServerException;
import com.mycompany.vikids.modelo.Producto;
import com.mycompany.vikids.dao.impl.ProductoDAOImpl;
import com.mycompany.vikids.util.conexionSQL;
import net.coobird.thumbnailator.Thumbnails;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB por archivo
        maxRequestSize = 1024 * 1024 * 20 // 20 MB en total
)
@WebServlet(name = "RegistrarProducto", urlPatterns = {"/RegistrarProducto"})
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
            String stockStr = request.getParameter("stock");
            int stock = (stockStr != null && !stockStr.isEmpty()) ? Integer.parseInt(stockStr) : 0;

            String precioStr = request.getParameter("precio");
            double precio = (precioStr != null && !precioStr.isEmpty()) ? Double.parseDouble(precioStr) : 0.0;

            String categoria = request.getParameter("categoria");
            String nuevaCategoria = request.getParameter("nuevaCategoria");

            if ("otra".equals(categoria) && nuevaCategoria != null && !nuevaCategoria.isBlank()) {
                categoria = nuevaCategoria;
            }
            String marca = request.getParameter("marca");
            String nuevaMarca = request.getParameter("nuevaMarca");

            if ("otra".equals(marca) && nuevaMarca != null && !nuevaMarca.isBlank()) {
                marca = nuevaMarca;
            }
            String unidad = request.getParameter("unidad");
            String estadoStr = request.getParameter("activo");
            boolean activo = "1".equals(estadoStr);
            String rutaCarpeta = getServletContext().getRealPath("/imagen");
            File carpetaImagenes = new File(rutaCarpeta);
            if (!carpetaImagenes.exists()) {
                carpetaImagenes.mkdirs();
            }
            Part archivoImagen = request.getPart("imagen");
            String nombreArchivo = Paths.get(archivoImagen.getSubmittedFileName()).getFileName().toString();
            if (archivoImagen != null && archivoImagen.getSize() > 0 && nombreArchivo != null && !nombreArchivo.isBlank()) {
                InputStream input = archivoImagen.getInputStream();
                File destino = new File(rutaCarpeta + File.separator + nombreArchivo);

                Thumbnails.of(input)
                        .size(800, 800) // Máximo 800x800 px
                        .outputQuality(0.7f) // Calidad 70%
                        .toFile(destino);
            }

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
            prod.setActivo(activo);

            Connection conn = conexionSQL.conectar();
            if (conn == null) {
                throw new ServletException("No se pudo conectar a la base de datos");
            }

            ProductoDAOImpl dao = new ProductoDAOImpl();
            boolean exito = dao.insert(prod);

            if (exito) {
                request.setAttribute("mensaje", "Producto registrado correctamente");
                request.getRequestDispatcher("vistaAdmin/registrarProducto.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "No se pudo registrar el producto");
                request.getRequestDispatcher("vistaAdmin/registrarProducto.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServerException("Error al registrar producto", e);
        }

    }

    private String getValue(Part part) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream(), "UTF-8"));
        StringBuilder value = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            value.append(line);
        }
        return value.toString();
    }
}
