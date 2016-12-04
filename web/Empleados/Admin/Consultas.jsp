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
        <%            
            Usuario consulta = (Usuario) sesion.getAttribute("UsuarioConsultado");
            if (consulta != null) {
                sesion.removeAttribute("UsuarioConsultado");
        %>
        <div class="container">
            <div class="jumbotron">
                <h1>Nombre: <%out.println(consulta.getNombre());%></h1>
                <h2>Apellido Paterno: <%out.println(consulta.getApellidop());%></h2>
                <h2>Apellido Materno: <%out.println(consulta.getApellidom());%></h2>
                <h2>Identificador: <%out.println(consulta.getIdusuario());%></h2>
                <h2>Tipo: <%out.println(consulta.getTipo());%></h2>
            </div>
        </div>
        <%
        } else {
        %>
        <div class="container">
            <div class="jumbotron">
                <h1>Consultar Usuario</h1>
                <form method="post" action="/Consultar">
                    <div class="input-group">
                        <input required="" type="text" name="Buscar" class="form-control" placeholder="TERMINOS DE BUSQUEDA">
                        <div title="Buscar" class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                    <div title="Buscar con el Email" class="radio">
                        <label><input type="radio" checked value="Correo" name="optradio">Correo Electronico</label>
                    </div>
                    <div title="Buscar con el Id"  class="radio">
                        <label><input type="radio" value="Id" name="optradio">Identificador de Usuario</label>
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
