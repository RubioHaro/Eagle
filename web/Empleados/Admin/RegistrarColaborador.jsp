<%-- 
    Document   : RegistrarColaborador
    Created on : 16/02/2017, 06:34:05 PM
    Author     : chavo
--%>
<%@page import="Usuarios.Usuario"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "Agregar Colaborador";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        

        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.html" %>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col col-md-6">
                        <form method="POST" action="/RegistrarColaborador">
                            <input name="ID" style="visibility:hidden" class="form-control" id="disabledInput" type="text"/>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Nombre">Nombre:</label>
                                        <input required name="Nombre" type="text" required class="form-control" id="Nombre"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ApellidoPaterno">Apellido Paterno:</label>
                                        <input required name="ApellidoPaterno" type="text" required class="form-control" id="ApellidoPaterno"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ApellidoMaterno">Apellido Materno:</label>
                                        <input required name="ApellidoMaterno" type="text" required class="form-control" id="ApellidoMaterno"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Email">Correo Electronico:</label>
                                <input required name="Email" type="mail" class="form-control" required id="Mail"/>
                            </div>
                            <div class="form-group">
                                <label for="Password">Password:</label>
                                <input required name="Password" type="password" class="form-control" required id="Password"/>
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
