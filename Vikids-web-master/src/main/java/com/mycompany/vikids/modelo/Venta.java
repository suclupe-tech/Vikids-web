/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.vikids.modelo;

import java.time.LocalDateTime;

public class Venta {
    
    private int id;
    private LocalDateTime fecha;
    private int idCliente;
    private int idAdmin;
    private double total;
    private double descuento;
    private String tipoComprobante;
    private String numeroComprobante;
    private double igv;
    private String tipoPago;
    private String estado;

    public Venta(int id, LocalDateTime fecha, int idCliente, int idAdmin, double total, double descuento, String tipoComprobante, String numeroComprobante, double igv, String tipoPago, String estado) {
        this.id = id;
        this.fecha = fecha;
        this.idCliente = idCliente;
        this.idAdmin = idAdmin;
        this.total = total;
        this.descuento = descuento;
        this.tipoComprobante = tipoComprobante;
        this.numeroComprobante = numeroComprobante;
        this.igv = igv;
        this.tipoPago = tipoPago;
        this.estado = estado;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getFecha() {
        return fecha;
    }

    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idUsuarioAdmin) {
        this.idAdmin = idUsuarioAdmin;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public double getIgv() {
        return igv;
    }

    public void setIgv(double igv) {
        this.igv = igv;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getTipoComprobante() {
        return tipoComprobante;
    }

    public void setTipoComprobante(String tipoComprobante) {
        this.tipoComprobante = tipoComprobante;
    }

    public String getNumeroComprobante() {
        return numeroComprobante;
    }

    public void setNumeroComprobante(String numeroComprobante) {
        this.numeroComprobante = numeroComprobante;
    }
    
    
}
