<%-- 
    Document   : ReloginRequest
    Created on : 18/03/2017, 01:26:56 PM
    Author     : chavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Debes Iniciar Sesion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="../css/Estilos.css" rel="stylesheet" type="text/css"/>
        <script  src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.min_1.js"></script>
    </head>
    <body>
        <%
            String Direccion = request.getParameter("URL");
            if(Direccion==null || Direccion.equals("")){
                Direccion="/Admin/AdminIndex.jsp";
            }
        %>
        <div class="container" style="padding-top: 10% !important">
            <div class="jumbotron" >
                <h1>
                    Debes Iniciar sesion para acceder a esta seccion.
                </h1>
                <h3>Si ya iniciaste sesion posiblemente se cerro la conexion, no te preocupes solo tienes que volver a ingresar.</h3>
                <button>Iniciar Sesion</button>
            </div>
        </div>
    </body>
</html>
