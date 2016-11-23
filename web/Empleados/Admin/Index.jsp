<%-- 
    Document   : Index
    Created on : 19-nov-2016, 22:42:31
    Author     : Rod
--%>

<%@page import="Usuarios.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%Usuario User = (Usuario)request.getSession().getAttribute("Usuario"); %>
        <h1>Bienvenido Empleado(<%out.println(User.getNivelAcceso());%>) :  <%out.println(User.getNombre());%></h1>
    </body>
</html>
