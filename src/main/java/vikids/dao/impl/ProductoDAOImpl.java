/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vikids.dao.impl;

import vikids.util.conexionSQL;
import vikids.modelo.Producto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import vikids.dao.ProductoDAO;

public class ProductoDAOImpl implements ProductoDAO {

    private conexionSQL conn;

    public ProductoDAOImpl(conexionSQL conn) {
        this.conn = conn;
    }

    @Override
    public boolean insert(Producto producto) {

        String sql = "INSERT INTO dbo.producto(codigo, nombre, descripcion, stock, precio, categoria, marca, unidad, imagen ) VALUES(?,?,?,?,?,?,?,?,?)";
        try (Connection connection = conn.getConnection(); PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, producto.getCodigo());
            ps.setString(2, producto.getNombre());
            ps.setString(3, producto.getDescripcion());
            ps.setInt(4, producto.getStock());
            ps.setDouble(5, producto.getPrecio());
            ps.setString(6, producto.getCategoria());
            ps.setString(7, producto.getMarca());
            ps.setString(8, producto.getUnidad());
            ps.setString(9, producto.getImagen());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al insertar producto:" + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean update(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(String codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Producto buscarPorCodigo(String codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Producto> buscarPorNombre(String nombre) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Producto> listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
