<%-- 
    Document   : CerrarSesion
    Created on : 23-nov-2016, 0:29:24
    Author     : Rod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            response.sendRedirect("/Index.jsp");
        %>
    </body>
</html>