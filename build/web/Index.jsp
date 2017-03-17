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
        <script>
            
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <%@include file="WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="WEB-INF/jspf/AllResourcesIndex.jspf" %>        
    </head>
    <body onload="ClickContacto('Contacto')">
        <%@include file="WEB-INF/jspf/BarraDeNavegacionIndex.html" %>
        <div class="container">
            <div class="jumbotron">
                <div class="carousel fade-carousel slide" data-ride="carousel" data-interval="4000" id="bs-carousel">                    

                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#bs-carousel" data-slide-to="1"></li>
                        <li data-target="#bs-carousel" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item slides active">
                            <div class="slide-1"></div>
                            <div class="hero">
                                <hgroup>
                                    <img alt="Logo" src="Img/Logo/EagleVision-Logo.png" class="img-responsive center-block LogoPrincipal" />
                                    <h1 class="text-center">Bienvenidos</h1>
                                </hgroup>
                            </div>
                        </div>
                        <div class="item slides">
                            <div class="slide-2"></div>
                            <div class="hero">        
                                <hgroup>
                                    <h1>Nosotros te protegemos</h1>        
                                    <h3>Custodia, Intramuros, traslados, patrullas...</h3>
                                </hgroup>       
                                <button onclick="ClickContacto('Contacto');" class="btn btn-hero btn-lg" role="button">¡A por ello!</button>
                            </div>
                        </div>
                        <div class="item slides">
                            <div class="slide-3"></div>
                            <div class="hero">        
                                <hgroup>
                                    <h1>Somos los mejores</h1>        
                                    <h3>Mejor equipo, mejor tecnologia, mejor precio ;)</h3>
                                </hgroup>
                                <button  class="btn btn-hero btn-lg" role="button">Contactar</button>
                            </div>
                        </div>
                    </div> 
                </div>



            </div>
        </div>
        
        <%@include file="WEB-INF/jspf/ModalError.jspf" %>
        <%@include file="WEB-INF/jspf/ModalIniciarSesion.jspf" %>
        <%@include file="WEB-INF/jspf/ModalRegistrar.jspf" %>
        <%@include file="WEB-INF/jspf/ModalContacto.jspf" %>
    </body>
</html>
