<%-- 
    Document   : IndexClient
    Created on : 22-nov-2016, 23:52:00
    Author     : Rod
--%>

<%@page import="Usuarios.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            String title = "EAGLE VISION";
            HttpSession sesion = request.getSession();
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
        <%@include file="../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../WEB-INF/jspf/AllResourcesIndex_Cliente.jspf" %>
        <%@include file="../WEB-INF/jspf/BarraDeNavegacionCliente.html" %> 
    </head>
    <body>               
        <h1>Bienvenido Cliente:  <%out.println(User.getNombre());%></h1>
        <%@include file="../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../WEB-INF/jspf/ModalCerrarSesion.jsp" %> 
    </body>
</html>
