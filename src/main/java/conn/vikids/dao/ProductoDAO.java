/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conn.vikids.dao;

import conn.vikids.conexion.conexionSQL;
import conn.vikids.entidades.Producto;
import java.sql.*;
import java.util.*;

public class ProductoDAO {

    public List<Producto> listar() {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM producto";

        Connection conn = conexionSQL.conectar();

        if (conn == null) {
            System.out.println("❌ Conexión fallida en listar().");
            return lista;
        }

        try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("product_id"));
                p.setCodigo(rs.getString("product_codigo"));
                p.setNombre(rs.getString("product_name"));
                p.setStock(rs.getInt("product_stock"));
                p.setPrecio(rs.getInt("product_precio"));
                p.setCategoria(rs.getString("product_categoria"));
                p.setMarca(rs.getString("product_marca"));
                p.setUnidad(rs.getString("product_unidad"));
                lista.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    public void insertar(Producto p) {
        String sql = "INSERT INTO producto (product_codigo, product_name, product_stock, product_precio, product_categoria, product_marca, product_unidad, imagen) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        Connection conn = conexionSQL.conectar();

        if (conn == null) {
            System.out.println("❌ Conexión fallida en insertar().");
            return;
        }

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getCodigo());
            ps.setString(2, p.getNombre());
            ps.setInt(3, p.getStock());
            ps.setInt(4, p.getPrecio());
            ps.setString(5, p.getCategoria());
            ps.setString(6, p.getMarca());
            ps.setString(7, p.getUnidad());
            ps.setString(8, p.getImagen());

            ps.executeUpdate();
            System.out.println("✅ Producto insertado correctamente.");

        } catch (SQLException e) {
            System.out.println("❌ Error al insertar producto:");
            e.printStackTrace();
        }
    }
}
