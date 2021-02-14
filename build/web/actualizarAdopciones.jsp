<%-- 
    Document   : actualizarAdopciones
    Created on : 8/11/2020, 18:49:30
    Author     : mared
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
           
          
          <script>
            $(document).ready( function(){
                $("#submit").click(
                function(){
                    var mascota =$("#txtId").val();
                    $.get('srvBuscarAdopciones',{nmascota:mascota}, function(datos)
                    {
                      if(datos.length>0)
                      {
                        var pegados =datos.split("|");
                        var fecha = pegados[0];
                        var usuario = pegados[1];
                        var mascota = pegados[2];
                       
                             
                            $("#txtFecha").val(fecha);
                            $("#txtUsuario").val(usuario);
                            $("#txtMascota").val(mascota);
                           
                      }
                      else
                      {
                           $("#txtFecha").val("");
                            $("#txtUsuario").val("");
                            $("#txtMascota").val("");
                            
                            
                      }
                    }
                   );
                }        
                );
                    
                    
                $("#enviar").click(
                function(){
                    var id =$("#txtId").val();
                    var fecha =$("#txtFecha").val();
                    var usuario =$("#txtUsuario").val();
                    var mascota =$("#txtMascota").val();
                   
                    $.get('srvUpdateAdopcion',{nid:id,nfecha:fecha,nusuario:usuario,nmascota:mascota}, function(datos)
                    {
                      if(datos.length>0)
                      {
                         alert("la adopcion ha sido actualizada");
                         $("#txtFecha").val("");
                         $("#txtUsuario").val("");
                         $("#txtMascota").val("");
                      
                      }
                      else
                      {
                          alert("no se ha podido actualizar");
                      }
                       
                    }
                   );
                }        
                );
        
        
        
        
             }
            );
                    
            
        </script>
        <div>
        <table>
            <tr>
                <td>Ingresar el ID para buscar:</td>
                <td><input type="text" name="txtId" id="txtId"></td>
                <td><input type="submit" value="Buscar" id="submit"></td>
            </tr>
            
             <tr>
                <td>Fecha:</td>
                <td><input type="text" name="txtFecha" id="txtFecha"></td>
            </tr>
             <tr>
                <td>Usuario:</td>
                <td><input type="text" name="txtUsuario" id="txtUsuario"></td>
            </tr>
             <tr>
                <td>Mascota:</td>
                <td><input type="text" name="txtMascota" id="txtMascota"></td>
            </tr>
        </table>
               <button type="submit" name="enviar" id="enviar">Actualizar</button>
                
   </div>
                               
                
         <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
