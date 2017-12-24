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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load("current", {packages: ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
            <%                    ControladorDeBDD control = new ControladorDeBDD();
                out.println(control.ContarColaboradores("Hombres"));

            %>

                //Grafica 1
                var data = google.visualization.arrayToDataTable([
                    ["Element", "Colaboradores", {role: "style"}],
                    ["Hombres", <%out.println(control.ContarColaboradores("Hombres"));%>, "skyblue"],
                    ["Mujeres", <%out.println(control.ContarColaboradores("Mujeres"));%>, "pink"]
                ]);

                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1, {calc: "stringify", sourceColumn: 1, type: "string", role: "annotation"}, 2]);

                var options = {
                    title: "Relacion hombres-mujeres como Colaboradores",
                    width: 400,
                    height: 300,
                    bar: {groupWidth: "95%"},
                    legend: {position: "none"}
                };
                var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
                chart.draw(view, options);
            }
        </script>
        <script>
            google.charts.load("current", {packages: ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                //Grafica 2

                var data2 = google.visualization.arrayToDataTable([
                    ["Element", "Colaboradores", {role: "style"}],<%
                        int[] Edades = control.GetAges();
                        int limiter = Edades.length;
                        for (int i = 0; i < limiter; ++i) {
                            int col = control.ContarColaboradoresPorEdad(Edades[i]);
                            String message;
                            String color;
                            if (Edades[i] < 35) {
                                color = "LimeGreen";
                            } else if (Edades[i] > 35 && Edades[i] < 45) {
                                color = "DarkCyan";
                            } else if (Edades[i] > 45) {
                                color = "Maroon";
                            } else {
                                color = "gray";
                            }

                            if ((limiter - 1) == i) {
                                message = "['" + Edades[i] + "'," + col + ", '" + color + "']";
                            } else {
                                message = "['" + Edades[i] + "', " + col + ", '" + color + "'],";
                            }
                            System.out.println(message);
                            out.print(message);
                        }
            %>
                ]);
                var view2 = new google.visualization.DataView(data2);
                view2.setColumns([0, 1, {calc: "stringify", sourceColumn: 1, type: "string", role: "annotation"}, 2]);

                var options2 = {
                    title: "Edad de los colaboradores",
                    width: 400,
                    height: 300,
                    bar: {groupWidth: "95%"},
                    legend: {position: "none"}
                };
                var chart = new google.visualization.ColumnChart(document.getElementById("GraficaEdades"));
                chart.draw(view2, options2);
            }
        </script>

        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
            }
        </script>

        <title>Usuarios</title>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.jspf" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="jumbotron">
                        <!-- Nav tabs --><div class="card">
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#1" style="color: white; background-color: #ababab"  aria-controls="home" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&nbsp;Lista Colaboradores</a></li>
                                <li role="presentation"><a style="color: white; background-color: #ababab" href="#2" aria-controls="profile" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Agregar Colaborador</a></li>
                                <li role="presentation"><a style="color: white; background-color: #ababab" href="#3" aria-controls="messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span>&nbsp;Estadisticas</a></li>                                
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="1">
                                    <div>
                                        <h2>Lista de colaboradores</h2>
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
                                <div role="tabpanel" class="tab-pane" id="2">
                                    <div class="row">
                                        <div class="col col-md-6">
                                            <form method="POST" onsubmit="return confirmar('Modificar')" action="/ActualizarUsuario">
                                                <input name="ID" style="visibility:hidden" class="form-control" id="disabledInput" type="text"/>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="Email">Correo Electronico:</label>
                                                            <input name="Email" type="mail" class="form-control" required id="Mail"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="Password">Ingresa una password:</label>
                                                            <input name="Password" type="password" class="form-control" required id="Password"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="Password">Ingresa una password:</label>
                                                    <input name="Password" type="password" class="form-control" required id="Password"/>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="Edad">Edad:</label>
                                                            <input name="Edad" type="number" min="18" max="99" class="form-control" required id="Edad"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="Antigüedad:">Antigüedad:</label>
                                                            <input name="Antiguedad" type="number"  min="0" max="60" class="form-control" required id="Antiguedad"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="Salario">Salario(x mes):</label>
                                                            <input name="Salario" type="number" min="1000" max="999999" class="form-control" required id="Edad"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="Salario">Sexo</label>
                                                            <div class="radio">
                                                                <label><input type="radio" name="optradio">Option 1</label>
                                                            </div>
                                                            <div class="radio">
                                                                <label><input type="radio" name="optradio">Option 2</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="Password">Ingresa una password:</label>
                                                    <input name="Password" type="password" class="form-control" required id="Password"/>
                                                    <div class="form-group">
                                                        <label for="sel1">Tipo de colaborador:</label>
                                                        <select class="form-control" id="sel1">
                                                            <option>Conductor</option>
                                                            <option>Personal de Mantenimiento</option>
                                                            <option>Administrador</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-default">Guardar</button>
                                            </form>
                                        </div>
                                        <div class="col-md-6">
                                            <img alt="Foto Usuario" src="../../Img/SinImagen.png" class="img-responsive" />
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="3">
                                    <br>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div id="columnchart_values" style="width: 900px; height: 300px;"></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div id="GraficaEdades" style="width: 900px; height: 300px;"></div>
                                        </div>
                                    </div>

                                </div>                                
                            </div>
                        </div>


                    </div>
                </div>
            </div>                           
        </div>
        <%@include file="../../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalCerrarSesion.jsp" %> 
    </body>
</html>
