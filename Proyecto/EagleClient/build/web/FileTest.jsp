<%-- 
    Document   : FileTest
    Created on : 26/04/2017, 07:49:13 PM
    Author     : chavo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            var formData = new FormData();
            formData.append("clave", "valor");
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <form enctype="multipart/form-data" id="formuploadajax" method="post">
            Nombre: <input type="text" name="nombre" placeholder="Escribe tu nombre">
            <br />
            <input  type="file" id="archivo1" name="archivo1"/>
            <br />
            <input  type="file" id="archivo2" name="archivo2"/>
            <br />
            <input type="submit" value="Subir archivos"/>
        </form>
        <div id="mensaje"></div>
    </body>
</html>
