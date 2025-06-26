/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.vikids.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexionSQL {

    public static Connection conectar() {
        Connection conn = null;

        String servidor = "localhost"; // o localhost\\SQLEXPRESS si usas una instancia
        String puerto = "1433";
        String baseDatos = "BDVIKIDS";
        String usuario = "cesar"; // o tu usuario
        String clave = "123456";

        String url = "jdbc:sqlserver://localhost:1433;databaseName=BDVIKIDS;encrypt=false;trustServerCertificate=true";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // Asegura carga del driver
            conn = DriverManager.getConnection(url, usuario, clave);
            System.out.println("✅ Conexión exitosa a SQL Server");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ Driver JDBC no encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("❌ Error al conectar: " + e.getMessage());
        }

        return conn;
    }

    public Connection getConnection() {
        return conectar();
    }

    public static void main(String[] args) {
        conectar(); // Solo para probar
    }
}
