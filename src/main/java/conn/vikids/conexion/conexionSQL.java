/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conn.vikids.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class conexionSQL {
    
    public static Connection conectar(){
        Connection conn = null;
        
        String servidor = "localhost"; // o localhost\\SQLEXPRESS si usas una instancia
        String puerto = "1433";
        String baseDatos = "BDVIKIDS";
        String usuario = "cesar"; // o tu usuario
        String clave = "123456";

        String url = "jdbc:sqlserver://localhost:1433;databaseName=BDVIKIDS;encrypt=false";

        try {
            conn = DriverManager.getConnection(url, usuario, clave);
            System.out.println("✅ Conexión exitosa a SQL Server");
        } catch (SQLException e) {
            System.out.println("❌ Error al conectar: " + e.getMessage());
        }

        return conn;
    }

    public static void main(String[] args) {
        conectar(); // Solo para probar
    }
}
