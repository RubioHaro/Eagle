<%-- 
    Document   : Consultas
    Created on : 01-dic-2016, 5:03:32
    Author     : Rod e Hiram
--%>
<%@page import="Usuarios.Usuario"%>
<%@page language="java" import="javazoom.upload.*" %>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String direccion = request.getSession().getServletContext().getRealPath("imagenesDB/");
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
    <jsp:setProperty name="upBean" property="folderstore" value="<%= direccion%>" />
    <jsp:setProperty name="upBean" property="whitelist" value="*.jpg,*.gif" />
    <jsp:setProperty name="upBean" property="overwritepolicy" value="nametimestamp"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <%            String title = "Registrar Unidad";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        

        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <link href="../../css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="../../js/FilesServer/plugins/sortable.js" type="text/javascript"></script>
        <script src="../../js/FilesServer/fileinput.js" type="text/javascript"></script>
        <script src="../../js/FilesServer/locales/es.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Unidades/nvar.html" %>   
        <h1>
            <div class="container">
                <div class="jumbotron">
                    <h1>Registrar Unidades</h1>
                    <form method="POST" action="/RegistroUnidad">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group has-feedback">
                                    <input type="text" class="form-control"  name="Matricula" required  placeholder="Matricula" id="Matricula"/>                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control"  name="Marca" required  placeholder="Marca" id="Marca"/>                    
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control"  name="Modelo" required  placeholder="Modelo"  id="Modelo"/>                    
                                    </div>
                                </div>                        
                                <div class="form-group has-feedback">                            
                                    <input type="numer" class="form-control"  name="Antiguedad" required  placeholder="Antiguedad" min="1990" max="2017" id="Antiguedad"/>                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <select class="form-control" name="Tipo">
                                                <option value="">Tipo</option>
                                                <option value="Coche">Coche</option>
                                                <option value="Camioneta">Camioneta</option>
                                                <option value="Trailer1">Trailer 1 remolque</option>
                                                <option value="Trailer2">Trailer 2 remolque</option>
                                            </select>
                                        </div>                    
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control"  name="Status" required  placeholder="Status"  id="Status"/>                    
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-6 ">
                                        <select class="form-control" name="Puertas">
                                            <option value="">Puertas</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <select class="form-control" name="Blindaje">
                                            <option value="">Blindaje</option>
                                            <option value="LVL2">Blindaje Nivel RB II</option>
                                            <option value="LVL3">Blindaje Nivel RB III</option>
                                            <option value="LVL4">Blindaje Nivel RB IV</option>
                                            <option value="LVL5">Blindaje Nivel RB V</option>
                                            <option value="LVL6">Blindaje Nivel RB VI</option>
                                            <option value="LVL7">Blindaje Nivel RB VII</option>
                                        </select>
                                    </div>                    
                                </div>
                                <div class="form-group">                                                        
                                    <button class="btn btn-default center-block" onclick="return Validacion()" onsubmit="return Validacion()" type="submit" >Registrarse</button>
                                </div> 

                            </div>
                            <div class="col-md-4 ">
                                <label class="control-label">Select File</label>
                                
                                <img alt="Imagen de Unidad" class=" img-responsive ImagenUnidad" src="../../Img/SinImagen.png"/>
                                <input id="file-0c" class="file" type="file"  data-allowed-file-extensions='["png", "jpg"]' data-min-file-count="3">
                            </div>
                        </div>
                    </form>
                </div>
        </h1>
        <%@include file="../../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalCerrarSesion.jsp" %> 
    </body>
</html>
