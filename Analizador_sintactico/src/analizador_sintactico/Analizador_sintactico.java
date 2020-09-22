/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizador_sintactico;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alex Ordonez
 */
public class Analizador_sintactico {
    /**
     * @param args the command line arguments
     */
    
    
    public static void main(String[] args) {
        String route="C:/Users/Alex Ordonez/Documents/NetBeansProjects/Analizador_sintactico/src/analizador_sintactico/Lexer.flex";
        String [] routeS ={"-parser", "Sintax", "C:/Users/Alex Ordonez/Documents/NetBeansProjects/Analizador_sintactico/src/analizador_sintactico/Sintax.cup"};
        try {
            generate(route, routeS);
        } catch (Exception ex) {
            Logger.getLogger(Analizador_sintactico.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static int generar(){
        return 1;
    }
    public static void generate(String route, String[] routeS) throws Exception{
        File file= new File(route);
        JFlex.Main.generate(file);
        java_cup.Main.main(routeS);
        Path rutaSym = Paths.get("C:/Users/Alex Ordonez/Documents/NetBeansProjects/Analizador_sintactico/src/analizador_sintactico/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                 Paths.get("C:/Users/Alex Ordonez/Documents/NetBeansProjects/Analizador_sintactico/sym.java"), 
                 Paths.get("C:/Users/Alex Ordonez/Documents/NetBeansProjects/Analizador_sintactico/src/analizador_sintactico/sym.java")
        );
        Path rutaSin = Paths.get("C:/Users/Alex Ordonez/Documents/NetBeansProjects/Analizador_sintactico/src/analizador_sintactico/Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                 Paths.get("C:/Users/Alex Ordonez/Documents/NetBeansProjects/Analizador_sintactico/Sintax.java"), 
                 Paths.get("C:/Users/Alex Ordonez/Documents/NetBeansProjects/Analizador_sintactico/src/analizador_sintactico/Sintax.java")
        );
        
    }
   
    
}
