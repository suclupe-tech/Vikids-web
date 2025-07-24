/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.vikids.dao.impl;

import com.mycompany.vikids.modelo.Producto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.mycompany.vikids.dao.ProductoDAO;
import com.mycompany.vikids.util.conexionSQL;

public class ProductoDAOImpl implements ProductoDAO {

    private Connection conn;

    public ProductoDAOImpl() {
        this.conn = conexionSQL.getConnection();
    }

    private boolean validarProducto(Producto p) {
        return p != null
                && p.getCodigo() != null && !p.getCodigo().isBlank()
                && p.getNombre() != null && !p.getNombre().isBlank()
                && p.getDescripcion() != null && !p.getDescripcion().isBlank()
                && p.getCategoria() != null && !p.getCategoria().isBlank()
                && p.getMarca() != null && !p.getMarca().isBlank()
                && p.getUnidad() != null && !p.getUnidad().isBlank()
                && p.getImagen() != null && !p.getImagen().isBlank()
                && p.getPrecio() >= 0
                && p.getStock() >= 0;
    }

    @Override
    public boolean insert(Producto producto) {
        if (!validarProducto(producto)) {
            System.out.println("Producto inválido");
            return false;
        }

        String sql = "INSERT INTO dbo.producto(codigo, nombre, descripcion, stock, precio, categoria, marca, unidad, imagen, activo) VALUES(?,?,?,?,?,?,?,?,?,?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, producto.getCodigo());
            ps.setString(2, producto.getNombre());
            ps.setString(3, producto.getDescripcion());
            ps.setInt(4, producto.getStock());
            ps.setDouble(5, producto.getPrecio());
            ps.setString(6, producto.getCategoria());
            ps.setString(7, producto.getMarca());
            ps.setString(8, producto.getUnidad());
            ps.setString(9, producto.getImagen());
            ps.setBoolean(10, producto.getActivo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al insertar producto: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean update(Producto producto) {
        if (!validarProducto(producto)) {
            System.out.println("Producto inválido");
            return false;
        }

        String sql = "UPDATE producto SET nombre = ?, descripcion = ?, stock = ?, precio = ?, categoria = ?, marca = ?, unidad = ?, imagen = ? WHERE codigo = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setInt(3, producto.getStock());
            ps.setDouble(4, producto.getPrecio());
            ps.setString(5, producto.getCategoria());
            ps.setString(6, producto.getMarca());
            ps.setString(7, producto.getUnidad());
            ps.setString(8, producto.getImagen());
            ps.setString(9, producto.getCodigo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al actualizar producto:");
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(String codigo) {
        String sql = "DELETE FROM producto WHERE codigo = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, codigo);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al eliminar producto:");
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Producto buscarPorCodigo(String codigo) {
        Producto producto = null;
        String sql = "SELECT * FROM producto WHERE codigo = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, codigo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                producto = new Producto();
                producto.setId(rs.getInt("id"));
                producto.setCodigo(rs.getString("codigo"));
                producto.setNombre(rs.getString("nombre"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setStock(rs.getInt("stock"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setCategoria(rs.getString("categoria"));
                producto.setMarca(rs.getString("marca"));
                producto.setUnidad(rs.getString("unidad"));
                producto.setImagen(rs.getString("imagen"));
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar producto por código:");
            e.printStackTrace();
        }
        return producto;
    }

    @Override
    public List<Producto> buscarPorNombre(String nombre) {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM producto WHERE nombre LIKE ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + nombre + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(crearProductoDesdeRS(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar productos por nombre:");
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public List<Producto> listarTodos() {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM producto WHERE activo = 1";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(crearProductoDesdeRS(rs));
            }
        } catch (SQLException e) {
            System.out.println("Error al listar productos: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public List<Producto> listarPaginado(int offset, int limit) {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM producto WHERE activo = 1 ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, offset);
            ps.setInt(2, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(crearProductoDesdeRS(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public int contarProductos() {
        String sql = "SELECT COUNT(*) FROM producto";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean desactivar(String codigo) {
        String sql = "UPDATE producto SET activo = 0 WHERE codigo = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, codigo);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error al desactivar producto:");
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Producto> listarInactivos() {
        List<Producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM producto WHERE activo = 0";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(crearProductoDesdeRS(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public boolean reactivar(String codigo) {
        String sql = "UPDATE producto SET activo = 1 WHERE codigo = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, codigo);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método auxiliar para crear un producto desde ResultSet
    private Producto crearProductoDesdeRS(ResultSet rs) throws SQLException {
        Producto producto = new Producto();
        producto.setId(rs.getInt("id"));
        producto.setCodigo(rs.getString("codigo"));
        producto.setNombre(rs.getString("nombre"));
        producto.setDescripcion(rs.getString("descripcion"));
        producto.setStock(rs.getInt("stock"));
        producto.setPrecio(rs.getDouble("precio"));
        producto.setCategoria(rs.getString("categoria"));
        producto.setMarca(rs.getString("marca"));
        producto.setUnidad(rs.getString("unidad"));
        producto.setImagen(rs.getString("imagen"));
        producto.setActivo(rs.getBoolean("activo"));
        return producto;
    }

    public boolean publicar(int idProducto) {
    String sql = "UPDATE producto SET publicado = 1 WHERE id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, idProducto);
        int filas = ps.executeUpdate();
        return filas > 0;
    } catch (SQLException e) {
        System.out.println("Error al publicar el producto: " + e.getMessage());
        return false;
    }
}


    public List<Producto> listarPublicadosPorCategoria(String categoria) {
    List<Producto> lista = new ArrayList<>();
    String sql = "SELECT * FROM producto WHERE activo = 1 AND publicado = 1 AND categoria = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, categoria);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            lista.add(crearProductoDesdeRS(rs));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return lista;
}


}
