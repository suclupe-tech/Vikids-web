/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.vikids.dao;

import java.util.List;
import com.mycompany.vikids.modelo.Producto;

public interface ProductoDAO {
    
    //CRUD básico
   boolean insert(Producto producto);
   boolean update(Producto producto);
   boolean delete(String codigo);
   
   //Busquedas
   Producto buscarPorCodigo(String codigo);
   List<Producto> buscarPorNombre(String nombre);
   
   //Listado
   List<Producto> listarTodos();
   
   //Paginacion
   List<Producto> listarPaginado(int offset, int limit);
   int contarProductos();
   
   //Desactivación 
   boolean desactivar(String codigo);
   boolean reactivar(String codigo);
   List<Producto> listarInactivos();
}
