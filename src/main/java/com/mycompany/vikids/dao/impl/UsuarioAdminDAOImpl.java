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

public class UsuarioAdminDAOImpl implements UsuarioAdminDAO {

    private conexionSQL conn;

    public UsuarioAdminDAOImpl(conexionSQL conn) {
        this.conn = conn;
    }

    @Override
    public boolean insert(UsuarioAdmin usuario) {
        String sql = "INSERT INTO administrador (nombre, usuario, contraseña, telefono) VALUES (?, ?, ?, ?)";
        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getUsuario());
            ps.setString(3, usuario.getContraseña());
            ps.setString(4, usuario.getTelefono());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(UsuarioAdmin usuario) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public boolean delete(int idUsuario) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public UsuarioAdmin buscarPorId(int idUsuario) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<UsuarioAdmin> buscarPorNombre(String nombre) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<UsuarioAdmin> listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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

}
