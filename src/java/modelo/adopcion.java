
package modelo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author mared
 */
public class adopcion {
      private Connection conn;
    private Statement stm;
    private ResultSet rs;
    
  public adopcion(){
      this.conn = null;
      this.stm = null;
  }
    
    
     public String buscarAdopciones(int id){
       
   String resultado="";         
        conexion cn = new conexion();
        rs=null;
        try{
        conn=cn.abrir();
        stm=conn.createStatement();
        rs=stm.executeQuery("select * from adopcion where id ='" + id + "' ");
        
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
     public int actualizarAdopcion(int id, String fecha, String usuario, String mascota){
       int r=0;
       conexion cn  = new conexion();
       conn = cn.abrir();
       try{
          
           stm = conn.createStatement();
           r = stm.executeUpdate("update adopcion set fecha='" + fecha + "',usuario='" + usuario + "', mascota='" + mascota + "'"
                   +"where id="+id+" ");
      
           cn.cerrar();
           conn.close();
           stm.close();
           return r;
     
       }
       catch(Exception e){
           return 0;
       }
   }
    
}
