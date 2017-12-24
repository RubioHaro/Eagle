<%-- 
    Document   : ModalCerrarSesion
    Created on : 23-nov-2016, 0:22:49
    Author     : Hiram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="../CerrarSesion.jsp">
            <div id="PopWindowCerrarSesion" class="modal">
                <div class="modal-content animate">
                    <div class="panel">
                        <div class="panel-heading center-block">
                            ¿Está seguro que desea cerrar la sesión?
                            <span onclick="ClickCerrarModal('PopWindowCerrarSesion')" class="close" title="Close Modal">&times;</span>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6"><button class="btn btn-default center-block" onsubmit="ClickCerrarModal('PopWindowCerrarSesion')" onclick="ClickCerrarModal('PopWindowCerrarSesion')" type="submit" >Cerrar</button></div>
                                <div class="col-md-6"><input type="button" class="btn btn-default center-block" onclick="ClickCerrarModal('PopWindowCerrarSesion')"  value="Cancelar"/></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </form>

    </body>
</html>
