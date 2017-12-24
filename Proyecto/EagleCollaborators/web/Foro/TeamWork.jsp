<%-- 
    Document   : TeamWork
    Created on : 25/04/2017, 04:53:38 PM
    Author     : chavo
--%>

<%@page import="WebChat.Equipo"%>
<%@page import="Usuarios.Usuario"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "EAGLE VISION";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        
        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.io.*"%>
        <%
            Equipo team = new Equipo();
            String Nombre, Tema;
            int IdForo;
            if (sesion.getAttribute("IdForoDesplegado") != null) {
                team = (Equipo) sesion.getAttribute("IdForoDesplegado");
                IdForo = team.getIdEquipo();
                Nombre = team.getNombre();
                Tema = team.getTema();
            } else {
                IdForo = Integer.parseInt(request.getParameter("IdForo"));
                Nombre = request.getParameter("NombreForo");
                Tema = request.getParameter("TemaForo");
            }

        %>
        <a class="letras">Foro:<%out.println(Nombre);%></a>
        <br>
        <a class="letras">Tema:<%out.println(Tema);%></a>
        <div>
            <iframe id="Foro" style="height: 40vh; width: 40%; overflow:  auto" src="cargarmensajes.jsp">

            </iframe>
        </div>
        <%
            team.setIdEquipo(IdForo);
            team.setNombre(Nombre);
            team.setTema(Tema);
            sesion.setAttribute("EquipoDesplegado", team);
        %>
        <div>
            <form action="enviarMensaje.jsp" method="post">
                <textarea required  name="Mensaje"  class="cuadritosv1"  title="Comentario" style="resize: none; width: 500px; height: 100px; "  rows="3" cols="30" placeholder="COMENTAR..."></textarea>
                <br>
                <input type="submit" class="botoncito" title="Enviar" value="Comentar">
            </form>
            <a href="ForoPost.jsp"><input type="button" class="botoncitoColor2" title="Actualizar" value="Actualizar"/></a>
        </div>
    </body>
</html>
