/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author mared
 */
public class premiacion {
         
      private Connection conn;
    private Statement stm;
    private ResultSet rs;
    
    public premiacion(){
        this.conn = null;
        this.stm = null;
    }
    
    public int newPremiacion(String nombre, String descripcion, String lugar){
        int r = 0;
        conexion cn = new conexion();
        conn  = cn.abrir();
        
        try{
            stm = conn.createStatement();
            r = stm.executeUpdate("insert into premiacion(nombre,descripcion,lugar)"
                      +"values('" + nombre + "','" + descripcion + "','" + lugar + "')");
            cn.cerrar();
            conn.close();
            stm.close();
            return r;
        }
        catch(Exception e){
            return 0;
        }
    }
   public String buscarPremiacion(int id){
       
   String resultado="";         
        conexion cn = new conexion();
        rs=null;
        try{
        conn=cn.abrir();
        stm=conn.createStatement();
        rs=stm.executeQuery("select * from adopcion where id='" + id + "' ");
        
        while (rs.next()){
            resultado= rs.getString("fecha")+"|"+
                    rs.getString("usuario")+"|"+rs.getString("mascota");
        }
        cn.cerrar();
        conn.close();
        stm.close();
        
       return resultado ;
    }
    catch(Exception e){
        return null;
    }

}
   
    public int updatePremiacion(int idPremiacion, String nombre, String descripcion, String lugar){
       int r=0;
       conexion cn  = new conexion();
       conn = cn.abrir();
       try{
          
           stm = conn.createStatement();
           r = stm.executeUpdate("update premiacion set nombre='" + nombre + "',descripcion='" + descripcion + "', lugar='" + lugar + "'"
                   +"where idPremiacion="+idPremiacion+" ");
      
           cn.cerrar();
           conn.close();
           stm.close();
           return r;
     
       }
       catch(Exception e){
           return 0;
       }
   }
    
    public ArrayList <estructuras.csPremiacion> listadoPremiacion()
    {
        ArrayList <estructuras.csPremiacion> vp = new ArrayList<estructuras.csPremiacion>();
        estructuras.csPremiacion emp=null;
        
        conexion cn = new conexion();
        rs=null;
        try{
        conn=cn.abrir();
        stm=conn.createStatement();
        rs=stm.executeQuery("select * from empleado ");
        
        while (rs.next()){
            emp = new estructuras.csPremiacion(rs.getInt(1),rs.getString("nombre"),rs.getString("descripcion"),
                    rs.getString("lugar"));
            vp.add(emp);
        }
        cn.cerrar();
        conn.close();
        stm.close();
        
       return vp;
    }
    catch(Exception e){
        return null;
    }
    }

}