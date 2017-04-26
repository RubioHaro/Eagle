<%-- 
    Document   : Mensajes
    Created on : 25/04/2017, 10:32:08 PM
    Author     : chavo
--%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page import="Usuarios.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%            String title = "Mensajes";
            Usuario User = (Usuario) sesion.getAttribute("Usuario");

        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>                
        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>
        <!-- Ionicons -->

    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.jspf" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="box box-warning direct-chat direct-chat-warning">
                        <div class="box-header with-border">
                            <h3 class="box-title">Chat en directo</h3>
                            <div class="box-tools pull-right">
                                <span data-toggle="tooltip" title="x mensajes nuevos class="badge bg-yellow">3</span>
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="glyphicon glyphicon-minus"></i>
                                </button>
                                <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Contactos" data-widget="chat-pane-toggle">
                                    <i class="glyphicon glyphicon-list"></i></button>
                                <!--<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="glyphicon glyphicon-remove"></i>
                                </button>-->
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- Conversations are loaded here -->
                            <div class="direct-chat-messages">
                                <!-- Message. Default to the left -->
                                <div class="direct-chat-msg">
                                    <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-left">user 1</span>
                                        <span class="direct-chat-timestamp pull-right">fecha y hora 1</span>
                                    </div>
                                    <!-- /.direct-chat-info -->
                                    <img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="message user image"><!-- /.direct-chat-img -->
                                    <div class="direct-chat-text">
                                        Mensaje izquierdo
                                    </div>
                                    <!-- /.direct-chat-text -->
                                </div>
                                <!-- /.direct-chat-msg -->

                                <!-- Message to the right -->
                                <div class="direct-chat-msg right">
                                    <div class="direct-chat-info clearfix">
                                        <span class="direct-chat-name pull-right">user 2</span>
                                        <span class="direct-chat-timestamp pull-left">fecha y hora 2</span>
                                    </div>
                                    <!-- /.direct-chat-info -->
                                    <img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image"><!-- /.direct-chat-img -->
                                    <div class="direct-chat-text">
                                        Mensaje derecho
                                    </div>
                                    <!-- /.direct-chat-text -->
                                </div>
                                <!-- /.direct-chat-msg -->
                            </div>
                            <!--/.direct-chat-messages-->

                            <!-- Contacts are loaded here -->
                            <div class="direct-chat-contacts">
                                <ul class="contacts-list">
                                    <li>
                                        <a href="#">
                                            <img class="contacts-list-img" src="dist/img/user1-128x128.jpg" alt="User Image">

                                            <div class="contacts-list-info">
                                                <span class="contacts-list-name">
                                                    Contacto 1
                                                    <small class="contacts-list-date pull-right">25/04/2017</small>
                                                </span>
                                                <span class="contacts-list-msg">Mensaje ..</span>
                                            </div>
                                            <!-- /.contacts-list-info -->
                                        </a>
                                    </li>
                                    <!-- End Contact Item -->
                                </ul>
                                <!-- /.contatcts-list -->
                            </div>
                            <!-- /.direct-chat-pane -->
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <form action="#" method="post">
                                <div class="input-group">
                                    <input type="text" name="message" placeholder="Escribir Mensaje ..." class="form-control">
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-warning btn-flat">Enviar</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-footer-->
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
