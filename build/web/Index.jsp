<%-- 
    Document   : Index
    Created on : 26-oct-2016, 21:14:06
    Author     : Rod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head lang="es">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <!--<script type="text/javascript" src="fancybox/jquery.fancybox.pack-v=2.1.5.js"></script>-->
        <title>Eagle Vision</title> 
        <meta name="description" content="Eagle Vision   -   Sistema de Gsetion para servicios de transporte" />	    
        <meta name="keywords" content="Eagle Vision, New Lights, Aguila Bicefala, Servicios de Transporte">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"/>
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,600,300,200&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <link rel="prefetch" href="images/zoom.png">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>  
        <link rel="stylesheet" href="css/IndexDesing.css" type="text/css"/>


    </head>

    <body>
        <div class="navbar navbar-fixed-top" data-activeslide="1">
            <div class="container">                
                <!-- .navbar-toggle is used as the toggle for collapsed navbar content -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>


                <div class="nav-collapse collapse navbar-responsive-collapse">
                    <ul class="nav row">
                        <li data-slide="1" class="col-12 col-sm-2"><a id="menu-link-1" href="#slide-1" title="Next Section"><span class="icon icon-home"></span> <span class="text">EAGLE VISION</span></a></li>
                        <li data-slide="2" class="col-12 col-sm-2"><a id="menu-link-2" href="#slide-2" title="Next Section"><span class="icon icon-user"></span> <span class="text">SOBRE NOSOTROS</span></a></li>
                        <li data-slide="3" class="col-12 col-sm-2"><a id="menu-link-3" href="#slide-3" title="Next Section"><span class="icon icon-briefcase"></span> <span class="text">UBICACION</span></a></li>
                        <li data-slide="4" class="col-12 col-sm-2"><a id="menu-link-4" href="#slide-4" title="Next Section"><span class="icon icon-gears"></span> <span class="text">SERVICIOS</span></a></li>
                        <li data-slide="5" class="col-12 col-sm-2"><a id="menu-link-5" href="#slide-5" title="Next Section"><span class="icon icon-heart"></span> <span class="text">EQUIPO</span></a></li>
                        <li data-slide="6" class="col-12 col-sm-2"><a id="menu-link-6" href="#slide-6" title="Next Section"><span class="icon icon-envelope"></span> <span class="text">ACCESO/CONTACTO</span></a></li>
                    </ul>
                    <div class="row">
                        <div class="col-sm-2 active-menu"></div>
                    </div>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </div><!-- /.navbar -->


        <!-- === Arrows === -->
        <div id="arrows">
            <div id="arrow-up" class="disabled"></div>
            <div id="arrow-down"></div>
            <div id="arrow-left" class="disabled visible-lg"></div>
            <div id="arrow-right" class="disabled visible-lg"></div>
        </div><!-- /.arrows -->


        <!-- === MAIN Background === -->
        <div class="slide story" id="slide-1" data-slide="1">
            <div class="container">
                <div id="home-row-1" class="row clearfix">
                    <div class="col-12">
                        <img alt="Logo" src="Img/Logo/EagleVision-Logo.png" style="width: 40vh; height: 40vh" />
                        <h1 class="font-semibold">EAGLE VISION  <span class="font-thin">OF TRANSPORT</span></h1>
                        <h4 class="font-thin">Somos una agencia independiente facilitadora de <span class="font-semibold">Servicios de Seguridad y Servicios de Custodia</span> con sede en la <span class="font-semibold">CDMX</span> y operacion en <span class="font-semibold">Todo el Pais</span>.</h4>
                        <br>
                        <br>
                    </div><!-- /col-12 -->
                </div><!-- /row -->
                <div id="home-row-2" class="row clearfix">
                    <div class="col-12 col-sm-4"><div class="home-hover navigation-slide" data-slide="4"><img alt="Profesional" src="images/s02.png"></div><span>Profesionales en el Ambito</span></div>
                    <div class="col-12 col-sm-4"><div class="home-hover navigation-slide" data-slide="3"><img alt="Factible" src="images/s01.png"></div><span>Negocios Factibles</span></div>
                    <div class="col-12 col-sm-4"><div class="home-hover navigation-slide" data-slide="5"><img alt="Sustentable" src="images/s03.png"></div><span>Socialmente Responsables</span></div>
                </div><!-- /row -->
            </div><!-- /container -->
        </div><!-- /slide1 -->

        <!-- === Slide 2 === -->
        <div class="slide story" id="slide-2" data-slide="2">
            <div class="container">
                <div class="row title-row">
                    <div class="col-12 font-thin">El alto índice delictivo y a la creciente inseguridad en Mexico nos obliga a implementar día con día nuevos esquemas de seguridad y a una constante búsqueda de nuevas tecnologías.</div>
                </div><!-- /row -->
                <div class="row line-row">
                    <div class="hr">&nbsp;</div>
                </div><!-- /row -->
                <div class="row subtitle-row">
                    <div class="col-12 font-thin"><span class="font-semibold">Grupo Águila Bicéfala </span>nos ofrece:</div>
                </div><!-- /row -->
                <div class="row content-row">
                    <div class="col-12 col-lg-3 col-sm-6">
                        <p><i class="icon icon-eye-open"></i></p>
                        <h2 class="font-thin">Custodia de <span class="font-semibold">Transportes</span></h2>
                        <h4 class="font-thin"></h4>
                    </div><!-- /col12 -->
                    <div class="col-12 col-lg-3 col-sm-6">
                        <p><i class="icon icon-laptop"></i></p>
                        <h2 class="font-thin"><span class="font-semibold">Proceso y Custodia</span> de Valores</h2>
                        <h4 class="font-thin"></h4>
                    </div><!-- /col12 -->
                    <div class="col-12 col-lg-3 col-sm-6">
                        <p><i class="icon icon-tablet"></i></p>
                        <h2 class="font-thin">Asesorias sobre<span class="font-semibold"> Seguridad</span></h2>
                        <h4 class="font-thin"></h4>
                    </div><!-- /col12 -->
                    <div class="col-12 col-lg-3 col-sm-6">
                        <p><i class="icon icon-pencil"></i></p>
                        <h2 class="font-thin"><span class="font-semibold">Guardias</span> Intramuros</h2>                        
                        <h4 class="font-thin"></h4>
                    </div><!-- /col12 -->
                </div><!-- /row -->
            </div><!-- /container -->
        </div><!-- /slide2 -->

        <!-- === SLide 3 - Portfolio -->
        <div class="slide story" id="slide-3" data-slide="3">
            <div class="container">
                <div class="row title-row text-center" style="padding-top: 10px;">
                    <div class="font-thin">Nuestra <span class="font-semibold">Ubicación</span></div>                    
                </div><!-- /row -->
                <div id="map"  style="height: 45vh; color: #000"></div>
                <script>
                    function myMap() {
                        var mapCanvas = document.getElementById("map");
                        var myCenter = new google.maps.LatLng(19.465283, -99.176869);
                        var marcadores = [
                            ['CDMX', 19.465283, -99.176869]
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
                            zoom: 15,
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

        </div><!-- /slide3 -->

        <!-- === Slide 4 - Process === -->
        <div class="slide story" id="slide-4" data-slide="4">
            <div class="container">
                <div class="row title-row">
                    <div class="col-12 font-thin">Nuestros <span class="font-semibold">Servicios</span></div>
                </div><!-- /row -->
                <div class="row line-row">
                    <div class="hr">&nbsp;</div>
                </div><!-- /row -->
                <div class="row subtitle-row">
                    <div class="col-sm-1 hidden-sm">&nbsp;</div>
                    <div class="col-12 col-sm-10 font-light">El sistema permite la administración y gestión de servicios asi como de recursos y personal.</div>
                    <div class="col-sm-1 hidden-sm">&nbsp;</div>
                </div><!-- /row -->
            </div><!-- /container -->
        </div><!-- /slide4 -->

        <!-- === Slide 5 === -->
        <div class="slide story" id="slide-5" data-slide="5">
            <div class="container">
                <div class="row title-row">
                    <div class="col-12 font-thin">Nuestro <span class="font-semibold">Equipo </span>de trabajo</div>
                </div><!-- /row -->
                <div class="row line-row">
                    <div class="hr">&nbsp;</div>
                </div><!-- /row -->
                <div class="row content-row text-center placeholders">
                    <div class="col-6 col-sm-3 placeholder">
                        <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                        <h4>Rubio Haro Rodrigo Rodolfo</h4>
                    </div>
                    <div class="col-6 col-sm-3 placeholder">
                        <img src="data:image/gif;base64,R0lGODlhAQABAIABAADcgwAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                        <h4>Morales Rodriguez Diego Emilio</h4>
                    </div>
                    <div class="col-6 col-sm-3 placeholder">
                        <img src="data:image/gif;base64,R0lGODlhAQABAIABAAJ12AAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                        <h4>Perez Cisneros Miguel Angel</h4>
                    </div>
                    <div class="col-6 col-sm-3 placeholder">
                        <img src="data:image/gif;base64,R0lGODlhAQABAIABAADcgwAAACwAAAAAAQABAAACAkQBADs=" width="200" height="200" class="img-fluid rounded-circle" alt="Generic placeholder thumbnail">
                        <h4>Gomez Garibay Hiram Alejandro</h4>
                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </div><!-- /slide5 -->

        <!-- === Slide 6 / Contact === -->
        <div class="slide story" id="slide-6" data-slide="6">
            <div class="container">
                <div class="row title-row">
                    <div class="col-12 font-light">Acceder al <span class="font-semibold">SOTS</span> de New Lights</div>
                </div><!-- /row -->
                <div class="row form-group">
                    <form>

                        <div class="col-lg-3 col-sm-2"></div>
                        <div class="col-lg-6 col-sm-10 font-light">
                            Usuario

                            <div class="form-group has-feedback">                            
                                <input required placeholder="Ingresa aqui tu usuario (correo o ID)"  type="text" autocomplete="on" class="form-control text-center" name="Usuario" id="Usuario" />
                            </div>
                            Contraseña 
                            <div class="form-group has-feedback">                               
                                <input placeholder="*** Ingresa aqui tu password ***" type="password" class="form-control text-center"  name="Pass" required  placeholder="Contraseña" id="Pass"/>                    
                            </div>
                            <div class="form-group">                                                        
                                <button class="btn btn-default center-block" onclick="return Validacion()" onsubmit="return Validacion()" type="submit" >Iniciar Sesión</button>
                            </div> 
                            <div class="form-group text-center" style="text-align: center;">
                                <a class="link center-block" href="RecuperarPassword.jsp">Recuperar password</a>
                            </div>
                        </div>



                    </form>
                </div><!-- /form-control -->
                <div class="row line-row">
                    <div class="hr">&nbsp;</div>
                </div><!-- /row -->
                <div class="row title-row">
                    <div class="col-12 font-light">Dejanos tu <span class="font-semibold">mensaje ;)</span></div>
                </div><!-- /row -->
                <div class="row subtitle-row">
                    <div class="col-sm-1 hidden-sm">&nbsp;</div>
                    <div class="col-12 col-sm-10 font-light">Valoramos tu opinion, estamos para servirte</div>
                    <div class="col-sm-1 hidden-sm">&nbsp;</div>

                </div><!-- /row -->
                <div class="row subtitle-row">
                    <div class="col-12 col-sm-2 "
                        <span class=" font-light ">
                            +44 <a class="glyphicon glyphicon-earphone"> ed</a> 4839-4343</span>
                    </div><!-- /col12 -->
                </div>
            </div><!-- /container -->
        </div><!-- /Slide 6 -->
        <!-- SCRIPTS -->
        <script src="js/html5shiv.js"></script>
        <script src="js/jquery-1.10.2.min.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/bootstrap.min_1.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>

        <script src="js/script.js"></script>        
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBclln4gWIxJu6PglA4qEwAyfyGTPMKu1c&callback=myMap"></script>
    </body>
    <%//@include file="WEB-INF/jspf/ModalError.jspf" %>
    <%//@include file="WEB-INF/jspf/ModalIniciarSesion.jspf" %>
    <%//@include file="WEB-INF/jspf/ModalRegistrar.jspf" %>
    <%//@include file="WEB-INF/jspf/ModalContacto.jspf" %>

</html>
