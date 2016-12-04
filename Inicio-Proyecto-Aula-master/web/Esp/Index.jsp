<%-- 
    Document   : Index
    Created on : 26-oct-2016, 21:14:06
    Author     : Rod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%String title = "EAGLE VISION";%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="jspf/Declaration.jspf" %>
        <%@include file="jspf/LinksSources.html" %>        
    </head>
    <body>
        <script>
            
        </script>
        <%@include file="jspf/BarraDeNavegacionIndex.html" %>
        <%@include file="jspf/ModalIniciarSesion.jspf" %>
        <%        
            String Nombre = request.getParameter("Nombre");
            String Email = request.getParameter("Email");
            String Usuario = request.getParameter("Usuario");
            String Pass = request.getParameter("Pass");
        %> 
        <%@include file="jspf/ScriptsSources.html" %>
    </body>
</html>
