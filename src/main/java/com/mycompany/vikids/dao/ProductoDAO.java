/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.vikids.dao;

import java.util.List;
import com.mycompany.vikids.modelo.Producto;

public interface ProductoDAO {
    
   boolean insert(Producto producto);
   boolean update(Producto producto);
   boolean delete(String codigo);
   Producto buscarPorCodigo(String codigo);
   List<Producto> buscarPorNombre(String nombre);
   List<Producto> listarTodos();
   List<Producto> listarPaginado(int offset, int limit);
   int contarProductos();
   boolean desactivar(String codigo);
   boolean reactivar(String codigo);
   List<Producto> listarInactivos();
}
