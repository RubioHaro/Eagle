<%-- 
    Document   : Servidor
    Created on : 04-dic-2016, 17:29:56
    Author     : Rod
--%>
<%@page import="chat.ControladorDeServidor"%>
<%@page import="chat.Servidor"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page import="Usuarios.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%            String title = "EAGLE VISION";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        

        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>

    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.jspf" %> 
        <h1>
            Servidor de comunicacion:
        </h1>
        <form method="post" action="\ServerRequest">
            <%                //Thread ServerTh = new Thread(new ClientServer().Cliente("127.0.0.1"));
                //ServerTh.run();
                ControladorDeServidor control = new ControladorDeServidor();
                boolean c = control.ServerEx();
                out.println(control.GetEstadoDelServidor());                
                if (c) {
            %>
            <button class="btn btn-default" name="servidor" value="0" >Apagar Servidor</button>
            <%
            } else {
            %>
            <button class="btn btn-default" name="servidor" value="1" >Iniciar Servidor</button>
            <%
            }
            %>
        </form>
        <%@include file="../../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalCerrarSesion.jsp" %> 
    </body>
</html>
