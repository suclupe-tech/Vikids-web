/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package vikids.test;

import com.mycompany.vikids.util.HashUtil;

/**
 *
 * @author USER
 */
public class TestPassword {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String hash = "$2a$12$6PtVYwplAqYbQXE6ke5BQ.3U.K3pW9A4r4gF5aFz1JKlrNmAdFoeG"; // copia tu hash aquí
        String intento = "admin123";

        boolean resultado = HashUtil.checkPassword(intento, hash);
        System.out.println("¿La contraseña coincide? " + resultado);
    }

}
