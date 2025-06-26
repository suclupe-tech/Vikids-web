/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.vikids.modelo;

import java.time.LocalDateTime;
import java.util.List;

public class Pedido {
  private int id;
  private LocalDateTime fecha;
  private int idCliente;
  private String estado;
  private double total;
  private String metodoPago;
  private String observaciones;
  private List<DetallePedido> detalles;

    public Pedido(int id, LocalDateTime fecha, int idCliente, String estado, double total, String metodoPago, String observaciones, List<DetallePedido> detalles) {
        this.id = id;
        this.fecha = fecha;
        this.idCliente = idCliente;
        this.estado = estado;
        this.total = total;
        this.metodoPago = metodoPago;
        this.observaciones = observaciones;
        this.detalles = detalles;
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

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public List<DetallePedido> getDetalles() {
        return detalles;
    }

    public void setDetalles(List<DetallePedido> detalles) {
        this.detalles = detalles;
    }
  
  
}
