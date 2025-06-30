/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.vikids.dao.impl;

import com.mycompany.vikids.util.conexionSQL;
import com.mycompany.vikids.modelo.UsuarioAdmin;
import com.mycompany.vikids.util.HashUtil;
import java.sql.*;
import java.util.List;
import com.mycompany.vikids.dao.UsuarioAdminDAO;
import com.mycompany.vikids.modelo.UsuarioAdmin;
import java.util.ArrayList;

public class UsuarioAdminDAOImpl implements UsuarioAdminDAO {

    private conexionSQL conn;

    public UsuarioAdminDAOImpl(conexionSQL conn) {
        this.conn = conn;
    }

    private boolean validarUsuarioAdmin(UsuarioAdmin u) {
        return u != null
                && u.getNombre() != null && !u.getNombre().isBlank()
                && u.getApellido() != null && !u.getApellido().isBlank()
                && u.getUsuario() != null && !u.getUsuario().isBlank()
                && (u.getContraseña() != null && !u.getContraseña().isBlank() || u.getId() > 0) // Permitir contraseña vacía solo en update
                && u.getTelefono() != null && !u.getTelefono().isBlank();
    }

    @Override
    public boolean insert(UsuarioAdmin usuario) {

        if (!validarUsuarioAdmin(usuario)) {
            System.out.println("Usuario inválido");
            return false;
        }
        String sql = "INSERT INTO administrador (nombre, usuario, contraseña, telefono) VALUES (?, ?, ?, ?)";
        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getUsuario());
            ps.setString(3, HashUtil.hashPassword(usuario.getContraseña()));
            ps.setString(4, usuario.getTelefono());
            ps.setBoolean(5, usuario.isActivo());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(UsuarioAdmin usuario) {
        if (!validarUsuarioAdmin(usuario)) {
            System.out.println("Usuario inválido");
            return false;
        }

        String sql = "UPDATE administrador SET nombre = ?, apellido = ?, usuario = ?, telefono = ?, estado = ? WHERE id = ?";
        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getUsuario());
            ps.setString(4, usuario.getTelefono());
            ps.setBoolean(5, usuario.isActivo()); // ← esta línea es necesaria
            ps.setInt(6, usuario.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int idUsuario) {
        if (idUsuario <= 0) {
            return false;
        }

        String sql = "DELETE FROM administrador WHERE id = ?";
        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public UsuarioAdmin buscarPorId(int idUsuario) {
        String sql = "SELECT * FROM administrador WHERE id = ?";
        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapUsuario(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<UsuarioAdmin> buscarPorNombre(String nombre) {
        List<UsuarioAdmin> lista = new ArrayList<>();
        String sql = "SELECT * FROM administrador WHERE nombre LIKE ?";
        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + nombre + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                lista.add(mapUsuario(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public List<UsuarioAdmin> listarTodos() {
        List<UsuarioAdmin> lista = new ArrayList<>();
        String sql = "SELECT * FROM administrador";
        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                lista.add(mapUsuario(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public boolean autenticar(String usuario, String contraseña) {

        String sql = "SELECT contraseña FROM administrador WHERE usuario = ?";

        try (Connection connection = conn.getConnection()) {

            if (connection == null) {
                System.out.println("❌ La conexión SQL es null. Verifica el driver y la URL de conexión.");
                return false;
            }

            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, usuario);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String hashAlmacenado = rs.getString("contraseña");
                    System.out.println("✅ Usuario encontrado en BD");
                    System.out.println("Hash en BD: " + hashAlmacenado);
                    boolean validacion = HashUtil.checkPassword(contraseña, hashAlmacenado);
                    System.out.println("Resultado validación: " + validacion);
                    return validacion;
                } else {
                    System.out.println("❌ Usuario no encontrado en BD");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    private UsuarioAdmin mapUsuario(ResultSet rs) throws SQLException {
        UsuarioAdmin u = new UsuarioAdmin();
        u.setId(rs.getInt("id"));
        u.setNombre(rs.getString("nombre"));
        u.setApellido(rs.getString("apellido"));
        u.setUsuario(rs.getString("usuario"));
        u.setTelefono(rs.getString("telefono"));
        u.setActivo(rs.getBoolean("activo"));

        return u;
    }

}
