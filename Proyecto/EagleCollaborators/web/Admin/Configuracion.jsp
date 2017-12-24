<%-- 
    Document   : Configuracion
    Created on : 12/03/2017, 08:05:51 PM
    Author     : chavo
--%>

<%@page import="Usuarios.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "Modificar Usuario";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");            
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        

        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function confirmar(title){
                var c = confirm('¿Estas seguro qué deseas ' + title + ' a este usuario?(Se registrara el cambio)');
                return c;
            }
        </script>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.jspf" %>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col col-md-6">
                        <form method="POST" onsubmit="return confirmar('Modificar')" action="/ActualizarUsuario">
                            <input name="ID" value="<%out.println(User.getIdusuario());%>" style="visibility:hidden" class="form-control" id="disabledInput" type="text"/>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID" class="control-label">Identificador de Usuario:</label>
                                        <input value="<%out.println(User.getIdusuario());%>" disabled required class="form-control" id="disabledInput" type="text"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Nombre">Nombre:</label>
                                        <input name="Nombre" value="<%out.println(User.getNombre());%>" type="text" required class="form-control" id="Nombre"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ApellidoPaterno">Apellido Paterno:</label>
                                        <input name="ApellidoPaterno" value="<%out.println(User.getApellidop());%>" type="text" required class="form-control" id="ApellidoPaterno"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ApellidoMaterno">Apellido Materno:</label>
                                        <input name="ApellidoMaterno" value="<%out.println(User.getApellidom());%>" type="text" required class="form-control" id="ApellidoMaterno"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Email">Correo Electronico:</label>
                                <input name="Email" value="<%out.println(User.getMail());%>" type="mail" class="form-control" required id="Mail"/>
                            </div>
                            <div class="form-group">
                                <label for="Password">Ingresa tu password para modificar:</label>
                                <input name="Password" value="<%out.println(User.getMail());%>" type="password" class="form-control" required id="Password"/>
                            </div>
                            <button type="submit" class="btn btn-default">Guardar</button>
                        </form>                        
                    </div>
                    <div class="col-md-6">
                        <img alt="Foto Usuario" src="../../Img/SinImagen.png" class="img-responsive" />
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
