<%-- 
    Document   : ModificarUsuario
    Created on : 10-feb-2017, 18:04:10
    Author     : Rod
--%>

<%@page import="Usuarios.Usuario"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="row">
                    <div class="col col-md-6">
                        <form method="POST" action="/ModificarUsuarios">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID" class="control-label">Identificador de Usuario:</label>
                                        <input name="ID" value="ID: <%out.println(consulta.getIdusuario());%>" required class="form-control" id="disabledInput" type="text" disabled/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Nombre">Nombre:</label>
                                        <input name="Nombre" value="<%out.println(consulta.getNombre());%>" type="text" required class="form-control" id="Nombre"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ApellidoPaterno">Apellido Paterno:</label>
                                        <input name="ApellidoPaterno" value="<%out.println(consulta.getApellidop());%>" type="text" required class="form-control" id="ApellidoPaterno"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ApellidoMaterno">Apellido Materno:</label>
                                        <input name="ApellidoMaterno" value="<%out.println(consulta.getApellidom());%>" type="text" required class="form-control" id="ApellidoMaterno"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Email">Correo Electronico:</label>
                                <input name="Email" value="<%out.println(consulta.getMail());%>" type="mail" class="form-control" required id="Mail"/>
                            </div>
                            <div class="form-group">
                                <label for="Password">Ingresa tu password para modificar:</label>
                                <input name="Password" value="<%out.println(consulta.getMail());%>" type="password" class="form-control" required id="Password"/>
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
