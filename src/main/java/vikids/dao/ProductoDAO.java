/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package vikids.dao;

import java.util.List;
import vikids.modelo.Producto;

public interface ProductoDAO {
    
   boolean insert(Producto producto);
   boolean update(Producto producto);
   boolean delete(String codigo);
   Producto buscarPorCodigo(String codigo);
   List<Producto> buscarPorNombre(String nombre);
   List<Producto> listarTodos();
}
