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
public class GeneradorHash {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
         String hash = HashUtil.hashPassword("admin123");
        System.out.println("Hash para admin123: " + hash);
    }
    
}
