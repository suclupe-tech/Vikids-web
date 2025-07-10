/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.vikids.dao;

import java.util.List;
import com.mycompany.vikids.modelo.Cliente;
import com.mycompany.vikids.modelo.DetalleVenta;
import com.mycompany.vikids.modelo.Venta;

public interface VentaDAO {
   boolean guardarVentaConDetalle(Venta venta, List<DetalleVenta> detalles);
   Venta buscarPorId(int idVenta);
   List<Venta> buscarPorCliente(String idCliente);
   List<Venta> buscarPorFecha(String fecha);
   List<Venta> listarTodos();  
   
}
