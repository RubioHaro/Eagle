<%-- 
    Document   : RecuperarPassword
    Created on : 18/03/2017, 12:37:36 AM
    Author     : chavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%
            HttpSession sesion = request.getSession();
            String title = "EAGLE VISION";

        %>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>

        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <%@include file="WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="WEB-INF/jspf/AllResourcesIndex.jspf" %>        
    </head>
    <body>
        <%@include file="WEB-INF/jspf/BarraDeNavegacionIndex.html" %>
        <div class="container">
            <div class="jumbotron">
                <form method="POST" action="/RecuperarPass">
                    <h1>Recuperar Contraseña </h1>
                    <br/>
                    <div class="form-group">
                        <label for="Mail">Ingresa tu Email</label>
                        <input name="Mail" type="email" class="form-control" required id="Mail"/>
                    </div>
                    <div class="form-group">
                        <button name="IDUsuario" class="btn btn-primary">Enviar Correo
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true">                                        
                            </span>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="WEB-INF/jspf/ModalError.jspf" %>
        <%@include file="WEB-INF/jspf/ModalIniciarSesion.jspf" %>
        <%@include file="WEB-INF/jspf/ModalRegistrar.jspf" %>
        <%@include file="WEB-INF/jspf/ModalContacto.jspf" %>
    </body>
</html>
