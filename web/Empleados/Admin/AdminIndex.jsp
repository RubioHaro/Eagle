<%-- 
    Document   : Index
    Created on : 19-nov-2016, 22:42:31
    Author     : Rod
--%>
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
        <!-- Ionicons -->

    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.jspf" %>
        <div class="container">
            <div>
                <div class="row">
                    <div class="col-md-8">
                        <!-- MAP & BOX PANE -->
                        <div class="box box-default">
                            <div class="box-header with-border">
                                <h3 class="box-title">Reporte de Unidades</h3>

                                <div class="box-tools pull-right">
                                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="glyphicon glyphicon-minus"></i>
                                    </button>
                                    <!--<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="glyphicon glyphicon-remove"></i></button>-->
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body no-padding">
                                <div class="row">
                                    <div class="col-md-9 col-sm-8">
                                        <div class="pad">
                                            <!-- Map will be created here -->
                                            <div id="map"  style="height: 325px; color: #000"></div>
                                        </div>
                                        <script>
                                            function myMap() {
                                                var mapCanvas = document.getElementById("map");
                                                var myCenter = new google.maps.LatLng(19.4538726, -99.17493780000001);
                                                var marcadores = [
                                                    ['León', 42.603, -5.577],
                                                    ['Salamanca', 40.963, -5.669],
                                                    ['CDMX', 19.4538726, -99.17493780000001],
                                                    ['CDMX', 19.7638726, -99.98493780000001],
                                                    ['Zamora', 41.503, -5.744]
                                                ];

                                                var styleArray = [
                                                    {featureType: "all", stylers: [{saturation: -80}]},
                                                    {featureType: "road.arterial", elementType: "geometry", stylers: [{hue: "#ff6600"}, {saturation: 10}]},
                                                    {featureType: "poi.business", elementType: "labels", stylers: [{visibility: "off"}]}
                                                ];

                                                var StyleRoy = new google.maps.StyledMapType(styleArray,
                                                        {name: "StyleRoy"});


                                                var mapOptions = {
                                                    center: myCenter,
                                                    zoom: 10,
                                                    panControl: true,
                                                    zoomControl: true,
                                                    mapTypeControl: false,
                                                    scaleControl: true,
                                                    streetViewControl: false,
                                                    overviewMapControl: true,
                                                    rotateControl: true,
                                                    mapTypeControlOptions: {
                                                        mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'StyleRoy']
                                                    }
                                                };
                                                var map = new google.maps.Map(mapCanvas, mapOptions);
                                                var marker, i;
                                                for (i = 0; i < marcadores.length; i++) {
                                                    marker = new google.maps.Marker({
                                                        position: new google.maps.LatLng(marcadores[i][1], marcadores[i][2]),
                                                        map: map,
                                                        icon: "/Img/Logo/IconMaps.png",
                                                        scaledSize: new google.maps.Size(1, 1)
                                                    });
                                                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                                        return function () {
                                                            infowindow.setContent(marcadores[i][0]);
                                                            infowindow.open(map, marker);
                                                        }
                                                    })(marker, i));
                                                }
                                                marker.setMap(map);
                                                map.mapTypes.set('StyleRoy', StyleRoy);
                                                map.setMapTypeId('StyleRoy');

                                            }
                                        </script>
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-4">
                                        <div class="pad box-pane-right bg-gray" style="min-height: 280px">
                                            <div class="description-block margin-bottom">
                                                <div class="sparkbar pad" data-color="#fff">90,70,90,70,75,80,70</div>
                                                <h5 class="description-header">40 unidades</h5>
                                                <span class="description-text">Totales</span>
                                            </div>
                                            <!-- /.description-block -->
                                            <div class="description-block margin-bottom">
                                                <div class="sparkbar pad" data-color="#fff">90,50,90,70,61,83,63</div>
                                                <h5 class="description-header">25 unidades</h5>
                                                <span class="description-text">En espera</span>
                                            </div>
                                            <!-- /.description-block -->
                                            <div class="description-block">
                                                <div class="sparkbar pad" data-color="#fff">90,50,90,70,61,83,63</div>
                                                <h5 class="description-header">15 unidades</h5>
                                                <span class="description-text">Activas</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                    </div>
                                    <!-- /.col -->
                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                    
                </div>
                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBclln4gWIxJu6PglA4qEwAyfyGTPMKu1c&callback=myMap"></script>
            </div>
        </div>

        <%@include file="../../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalCerrarSesion.jsp" %> 
    </body>
</html>
