/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.vikids.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.io.InputStream;

public class conexionSQL {

    private static final String config_file = "config.properties";

    public static Connection conectar() {
        Connection conn = null;

        try {
            // Cargar propiedades desde el archivo
            Properties props = new Properties();
            InputStream input = conexionSQL.class.getClassLoader().getResourceAsStream(config_file);

            if (input == null) {
                throw new RuntimeException("❌ No se encontró el archivo " + config_file);
            }

            props.load(input);

            String servidor = props.getProperty("db.server");
            String puerto = props.getProperty("db.port");
            String baseDatos = props.getProperty("db.name");
            String usuario = props.getProperty("db.user");
            String clave = props.getProperty("db.password");

            String url = "jdbc:sqlserver://" + servidor + ":" + puerto + ";databaseName=" + baseDatos + ";encrypt=false;trustServerCertificate=true";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // Cargar driver
            conn = DriverManager.getConnection(url, usuario, clave);
            System.out.println("✅ Conexión exitosa a SQL Server");

        } catch (ClassNotFoundException e) {
            System.out.println("❌ Driver JDBC no encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("❌ Error al conectar: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("❌ Error general: " + e.getMessage());
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
