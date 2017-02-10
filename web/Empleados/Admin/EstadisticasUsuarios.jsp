<%-- 
    Document   : Estadisticas
    Created on : 06-feb-2017, 16:18:24
    Author     : Rod
--%>
<%@page import="Usuarios.Usuario"%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page import="Catalogo.ListOfproducts"%>
<%@page import="BD.ControladorDeBDD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%            String title = "Estadisticas de Usuarios";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        
        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.html" %>
        <div class="container">

            <div class="jumbotron">
                <h1>Estadisticas de Usuarios</h1>
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
                    <%                        
                        ControladorDeBDD control = new ControladorDeBDD();
                        out.println("['Clientes', " + control.ContarClientes() + "],");
                        out.println("['Empleados', " + control.ContarEmpleados()+ "],");

                    %>

                        ]);

                        // Set chart options
                        var options = {'title': 'Usuarios',
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
        </div>
    </body>
</html>
