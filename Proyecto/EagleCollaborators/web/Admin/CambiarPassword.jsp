<%-- 
    Document   : CambiarPassword
    Created on : 12/03/2017, 08:58:54 PM
    Author     : chavo
--%>
<%@page import="Usuarios.Usuario"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "Cambiar Password";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        

        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function confirmar(title) {
                var c = confirm('¿Estas seguro qué deseas ' + title + ' la contraseña?(Se registrara el cambio)');
                return c;
            }
        </script>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.jspf" %>
        <div class="container">
            <div class="jumbotron">
                <form method="POST" onsubmit="return confirmar('Modificar')" action="/CambiarPassword">                                        
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group has-feedback">
                                <label for="Password1">Nueva password:</label>
                                <input name="Password1" onkeypress="Validar1pass(Password1)" onchange="Validar1pass(Password1)" placeholder="NUEVA CONTRASEÑA" type="password" required class="form-control" id="Password1"/>
                                <span id="SpanP1" class="glyphicon form-control-feedback"></span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="Password2">REPITE tu Nueva Password:</label>
                                <input name="Password2"  placeholder="REPITE TU NUEVA CONTRASEÑA" type="password" required class="form-control" id="ApellidoMaterno"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Password3">Ingresa tu password para modificar:</label>
                        <input name="Password3" type="password" placeholder="INGRESA TU CONTRASEÑA ANTERIOR" class="form-control" required id="Password"/>
                    </div>
                    <button type="submit" class="btn btn-default center-block">Cambiar Password</button>
                </form>  
            </div>
        </div>
    </body>
</html>
