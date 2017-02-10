<%-- 
    Document   : AgregarUsuarios
    Created on : 01-dic-2016, 5:03:23
    Author     : Rod y Miguel
--%>
<%@page import="Usuarios.TicketDeUsuarios"%>
<%@page import="BD.ControladorDeBDD"%>
<%@page import="Usuarios.Usuario"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "Colaboradores";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        
        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../../js/DataTableorderJS.js"></script>
        <link href="../../css/DataTable.css" rel="stylesheet" type="text/css">
        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
            });
        </script>
        <title>Usuarios</title>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.html" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="jumbotron">
                        <h2>Lista de clientes</h2>
                        <p class="text-justify">
                            La informacion aqui proporcionada es de caracter confidencial y esta estrictamente prohibido su uso sin autorizacion asi como la copia o descarga de la misma por parte de la empresa.
                        </p>
                        <table id="table_id"  class="table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>Correo</th>
                                    <th>Identificador</th>
                                    <th>Estado</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                        
                                    ControladorDeBDD control = new ControladorDeBDD();
                                    TicketDeUsuarios ListaUsers = control.ObtenerListaDeColaboradores(50);
                                    int lim = ListaUsers.getTamañoTicket();                                    
                                    if (lim > 0) {
                                        for (int i = 0; i < lim; ++i) {
                                            
                                %>
                                <tr>
                                    <td>
                                    <%out.println(ListaUsers.GetUser(i).getNombre());%></td>
                                    <td><%out.println(ListaUsers.GetUser(i).getApellidop() + " " + ListaUsers.GetUser(i).getApellidom());%></td>
                                    <td><a style="color: white" href="mailto:<%out.println(ListaUsers.GetUser(i).getMail());%>"><%out.println(ListaUsers.GetUser(i).getMail());%></a> </td>
                                    <td><%out.println(ListaUsers.GetUser(i).getIdusuario());%></td>
                                    <td><%out.println(ListaUsers.GetUser(i).getEstatus());%></td>                                    
                                    <th>
                                        <form method="POST" action="/Consultar">
                                            <button class="btn btn-default" name="IDColaborador" value="<%out.println(ListaUsers.GetUser(i).getIdusuario());%>" type="submit">Ver Perfil</button>
                                        </form>
                                    </th>
                                </tr>
                                <%
                                         }
                                     }
                                     %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>                           
        </div>
        <%@include file="../../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalCerrarSesion.jsp" %> 
    </body>
</html>
