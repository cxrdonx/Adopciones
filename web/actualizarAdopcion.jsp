<%-- 
    Document   : actuallizarPremiacion.jsp
    Created on : 8/11/2020, 18:17:38
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
                    var usuario =$("#txtId").val();
                    $.get('srvBuscarAdopciones',{nusuario:usuario}, function(datos)
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
                    
                    
                $("#btnActualizar").click(
                function(){
                    var usuario =$("#txtusuario").val();
                    var nombre =$("#txtNombre").val();
                    var direccion =$("#txtDireccion").val();
                    var telefono =$("#txtTelefono").val();
                    var puesto =$("#txtPuesto").val();
                    var sueldo =$("#txtSueldo").val();
                    
                    $.get('updateEmpleado',{nusuario:usuario,nnombre:nombre,ndireccion:direccion,ntelefono:telefono,npuesto:puesto,nsueldo:sueldo}, function(datos)
                    {
                      if(datos.length>0)
                      {
                          swal("Exito", "Registro Actualizado", "success");
                         $("#txtNombre").val("");
                         $("#txtDireccion").val("");
                         $("#txtTelefono").val("");
                         $("#txtPuesto").val("");
                         $("#txtSueldo").val("");
                      }
                      else
                      {
                          swal ( "Error" ,  "Error al Modificar!" ,  "error" );
                      }
                       
                    }
                   );
                }        
                );
        
        
        
        
             }
            );
                    
            
        </script>
        
          
        
        
   <div class="container well" id="containerLogin">
        <table>
            <tr>
                <td>Ingrese el ID para buscar:</td>
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
               <button type="submit" name="btnAceptar" id="actualizar">Actualizar</button>
                
   </div>
                               
                
         <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
               
    </body>
</html>
