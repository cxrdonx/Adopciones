/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

    
public class conexion {
    public static Connection conn=null;  
    private static String bd = "sistema";
    public static String usuario = "system"; 
    public static String passw = "admin";
    public static String url = "jdbc:oracle:thin:@localhost:1521:sistema";

public Connection abrir(){
     try{
        Class.forName("oracle.jdbc.OracleDriver");
        conn = DriverManager.getConnection(url,usuario,passw);
        System.out.println("Conexión exitosa:"+conn);
    
    }catch (Exception e) {
    System.out.println("Error en la conexion...");
    e.printStackTrace();
       return null; 
    }
       return conn; 
  }
     public static void cerrar(){
       try{
          if(conn != null)
           conn.close();
      } catch (Exception e){
      System.out.println("Error: No se logro cerrar la conexion:\n"+e);
  }
 }
    
}

