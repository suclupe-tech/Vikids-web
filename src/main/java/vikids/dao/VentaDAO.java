/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package vikids.dao;

import java.util.List;
import vikids.modelo.Cliente;
import vikids.modelo.Venta;

public interface VentaDAO {
  boolean insert(Venta venta);
   boolean update(Venta venta);
   boolean delete(int idVenta);
   Venta buscarPorId(int idVenta);
   List<Venta> buscarPorCliente(String idCliente);
   List<Venta> buscarPorFecha(String fecha);
   List<Venta> listarTodos();  
}
