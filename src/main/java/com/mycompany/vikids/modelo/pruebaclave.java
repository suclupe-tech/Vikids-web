/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package com.mycompany.vikids.modelo;

import com.mycompany.vikids.util.HashUtil;

public class pruebaclave {

    public static void main(String[] args) {
        String passwordPlano = "admin123"; // puedes cambiarla
        String hash = HashUtil.hashPassword(passwordPlano);
        System.out.println("Contraseña cifrada: " + hash);
        
        
        
    }
    
    
}

