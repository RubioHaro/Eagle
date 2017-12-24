<%-- 
    Document   : Historial
    Created on : 23-nov-2016, 13:43:47
    Author     : Rod y Miguel
--%>
<%@include file="../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page import="Usuarios.Direccion"%>
<%@page import="java.sql.SQLException"%>
<%@page import="Servicios.Servicio"%>
<%@page import="Servicios.ListaServicios"%>
<%@page import="BD.ControladorDeBDD"%>
<%@page import="Usuarios.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%            String title = "Historial";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file="../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../WEB-INF/jspf/Clientes/AllResourcesIndex_Cliente.jspf" %>
        <script type="text/javascript" src="../js/DataTableorderJS.js"></script>
        <link href="../css/DataTable.css" rel="stylesheet" type="text/css">
        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
            });
        </script>
    </head>
    <body>      
        <%@include file="../WEB-INF/jspf/Clientes/nvar.html" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="jumbotron">
                        <h2>Registro de Servicios</h2>
                        <p class="text-justify">
                            Si algun servicio no aparece o tiene datos erroneos contacta a un administador.
                        </p>
                        <table id="table_id"  class="table">
                            <thead>
                                <tr>
                                    <th>Folio Servicio</th>
                                    <th>Descripcion</th>
                                    <th>Fecha Solicitud</th>
                                    <th>Fecha Entrega</th>
                                    <th>Costo</th>
                                    <th>Estado</th>
                                    <th>Direccion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    
                                    ControladorDeBDD control = new ControladorDeBDD();
                                    ListaServicios ServicesList = control.getHistory(User.getMail());
                                    int TamañoLista = ServicesList.getTamañoLista();                                                                        
                                    if (TamañoLista > 0) {
                                        for (int i = 0; i < TamañoLista; ++i) {
                                            Servicio service = ServicesList.GetService(i);
                                %>
                                <tr>
                                    <td>
                                        <%out.println("Folio: " + service.getIdServicio());%></td>
                                    <td><%out.println(service.getDescripcionDeServicio());%></td>
                                    <td><%out.println(service.getFechaSolicitud());%></td>
                                    <td><%out.println(service.getFechaEntrega());%></td>
                                    <td><%out.println(service.getCosto());%></td>
                                    <td><%out.println(service.getEstatus());%></td>    
                                    <td><button class="btn">Ver Direccion</button></td>
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
        <%@include file="../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../WEB-INF/jspf/Clientes/ModalCerrarSesion.jsp" %> 
    </body>
</html>
