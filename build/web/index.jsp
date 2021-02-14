<%-- 
    Document   : index
    Created on : 8/11/2020, 12:41:03
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
        <form action="srvPremiacion" method="POST"> 
        <table>
            <tr>
                <td>Ingrese el Nombre:</td>
                <td><input type="text" name="txtNombre"></td>
            </tr>
             <tr>
                <td>Ingrese la descripcion:</td>
                <td><input type="text" name="txtDescripcion"></td>
            </tr>
             <tr>
                <td>Ingrese el lugar:</td>
                <td><input type="text" name="txtLugar"></td>
            </tr>
        </table>
               <button type="submit" name="btnAceptar">Enviar</button>
               <a href="actualizarPremiacion.jsp" class="btn btn-outline-dark">Actualizar</a>
               <a href="deletePremiacion.jsp" class="btn btn-outline-dark" name="btnUpdate">Eliminar</a>
        </form>
      
         <%
                if(request.getAttribute("operacion")!=null){
                    if((Integer)request.getAttribute("operacion")==1){
                        
                        %>
                        <script> alert("registro almacenado");</script>
                        <%
                    }
                else{
                  %>
                  <script> alert("error en el registro");</script>
                  <%
                     }


                         }
%>
        
    </body>
</html>
