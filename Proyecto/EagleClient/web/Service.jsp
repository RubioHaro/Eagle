<%-- 
    Document   : Service
    Created on : 24-nov-2016, 0:53:36
    Author     : Rod y Miguel
--%>
<%@include file="../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page import="BD.ControladorDeBDD"%>
<%@page import="Catalogo.ListOfproducts"%>
<%@page import="Catalogo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Usuarios.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            ControladorDeBDD control = new ControladorDeBDD();
            String title = "Servicios";            
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>        
        <%@include file="../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../WEB-INF/jspf/Clientes/AllResourcesIndex_Cliente.jspf" %>
    </head>
    <body>               
        <%@include file="../WEB-INF/jspf/Clientes/nvar.html" %> 
        <div id="Precios" class="container-fluid text-center">
            <div class="text-center">                
                <%                    
                    ArrayList<String> arreglito = control.getEncabezadoCatalogo();
                    String c1;
                    String c2;
                    if (arreglito.size() == 2) {
                        c1 = arreglito.get(0);
                        c2 = arreglito.get(1);
                    } else {
                        c1 = "";
                        c2 = "";
                    }
                %>
                <h2><%out.println(c1);%></h2>
                <h4><%out.println(c2);%></h4>                
                <br/><br/>
            </div>
            <%
                
                ListOfproducts ListaDeProductos = control.getProductList();
                if (ListaDeProductos.getTamañoLista() == 0) {
                    out.println("No hay productos");
            %>
            <br/><br/>

            <%
                }
                int Rows;
                int Res = ListaDeProductos.getResOfColumns();

                if (ListaDeProductos.getTamañoLista() > 0 && ListaDeProductos.getTamañoLista() < 3) {
                    Rows = 1;
                } else {
                    Rows = ListaDeProductos.getRows();
                }
                int NumberService = 0;
                for (int i = 0; i < Rows; ++i) {


            %>
            <div class="row">
                <%  //                  
                    int columnas;
                    if (Res > 0 && (i + 1) == Rows) {
                        columnas = Res;
                    } else {
                        columnas = 3;
                    }
                    for (int e = 0; e < columnas; ++e) {

                        Producto prodct = new Producto();
                        prodct = ListaDeProductos.GetService(NumberService);
                        NumberService++;
                %>
                <div class="col-sm-4 col-xs-12">                    
                    <div class="panel panel-default text-center">
                        <div class="panel-heading">
                            <h1><%out.println(prodct.getNombreProducto());%></h1>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="form-control-static">
                                    <%
                                        out.println(prodct.getDescripcion());
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <h3>$<%out.println(prodct.getCosto());%>mxn</h3>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <form method="post" action="\AddService" name="AddService">
                                        <button type="submit" name="ADD" value="<%out.println(prodct.getIdProcuto());%>" class="btn btn-lg btn-success"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Solicitar</button>
                                    </form>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <br/>
            <%            }
                %>

        </div>
        <%@include file="../WEB-INF/jspf/ModalConfigClient.jspf" %> 
        <%@include file="../WEB-INF/jspf/Clientes/ModalCerrarSesion.jsp" %> 
    </body>
</html>
