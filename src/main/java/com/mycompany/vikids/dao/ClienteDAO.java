/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.vikids.dao;
import java.util.List;
import com.mycompany.vikids.modelo.Cliente;

public interface ClienteDAO {
   boolean insert(Cliente cliente);
   boolean update(Cliente cliente);
   boolean delete(int id);
   Cliente buscarPorDni(String dni);
   List<Cliente> listarTodos();
}
