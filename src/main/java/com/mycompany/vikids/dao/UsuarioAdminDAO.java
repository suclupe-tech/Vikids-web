/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.vikids.dao;

import java.util.List;
import com.mycompany.vikids.modelo.UsuarioAdmin;

public interface UsuarioAdminDAO {
   boolean insert(UsuarioAdmin usuario);
   boolean update(UsuarioAdmin usuario);
   boolean delete(int idUsuario);
   UsuarioAdmin buscarPorId(int idUsuario);
   List<UsuarioAdmin> buscarPorNombre(String nombre);
   List<UsuarioAdmin> listarTodos();
   boolean autenticar (String usuario, String contraseña);
}
