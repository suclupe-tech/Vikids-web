/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.vikids.dao.impl;

import com.mycompany.vikids.dao.VentaDAO;
import com.mycompany.vikids.modelo.DetalleVenta;
import com.mycompany.vikids.modelo.Venta;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USER
 */
public class VentaDAOImpl implements VentaDAO {

    private Connection conn;

    public VentaDAOImpl(Connection conn) {
        this.conn = conn;
    }

    public VentaDAOImpl() {
        throw new UnsupportedOperationException("Constructor sin conexión no soportado.");
    }

    private boolean validarVenta(Venta venta, List<DetalleVenta> detalles) {
        if (venta == null) {
            System.out.println("❌ Error: el objeto Venta es null");
            return false;
        }
        if (venta.getTipoComprobante() == null || venta.getTipoComprobante().isBlank()) {
            System.out.println("❌ Error: tipoComprobante inválido");
            return false;
        }
        if (venta.getNumeroComprobante() == null || venta.getNumeroComprobante().isBlank()) {
            System.out.println("❌ Error: numeroComprobante inválido");
            return false;
        }
        if (venta.getFecha() == null) {
            System.out.println("❌ Error: fecha inválida");
            return false;
        }
        if (venta.getIdCliente() <= 0) {
            System.out.println("❌ Error: ID del cliente inválido (" + venta.getIdCliente() + ")");
            return false;
        }
        if (venta.getIdAdmin() <= 0) {
            System.out.println("❌ Error: ID del admin inválido (" + venta.getIdAdmin() + ")");
            return false;
        }
        if (venta.getTotal() < 0) {
            System.out.println("❌ Error: total inválido (" + venta.getTotal() + ")");
            return false;
        }
        if (venta.getIgv() < 0) {
            System.out.println("❌ Error: IGV inválido (" + venta.getIgv() + ")");
            return false;
        }
        if (venta.getTipoPago() == null || venta.getTipoPago().isBlank()) {
            System.out.println("❌ Error: tipoPago inválido");
            return false;
        }
        if (venta.getEstado() == null || venta.getEstado().isBlank()) {
            System.out.println("❌ Error: estado inválido");
            return false;
        }
        if (detalles == null || detalles.isEmpty()) {
            System.out.println("❌ Error: la lista de productos está vacía");
            return false;
        }

        // Si todo está bien:
        System.out.println("✅ Validación de venta exitosa");
        return true;
    }

    @Override
    public boolean guardarVentaConDetalle(Venta venta, List<DetalleVenta> detalles) {

        if (!validarVenta(venta, detalles)) {
            System.out.println("❌ Venta inválida. Revisa los datos recibidos.");
            return false;
        }

        System.out.println(" Insertando venta con: "
                + "cliente=" + venta.getIdCliente()
                + ", admin=" + venta.getIdAdmin()
                + ", total=" + venta.getTotal()
                + ", productos=" + detalles.size());

        String sqlVenta = "INSERT INTO venta (fecha, id_cliente, id_admin, total, descuento, tipo_comprobante, numero_comprobante, igv, tipo_pago, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlDetalle = "INSERT INTO detalle_venta (id_venta, id_producto, nombre_producto, cantidad, precio_unitario, subtotal) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            conn.setAutoCommit(false); // Iniciar transacción

            // Insertar venta
            PreparedStatement psVenta = conn.prepareStatement(sqlVenta, Statement.RETURN_GENERATED_KEYS);
            psVenta.setTimestamp(1, java.sql.Timestamp.valueOf(venta.getFecha()));
            psVenta.setInt(2, venta.getIdCliente());
            psVenta.setInt(3, venta.getIdAdmin());
            psVenta.setDouble(4, venta.getTotal());
            psVenta.setDouble(5, venta.getDescuento());
            psVenta.setString(6, venta.getTipoComprobante());
            psVenta.setString(7, venta.getNumeroComprobante());
            psVenta.setDouble(8, venta.getIgv());
            psVenta.setString(9, venta.getTipoPago());
            psVenta.setString(10, venta.getEstado());

            int filasAfectadas = psVenta.executeUpdate();

            if (filasAfectadas == 0) {
                conn.rollback();
                System.out.println("❌ No se insertó la venta");
                return false;
            }

            // Obtener ID generado
            ResultSet rs = psVenta.getGeneratedKeys();
            if (!rs.next()) {
                conn.rollback();
                System.out.println("❌ No se obtuvo el ID generado");
                return false;
            }

            int idVentaGenerada = rs.getInt(1);
            System.out.println("✅ Venta registrada con ID: " + idVentaGenerada);

            // Insertar detalles
            for (DetalleVenta detalle : detalles) {
                PreparedStatement psDetalle = conn.prepareStatement(sqlDetalle);
                psDetalle.setInt(1, idVentaGenerada);
                psDetalle.setInt(2, detalle.getIdProducto());
                psDetalle.setString(3, detalle.getNombreProducto());
                psDetalle.setInt(4, detalle.getCantidad());
                psDetalle.setDouble(5, detalle.getPrecioUnitario());
                psDetalle.setDouble(6, detalle.getSubtotal());
                psDetalle.executeUpdate();
            }

            conn.commit();
            return true;

        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Venta buscarPorId(int idVenta) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Venta> buscarPorCliente(String idCliente) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Venta> buscarPorFecha(String fecha) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Venta> listarTodos() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public String generarNumeroComprobante(String tipoComprobante) {
        String prefijo = tipoComprobante.equals("BOLETA") ? "BO-" : "FA-";
        String sql = "SELECT TOP 1 numero_comprobante FROM venta WHERE tipo_comprobante = ? ORDER BY id DESC";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, tipoComprobante);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String ultimo = rs.getString("numero_comprobante"); // Ej: "BO-000015"
                String[] partes = ultimo.split("-");
                int numero = Integer.parseInt(partes[1]) + 1;
                return prefijo + String.format("%06d", numero); // BO-000016
            }
        } catch (Exception e) {
            System.out.println("Error generando número comprobante: " + e.getMessage());
        }

        // Si no hay registros anteriores, empezamos en 1
        return prefijo + "000001";
    }

}
