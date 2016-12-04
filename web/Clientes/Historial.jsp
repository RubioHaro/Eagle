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
        <%
            String title = "Historial";    
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%@include file="../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../WEB-INF/jspf/Clientes/AllResourcesIndex_Cliente.jspf" %>

    </head>
    <body>      
        <%@include file="../WEB-INF/jspf/Clientes/nvar.html" %> 
        <table class="table table-responsive table-striped" style="color: white;background-color: rgba(125,125,125,.5)">
            <thead>
                <tr> 
                    <th>Folio Servicio</th>
                    <th>Descripcion</th>
                    <th>Fecha Solicitud</th>
                    <th>Fecha Entrega</th>
                    <th>Costo</th>
                    <th>Direccion</th>
                </tr>
            </thead>
            <tbody style="color:black;">
                <%                    try {
                        ControladorDeBDD control = new ControladorDeBDD();
                        ListaServicios ServicesList = control.getHistory(User.getMail());
                        int TamañoLista = ServicesList.getTamañoLista();
                        if (TamañoLista > 0) {
                            for (int i = 0; i < TamañoLista; ++i) {
                                Servicio InstService = ServicesList.GetService(i);
                                Direccion DirInst = InstService.getDir();
                                out.println(
                                        "<tr>"
                                        + "<td>FS: " + InstService.getIdServicio() + "</td>"
                                        + "<td>" + InstService.getDescripcionDeServicio() + "</td>"
                                        + "<td>" + InstService.getFechaSolicitud() + "</td>"
                                        + "<td>" + InstService.getFechaEntrega()
                                        /*+ "<form action=\"DeleteService\" method=\"post\" >"
                                        + "<button type=\"submit\" name=\"submit\" value="+InstService.getIdServicio()  +" class=\"btn btn-default center-block\" >"
                                        + "<span class=\"glyphicon glyphicon-trash\">"
                                        + "</span>Dar de Baja </button>"
                                        + "</form> "*/
                                        + "</td>"
                                        + "<td>$" + InstService.getCosto() + "</td>"
                                        + "<td><a data-toggle=\"collapse\" href=\"#dir"+i+"\">Ver Direccion</a></td>"
                                        + "</tr>"
                                        + "<tr id=\"dir" + i + "\" style=\"color: white\" class=\"panel-collapse collapse on\"> "
                                        + "<td >" + DirInst.getDelegacion() + "</td>"
                                        + "<td >" + DirInst.getColonia() + "</td>"
                                        + "<td >" + DirInst.getCP() + "</td>"
                                        + "<td >" + DirInst.getCalle() + "</td>"
                                        + "<td >" + DirInst.getNumeroExt() + "</td>"
                                        + "<td >" + DirInst.getNumeroInt() + "</td>"
                                        + "</tr>"
                                );
                            }
                        } else {
                            out.println("<td colspan='6'>" + "No tienes servicios registrados, genera un servicio para ver el historial" + "</td>");
                        }
                    } catch (SQLException e) {
                        out.println("<td colspan='6'>Ha ocurrido un error: " + e.getMessage() + "</td>");
                    }

                %>
            </tbody>
            <tfoot>
                <tr>
                    <td>
                        Delegacion
                    </td>
                    <td>
                        Colonia
                    </td>
                    <td>
                        CP
                    </td>
                    <td>
                        Calle
                    </td>
                    <td>
                        Numero Interior
                    </td>
                    <td>
                        Numero Exterior
                    </td>
                </tr>
            </tfoot>
        </table>
        <%@include file="../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../WEB-INF/jspf/Clientes/ModalCerrarSesion.jsp" %> 
    </body>
</html>
