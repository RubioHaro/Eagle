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
        <%@include file="WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="WEB-INF/jspf/AllResourcesIndex.jspf" %>        
    </head>
    <body>
        <%@include file="WEB-INF/jspf/BarraDeNavegacionIndex.html" %>
        <%@include file="WEB-INF/jspf/ModalError.jspf" %>
        <%@include file="WEB-INF/jspf/ModalIniciarSesion.jspf" %>
        <%@include file="WEB-INF/jspf/ModalRegistrar.jspf" %>
    </body>
</html>
