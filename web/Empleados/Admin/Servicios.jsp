<%-- 
    Document   : Servicios
    Created on : 19-feb-2017, 18:26:40
    Author     : Rod
--%>

<%@page import="Catalogo.ListOfproducts"%>
<%@page import="Usuarios.Direccion"%>
<%@page import="Servicios.Servicio"%>
<%@page import="Servicios.ListaServicios"%>
<%@page import="Usuarios.TicketDeUsuarios"%>
<%@page import="BD.ControladorDeBDD"%>
<%@page import="Usuarios.Usuario"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "Servicios";
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

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
            <%                ControladorDeBDD control = new ControladorDeBDD();
                ListOfproducts list = control.getProductList();
                int tam = list.getTamañoLista();
                for (int i = 0; i < tam; ++i) {
                    out.println("['" + list.GetService(i).getNombreProducto() + "', " + control.ContarProductoEnServicio(list.GetService(i).getNombreProducto()) + "],");
                }
            %>

                ]);

                // Set chart options
                var options = {'title': 'Servicios',
                    'width': 600,
                    is3D: true,
                    'height': 300};


                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>        

        <script>
            $(document).ready(function () {
                $('#table_id').DataTable();
            }
        </script>

        <title>Servicios</title>
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.html" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-xs-12">
                    <div class="jumbotron">
                        <!-- Nav tabs --><div class="card">
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#1" class="PestañaDeNav" aria-controls="home" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>&nbsp;Lista de Servicios</a></li>
                                <li role="presentation"><a class="PestañaDeNav" href="#2" aria-controls="profile" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Agregar Servicio</a></li>
                                <li role="presentation"><a class="PestañaDeNav" href="#3" aria-controls="messages" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span>&nbsp;Estadisticas</a></li>                                
                            </ul>
                            
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="1">
                                    <div>
                                        <h2>Lista de servicios</h2>
                                        <p class="text-justify">
                                            La informacion aqui proporcionada es de caracter confidencial y esta estrictamente prohibido su uso sin autorizacion asi como la copia o descarga de la misma por parte de la empresa.
                                        </p>
                                        <table id="table_id"  class="table">
                                            <thead>
                                                <tr>
                                                    <th>Folio Servicio</th>
                                                    <th>Estado</th>
                                                    <th>Nombre</th>
                                                    <th>Descripcion</th>
                                                    <th>Fecha Solicitud</th>
                                                    <th>Costo</th>
                                                    <th>Direccion</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    ListaServicios ServicesList = control.getLas50History();
                                                    int TamañoLista = ServicesList.getTamañoLista();
                                                    if (TamañoLista > 0) {
                                                        for (int i = 0; i < TamañoLista; ++i) {
                                                            Servicio InstService = ServicesList.GetService(i);
                                                            Direccion DirInst = InstService.getDir();

                                                %>
                                                <tr>
                                                    <td>Folio de servicio:<%out.println(InstService.getIdServicio());%></td>
                                                    <td>En espera</td>
                                                    <td><%out.println(InstService.getNombre());%></td>
                                                    <td><%out.println(InstService.getDescripcionDeServicio());%></td>
                                                    <td><%out.println(InstService.getFechaSolicitud());%></td>
                                                    <td>$<%out.println(InstService.getCosto());%></td>

                                                    <th>
                                                        <form method="POST" action="/Consultar">
                                                            <button class="btn btn-default" name="IDColaborador" value="<%out.println(DirInst.getIdDireccion());%>" type="submit">Ver Direccion</button>
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
                                            <div id="chart_div" style="width: 900px; height: 300px;"></div>
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
