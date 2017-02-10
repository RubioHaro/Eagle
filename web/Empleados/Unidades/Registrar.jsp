<%-- 
    Document   : Consultas
    Created on : 01-dic-2016, 5:03:32
    Author     : Rod e Hiram
--%>
<%@page import="Usuarios.Usuario"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "EAGLE VISION";
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
        <%            Usuario consulta = (Usuario) sesion.getAttribute("UsuarioConsultado");
            if (consulta != null) {
                sesion.removeAttribute("UsuarioConsultado");

        %>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col col-md-6">
                        <h1>Nombre: <%out.println(consulta.getNombre());%></h1>
                        <h2>Apellido Paterno: <%out.println(consulta.getApellidop());%></h2>
                        <h2>Apellido Materno: <%out.println(consulta.getApellidom());%></h2>
                        <h2>Identificador: <%out.println(consulta.getIdusuario());%></h2>
                        <h2>Tipo: <%out.println(consulta.getTipo());%></h2>
                        <div>
                            <button class="btn btn-primary">Modificar <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            <button class="btn btn-danger">Eliminar <span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>
                            <button class="btn btn-warning">Enviar Mensaje <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></button>
                                <%
                                    if (consulta.getTipo().equals("Colaborador")) {


                                %>
                            <button class="btn btn-success">Pagar <span class="glyphicon glyphicon-usd" aria-hidden="true"></span></button>
                                <%                                } else {

                                    }
                                %>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img alt="Foto Usuario" src="../../Img/SinImagen.png" class="img-responsive" />

                    </div>
                </div>

            </div>
        </div>
        <%
            consulta = null;
        } else {
        %>
        <div class="container">
            <div class="jumbotron">
                <h1>Buscar Usuario</h1>
                <form method="post" action="/Consultar">
                    <div class="input-group">
                        <input required="" type="text" name="Buscar" class="form-control" placeholder="TERMINO DE BUSQUEDA">
                        <div title="Buscar" class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>                       
                    <div class="row">
                        <div class="col-md-6">
                            <h3>Filtros de Busqueda</h3>
                            <div title="Buscar con el Email" class="radio">
                                <label><input type="radio" value="Name" name="optradio"/>Nombre o Apellidos</label>
                            </div>                            
                            <div title="Buscar con el Email" class="radio">
                                <label><input type="radio" value="Correo" name="optradio">Correo Electronico</label>
                            </div>
                            <div title="Buscar con el Id"  class="radio">
                                <label><input type="radio" checked value="Id" name="optradio">Identificador de Usuario</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h3>Tipo de Usuario</h3>
                            <div title="Colaborador" class="radio">
                                <label><input type="radio" value="Empleado" name="User"/>Colaborador</label>
                            </div>                            
                            <div title="Cliente" class="radio">
                                <label><input type="radio" checked value="Cliente" name="User">Cliente</label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <%
            }
        %>
        <%@include file="../../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalCerrarSesion.jsp" %> 
    </body>
</html>
