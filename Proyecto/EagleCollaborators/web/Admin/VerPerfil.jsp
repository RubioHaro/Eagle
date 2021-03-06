<%-- 
    Document   : VerPerfil
    Created on : 13/03/2017, 08:30:07 AM
    Author     : CECyT9
--%>
<%@page import="java.io.File"%>
<%@page import="BD.ControladorDeBDD"%>
<%@page import="Usuarios.Empleado"%>
<%@page import="Usuarios.Usuario"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "Perfil";
            Empleado User = (Empleado) sesion.getAttribute("Usuario");
            ControladorDeBDD control = new ControladorDeBDD();
            control.BuscarEmpleado(User.getIdusuario());


        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        

        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../../js/FilesServer/plugins/sortable.js" type="text/javascript"></script>
        <link href="../../css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
        <script src="../../js/input.js" type="text/javascript"></script>
        <script src="../../js/FilesServer/locales/es.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.jspf" %>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col col-md-6">
                        <h2>Nombre:<%out.println(User.getNombre());%> <%out.println(User.getApellidop());%> <%out.println(User.getApellidom());%></h2>                        
                        <h2>Identificador: <%out.println(User.getIdusuario());%>/<%out.println(User.getTipo());%> </h2>
                        <h2>Antigüedad: <%out.println(User.getAntiguedad());%>  </h2>
                        <h2>Edad: <%out.println(User.getEdad());%> Salario: $<%out.println(User.getSalario());%></h2>
                        <div class="row">
                            <div class="col-md-6" >
                                <form method="POST" action="/ModificarUsuarios">
                                    <div class="form-group">
                                        <button name="IDUsuario" value="<%out.println(User.getIdusuario());%>" class="btn btn-primary">
                                            Modificar 
                                            <span class="glyphicon glyphicon-wrench" aria-hidden="true">                                        
                                            </span>
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6" >
                            </div>
                            <!--<button class="btn btn-warning">Enviar Mensaje <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></button>-->                                
                            <!--<button class="btn btn-success">Pagar <span class="glyphicon glyphicon-usd" aria-hidden="true"></span></button>                                -->
                        </div>

                    </div>
                    <div class="col-md-6">
                        <form action="/ProfileChange">
                            <label class="control-label">Subir Imagen</label>
                            <input id="file-0c" class="file" type="file"  data-allowed-file-extensions='["png", "jpg"]' data-min-file-count="1">
                                <%
                                    String DireccionImagen = "C:\\Users\\CECyT9\\Documents\\Eagle\\web\\Img";
                                    File fichero = new File(DireccionImagen);
                                    if (fichero.exists()) {
                                %>
                                <img alt="Foto Usuario" src="../../Img/profiloUtentiImage/User_<%out.print(User.getIdusuario());%>.jpg" class="img-responsive" />
                                <%
                                } else {
                                %><img alt="Foto Usuario" src="../../Img/SinImagen.png" class="img-responsive" />
                                <%
                                    }
                                %>                                 
                        </form>


                    </div>

                </div>
            </div>
    </body>
</html>
