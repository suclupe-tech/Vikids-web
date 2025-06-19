/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.vikids.dao;

import java.util.List;
import com.mycompany.vikids.modelo.Pedido;

public interface PedidoDAO {
   boolean insert(Pedido pedido);
   boolean update(Pedido pedido);
   boolean delete(int idPedido);
   Pedido buscarPorId(int idPedido);
   List<Pedido> buscarPorCliente(int idCliente);
   List<Pedido> buscarPorEstado(String estado);
   List<Pedido> buscarPorFecha(String fecha);
   List<Pedido> listarTodos();
}
