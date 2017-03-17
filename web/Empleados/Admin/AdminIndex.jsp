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

    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.html" %> 
        <div class="container">
            <div class="jumbotron">
                <h1>PANEL INICIAL</h1>
                <div class="row">
                    <div class="col-md-8">
                        <h3>Mapa de Unidades</h3>
                        <div id="map" style="width:100vh;height:60vh; color: #000"></div>
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
                    <div class="col-md-4">
                        <h3>Actividades</h3>
                    </div>
                </div>

                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBclln4gWIxJu6PglA4qEwAyfyGTPMKu1c&callback=myMap"></script>
            </div>
        </div>

        <%@include file="../../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalCerrarSesion.jsp" %> 
    </body>
</html>
