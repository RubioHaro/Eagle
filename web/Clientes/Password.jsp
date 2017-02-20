<%-- 
    Document   : Password
    Created on : 19-feb-2017, 20:24:23
    Author     : Rod
--%>
<%@page import="Usuarios.Usuario"%>
<%@include file="../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "Cambiar password";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../WEB-INF/jspf/ModalError.jspf" %>        

        <%@include file="../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambiar password</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/Clientes/nvar.html" %> 
        <div class="container">
            <div class="jumbotron">
                <form method="POST" action="/ModificarUsuarios">
                    <h1>Cambio de password</h1>
                    <br/>
                    <div class="form-group">
                        <label for="Password1">Ingresa tu password ANTERIOR:</label>
                        <input name="Password1" type="password" class="form-control" required id="Password1"/>
                    </div>
                    <div class="form-group">
                        <label for="Password2">Ingresa tu NUEVA password :</label>
                        <input name="Password2" type="password" class="form-control" required id="Password2"/>
                    </div>
                    <div class="form-group">
                        <button name="IDUsuario" value="<%out.println(User.getIdusuario());%>" class="btn btn-primary">Cambiar password
                            <span class="glyphicon glyphicon-wrench" aria-hidden="true">                                        
                            </span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="../WEB-INF/jspf/Clientes/ModalCerrarSesion.jsp" %> 
    </body>
</html>
