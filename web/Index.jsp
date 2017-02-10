<%-- 
    Document   : Index
    Created on : 26-oct-2016, 21:14:06
    Author     : Rod y Miguel
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <%@include file="WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="WEB-INF/jspf/AllResourcesIndex.jspf" %>        
    </head>
    <body>
        <%@include file="WEB-INF/jspf/BarraDeNavegacionIndex.html" %>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-md-6">
                        <img alt="Logo" src="Img/Logo/seg.jpg" class="img-responsive" />
                        <h2 class="azul text-center"><em>"Lighting the way"</em></h2>
                    </div>
                    <div class="col-md-6">
                        <h1 class="text-center azul">Mision</h1>
                        <h3 class="text-center">Desarrollar softwares que permitan solucionar problemas de ámbito académico y administrativo con el fin de facilitar las actividades. Para convertir a México en un país con desarrollo autosustentable.</h3>
                        <!--<h1 class="text-center azul">Vision</h1>
                        <h3 class="text-center">New Lights será una empresa innovadora y eficaz en el desarrollo de software, así como responsable socialmente. Siendo líder de soluciones informáticas</h3>
                        -->
                    </div>
                </div>
            </div>
        </div>

        <%@include file="WEB-INF/jspf/ModalError.jspf" %>
        <%@include file="WEB-INF/jspf/ModalIniciarSesion.jspf" %>
        <%@include file="WEB-INF/jspf/ModalRegistrar.jspf" %>
    </body>
</html>
