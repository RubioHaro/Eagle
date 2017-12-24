<%-- 
    Document   : IndexClient
    Created on : 22-nov-2016, 23:52:00
    Author     : Rod y Miguel
--%>
<%@include file="../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page import="Usuarios.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%            String title = "EAGLE VISION";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../WEB-INF/jspf/ModalError.jspf" %>        

        <%@include file="../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../WEB-INF/jspf/Clientes/AllResourcesIndex_Cliente.jspf" %>

    </head>
    <body>
        <%@include file="../WEB-INF/jspf/Clientes/nvar.html" %> 
        <h1>
            Bienvenido Cliente:  
            <%                out.println(User.getNombre());
                %>
        </h1>
        <%@include file="../WEB-INF/jspf/Clientes/ModalConfigClient.jspf" %> 
        <%@include file="../WEB-INF/jspf/Clientes/ModalCerrarSesion.jsp" %> 
    </body>
</html>
