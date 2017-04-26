<%-- 
    Document   : ModificarUsuario
    Created on : 10-feb-2017, 18:04:10
    Author     : Rod
--%>

<%@page import="Unidades.Unidad"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            
            String title = "Modificar Unidad";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        

        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function confirmar(title){
                var c = confirm('¿Estas seguro qué deseas ' + title + ' a esta Unidad?(Se registrara el cambio)');
                return c;
            }
        </script>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.jspf" %>
        <%  
            Unidad consulta = (Unidad) sesion.getAttribute("UnidadConsultada");
            if (consulta != null) {
                sesion.removeAttribute("UnidadConsultada");

        %>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col col-md-6">
                        <form method="POST" onsubmit="return confirmar('Modificar')" action="/ActualizarUnidad">
                            <input name="ID" value="<%out.println(consulta.getIdUnidad());%>" style="visibility:hidden" class="form-control" id="disabledInput" type="text"/>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID" class="control-label">Identificador de la Unidad:</label>
                                        <input value="<%out.println(consulta.getIdUnidad());%>" disabled required class="form-control" id="disabledInput" type="text"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Matricula">Matricula:</label>
                                        <input name="Matricula" value="<%out.println(consulta.getMatricula());%>" type="text" required class="form-control" id="Matricula"/>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Marca">Marca:</label>
                                        <input name="Marca" value="<%out.println(consulta.getMarca());%>" type="text" required class="form-control" id="Marca"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Modelo">Modelo:</label>
                                        <input name="Modelo" value="<%out.println(consulta.getModelo());%>" type="text" required class="form-control" id="Modelo"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Tipo">Tipo:</label>
                                <input name="Tipo" value="<%out.println(consulta.getTipo());%>" type="mail" class="form-control" required id="Tipo"/>
                            </div>
                              <div class="form-group">
                                <label for="Puertas">Puertas:</label>
                                <input name="Puertas" value="<%out.println(consulta.getPuertas());%>" type="mail" class="form-control" required id="Puertas"/>
                            </div>
                             <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Blindaje">Blindaje:</label>
                                        <input name="Blindaje" value="<%out.println(consulta.getBlindaje());%>" type="text" required class="form-control" id="Blindaje"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Antiguedad">Antiguedad:</label>
                                        <input name="Antiguedad" value="<%out.println(consulta.getAntiguedad());%>" type="text" required class="form-control" id="Antiguedad"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Estatus">Estatus:</label>
                                <input name="Estatus" value="<%out.println(consulta.getEstatus());%>" type="text" class="form-control" required id="Estatus"/>
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
                <h1>Buscar Unidad</h1>
                <form method="post" action="/Buscar">
                    <div class="input-group">
                        <input required="" type="text" name="Buscar" class="form-control" placeholder="TERMINO DE BUSQUEDA">
                        <div title="Buscar" class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>                       
                    <div class="row">
                        
                            <h3>Filtros de Busqueda</h3>
                            <div title="Buscar con el Modelo" class="radio">
                                <label><input checked="checked" type="radio" value="Modelo" name="optradio"/>Modelo</label>
                            </div>                            
                            <div title="Buscar con la Marca" class="radio">
                                <label><input type="radio" value="Marca" name="optradio">Marca</label>
                            </div>
                            <div title="Buscar con el Tipo" class="radio">
                                <label><input type="radio" value="Tipo" name="optradio">Tipo</label>
                            </div>
                            <div title="Buscar con el Matricula" class="radio">
                                <label><input type="radio" value="Matricula" name="optradio">Matricula</label>
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
