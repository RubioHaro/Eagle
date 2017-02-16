<%-- 
    Document   : Consultas
    Created on : 01-dic-2016, 5:03:32
    Author     : Rod e Hiram
--%>
<%@page import="Usuarios.Usuario"%>
<%@page import="Unidades.Unidad"%>
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
        <%@include file="../../WEB-INF/jspf/Empleados/Unidades/nvar.html" %>
        <%            Unidad consulta = (Unidad) sesion.getAttribute("Unidad Consultada");
            if (consulta != null) { %>
  
            <%
                sesion.removeAttribute("Unidad Consultada");

        %>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col col-md-6">
                        <h1>Matricula <%out.println(consulta.getMatricula());%></h1>
                        <h2>Marca: <%out.println(consulta.getMarca());%></h2>
                        <h2>Modelo: <%out.println(consulta.getModelo());%></h2>
                        <h2>Tipo: <%out.println(consulta.getTipo());%></h2>
                        <h2>Puertas: <%out.println(consulta.getPuertas());%></h2>
                        <h2>Blindaje: <%out.println(consulta.getBlindaje());%></h2>
                        <h2>Antiguedad: <%out.println(consulta.getAntiguedad());%></h2>
                        <h2>Estatus: <%out.println(consulta.getEstatus());%></h2>
                        <div>
                            <form method="POST" action="/ModiUnidades" >
                            <button class="btn btn-primary" value="<%out.println(consulta.getIdUnidad());%>" name="IdUnidad" >Modificar <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span></button>
                            </form>
                            <form method="POST" action="/EliminarUnidades">
                                <button  class="btn btn-danger" value="<%out.println(consulta.getIdUnidad());%>" name="IdUnidad" >Eliminar <span class="glyphicon glyphicon-trash" aria-hidden="true" ></span></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img alt="Foto Unidad" src="../../Img/SinImagen.png" class="img-responsive" />

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
