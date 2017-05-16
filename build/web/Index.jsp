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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="WEB-INF/jspf/AllResourcesIndex.jspf" %>                
    </head>
    <body>
        <%@include file="WEB-INF/jspf/BarraDeNavegacionIndex.html" %>
        <div class="container">
            <img class="DisplayImagen animate center-block" alt="Seguridad Privada, Seguridad en Transporte y Custodia en Mexico - Image" src="Img/Logo/collaje.jpg "/>
            <h1 class="center-block text-center ButtomSpace" style="color: black;">Seguridad Privada, Seguridad en Transporte y Custodia en Mexico</h1>            
            <!--
            <div class="row" id="services">
                <h1 class="text-center text-black" style="color: #000000">Servicios</h1>
                <div class="col-lg-4">
                    <div class="panel MarginPanel">
                        <div class="panel-heading HeadingWhitePanel">
                            <h2>Custodias</h2>
                        </div>
                        <div class="panel-body BodyPanel">
                            <img alt="Seguridad Privada, Seguridad en Transporte y Custodia en Mexico - Image Spacer" src="images/spacer.gif" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel MarginPanel">
                        <div class="panel-heading HeadingWhitePanel">
                            <h2>Custodias</h2>
                        </div>
                        <div class="panel-body BodyPanel">
                            <img alt="Seguridad Privada, Seguridad en Transporte y Custodia en Mexico - Image Spacer" src="images/spacer.gif" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel MarginPanel">
                        <div class="panel-heading HeadingWhitePanel">
                            <h2>Custodias</h2>
                        </div>
                        <div class="panel-body BodyPanel">
                            <img alt="Seguridad Privada, Seguridad en Transporte y Custodia en Mexico - Image Spacer" src="images/spacer.gif" />
                        </div>
                    </div>
                </div>
            </div>   <!--Fin del Panel-->    
            <!--<div  id="wrapper" class="wrapper">                
                <div id="main-content">
                    <div class="MarginText text-justify">
                        <h1>Grupo Aguila Bicefala</h1>
                        <p>El alto índice delictivo y a la creciente inseguridad en 
                            Mexico nos obliga a implementar día con día nuevos esquemas de 
                            seguridad y a una constante búsqueda de nuevas tecnologías.<br>                                                   
                        <h2>Objetivo</h2>
                        Prevenir y/ó reaccionar de manera inmediata e inteligente minimizando 
                        los riesgos en caso de un siniestro ó delito que afecte la 
                        integridad de la carga, mediante acciones de vigilancia, seguimiento e 
                        inteligencia operativa, apoyados con tecnología de amplia cobertura, 
                        localización y transmisión de video y audio en vivo, colocada en 
                        unidades patrulla y líneas transportistas.</p>
                        <p>para mas informacion llama al: 01 (55) 36-40-87-78. </p>
                    </div>
                </div><!--Fin del Main-->
            </div><!--Fin del Wrapper-->
            <br/>
            <br/>
        </div>
        <div class="footer center-block text-center">Grupo Aguila Bicefala - New Ligths <br/>2017</div>
            <%@include file="WEB-INF/jspf/ModalError.jspf" %>
            <%@include file="WEB-INF/jspf/ModalIniciarSesion.jspf" %>
            <%@include file="WEB-INF/jspf/ModalRegistrar.jspf" %>
            <%@include file="WEB-INF/jspf/ModalContacto.jspf" %>
    </body>
</html>
