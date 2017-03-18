<%-- 
    Document   : ActivarCuenta
    Created on : 22-nov-2016, 20:51:44
    Author     : Rod
--%>

<%@page import="BD.ControladorDeBDD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%String title = "EAGLE VISION";%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <%@include file="WEB-INF/jspf/Declaration.jspf" %>
    </head>
    <body>
        <%            //Activacion
            HttpSession sesion = request.getSession();
            try {
                
                String Mail = request.getParameter("Correo");
                ControladorDeBDD Control = new ControladorDeBDD();
                out.println(Control.ActivarUsuario(Mail));
                sesion.setAttribute("Error", 1);
                sesion.setAttribute("DescripcionError", Control.ActivarUsuario(Mail));
                
            } catch (Exception e) {
                sesion.setAttribute("Error", 1);
                sesion.setAttribute("DescripcionError", e.toString());
            }
            response.sendRedirect("/Index.jsp");

        %>
        <h1>
            ACTIVANDO LA CUENTA, NO TARDAREMOS
            LOADING...
        </h1>
    </body>
</html>
