<%-- 
    Document   : Login
    Created on : 13/05/2017, 09:21:23 PM
    Author     : chavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            HttpSession sesion = request.getSession();
            String title = "Login";
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <%@include file="WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="WEB-INF/jspf/AllResourcesIndex.jspf" %>    
    </head>
    <body>
        <%@include file="WEB-INF/jspf/BarraDeNavegacionIndex.html" %>
        <div class="container">
            <section id="Login" title="Login" class="row paddinTopLogin">
                <form class="animate" name="IniciarSesion" method="POST" action="Login">
                    <div class="col-md-6">
                        <div class="form-group">
                            <img alt="Foto Usuario" src="Img/Logo/EagleVision-Logo.png" class="img-responsive" />
                        </div>
                    </div>
                    <div class="col-md-6 center-block">
                        <div class="form-group has-feedback">                            
                            <input type="text" class="form-control"  name="Usuario" required  placeholder="Usuario" id="Usuario"/>                    
                        </div>
                        <div class="form-group has-feedback">                            
                            <input type="password" class="form-control"  name="Pass" required  placeholder="Contraseña" id="Pass"/>                    
                        </div>
                        <div class="form-group">                                                        
                            <button class="btn btn-default center-block" onclick="return Validacion()" onsubmit="return Validacion()" type="submit" >Iniciar Sesión</button>
                        </div> 
                        <div class="form-group" style="text-align: center;">
                            <a class="link center-block" href="RecuperarPassword.jsp">Recuperar password</a>
                        </div>
                    </div>
                </form>

                <div class="col-md-4">

                </div>                

            </section>

        </div>
    </body>
</html>
