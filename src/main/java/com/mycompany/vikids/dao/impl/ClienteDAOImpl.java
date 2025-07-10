/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.vikids.dao.impl;

import com.mycompany.vikids.dao.ClienteDAO;
import com.mycompany.vikids.modelo.Cliente;
import com.mycompany.vikids.util.conexionSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USER
 */
public class ClienteDAOImpl implements ClienteDAO {

    private conexionSQL conn;

    public ClienteDAOImpl(conexionSQL conn) {
        this.conn = conn;
    }

    public ClienteDAOImpl() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
// Validar cliente antes de insertar o actualizar

    private boolean validarCliente(Cliente c) {
        return c != null
                && c.getNombre() != null && !c.getNombre().isBlank()
                && c.getApellido() != null && !c.getApellido().isBlank()
                && c.getDni() != null && c.getDni().matches("\\d{8}")
                && c.getTelefono() != null && !c.getTelefono().isBlank()
                && c.getDireccion() != null && !c.getDireccion().isBlank();
    }

    //  Verificar si un cliente ya existe por DNI
    public boolean existeClientePorDni(String dni) {
        String sql = "SELECT COUNT(*) FROM cliente WHERE dni = ?";
        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, dni);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            System.out.println("Error al verificar existencia del cliente:");
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean insert(Cliente cliente) {
        if (!validarCliente(cliente)) {
            System.out.println("Datos inválidos. No se puede insertar el cliente.");
            return false;
        }

        String sql = "INSERT INTO cliente (nombre, apellido, dni, telefono, direccion) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, cliente.getNombre().trim());
            ps.setString(2, cliente.getApellido().trim());
            ps.setString(3, cliente.getDni().trim());
            ps.setString(4, cliente.getTelefono().trim());
            ps.setString(5, cliente.getDireccion().trim());

            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (Exception e) {
            System.out.println("Error al insertar cliente:");
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Cliente cliente) {
        if (!validarCliente(cliente) || cliente.getId() <= 0) {
            System.out.println("Datos inválidos. No se puede actualizar el cliente.");
            return false;
        }

        String sql = "UPDATE cliente SET nombre = ?, apellido = ?, dni = ?, telefono = ?, direccion = ? WHERE id = ?";

        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, cliente.getNombre().trim());
            ps.setString(2, cliente.getApellido().trim());
            ps.setString(3, cliente.getDni().trim());
            ps.setString(4, cliente.getTelefono().trim());
            ps.setString(5, cliente.getDireccion().trim());
            ps.setInt(6, cliente.getId());

            int filas = ps.executeUpdate();
            return filas > 0;

        } catch (Exception e) {
            System.out.println("Error al actualizar cliente:");
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        if (id <= 0) return false;

    String sql = "DELETE FROM cliente WHERE id = ?";

    try (Connection con = conn.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, id);
        int filas = ps.executeUpdate();
        return filas > 0;
    } catch (Exception e) {
        System.out.println("Error al eliminar cliente:");
        e.printStackTrace();
        return false;
    }}

    @Override
    public Cliente buscarPorDni(String dni) {

        if (dni == null || dni.trim().isEmpty()) {
            System.out.println("DNI vacío o nulo recibido.");
            return null;
        }

        Cliente cliente = null;
        String sql = "SELECT * FROM cliente WHERE dni = ?";

        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, dni);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellido(rs.getString("apellido"));
                cliente.setDni(rs.getString("dni"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setDireccion(rs.getString("direccion"));
            } else {
                System.out.println("No se encontró cliente con DNI: " + dni);
            }

        } catch (Exception e) {
            System.out.println("Error al buscar cliente por DNI:");
            e.printStackTrace();
        }

        return cliente;
    }

    @Override
    public List<Cliente> listarTodos() {
        List<Cliente> lista = new ArrayList<>();
        String sql = "SELECT * FROM cliente ORDER BY id DESC";

        try (Connection con = conn.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Cliente c = new Cliente();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                c.setApellido(rs.getString("apellido"));
                c.setDni(rs.getString("dni"));
                c.setTelefono(rs.getString("telefono"));
                c.setDireccion(rs.getString("direccion"));
                lista.add(c);
            }

        } catch (Exception e) {
            System.out.println("Error al listar clientes:");
            e.printStackTrace();
        }

        return lista;
    }

}
