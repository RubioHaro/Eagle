<%-- 
    Document   : Estadistica
    Created on : 01-dic-2016, 2:37:54
    Author     : Rod, Emilio
--%>
<%@page import="Catalogo.ListOfproducts"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
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

        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>

    </head>
    <body><%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.html" %> 
        <div class="container">

            <h1>Estadisticas de los servicios</h1>
            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">

                // Load the Visualization API and the corechart package.
                google.charts.load('current', {'packages': ['corechart']});

                // Set a callback to run when the Google Visualization API is loaded.
                google.charts.setOnLoadCallback(drawChart);

                // Callback that creates and populates a data table,
                // instantiates the pie chart, passes in the data and
                // draws it.
                function drawChart() {

                    // Create the data table.
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Topping');
                    data.addColumn('number', 'Slices');
                    data.addRows([
                <%                    ControladorDeBDD control = new ControladorDeBDD();

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
            <!--Div that will hold the pie chart-->
            <div class="center-block">
                <div id="chart_div"></div>
            </div>
        </div>
        <%@include file="../../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalCerrarSesion.jsp" %> 
    </body>
</html>
