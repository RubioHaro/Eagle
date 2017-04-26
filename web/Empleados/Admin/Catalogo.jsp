<%-- 
    Document   : Catalogo
    Created on : 26-nov-2016, 14:51:01
    Author     : Rod y Miguel
--%>
<%@include file="../../WEB-INF/jspf/ValidadorDeSesion.jspf" %>
<%@page import="java.util.ArrayList"%>
<%@page import="Catalogo.Producto"%>
<%@page import="Catalogo.ListOfproducts"%>
<%@page import="BD.ControladorDeBDD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%            ControladorDeBDD control = new ControladorDeBDD();
            String title = "Catalogo";
            int IdProducto;
            Producto prod = new Producto();
            String ID = request.getParameter("Edit");
            boolean c;
            if (ID != null) {
                c=true;
                IdProducto = Integer.parseInt(ID.trim());
                prod = control.GetProducto(IdProducto);
                
            } else {
                c=false;
                IdProducto = -1;
            }
            sesion.setAttribute("Idp", IdProducto);
            Usuario User = (Usuario) sesion.getAttribute("Usuario");
        %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalModificarServicio.jspf" %>
        <% 
            if(c){
                out.println("<script>document.getElementById('ModalModServ').style.display='block';</script>"); 
            }
            
        %>
        <%@include file="../../WEB-INF/jspf/ModalError.jspf" %>        
        <%@include file="../../WEB-INF/jspf/Declaration.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/AllResourcesIndex_Admin.jspf" %>

    </head>
    <body>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/nvar.jspf" %> 

        <div id="Precios" class="container-fluid text-center">
            <div class="text-center">
                <button onclick="EncabezadoCatalogo('Catalogo')" class="btn btn-default btn-default"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Editar Encabezado </button>
                <%                    ArrayList<String> arreglito = control.getEncabezadoCatalogo();
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
                <button onclick="ClickOpensModal('Añadir Servicio', 'ModalServ')"  class="btn btn-default btn-success"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> Añadir Producto </button>
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
                                <div class="form-control-static">
                                    <strong>Visible: 
                                        <%
                                            if (prodct.getEstatus() == 1) {
                                                out.println("<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>");
                                            } else {
                                                out.println("<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>");
                                            }

                                        %>
                                    </strong>
                                </div>

                            </div>
                        </div>
                        <div class="panel-footer">
                            <h3>$<%out.println(prodct.getCosto());%>mxn</h3>
                            <div class="row">
                                <div class="col-md-6 text-right">
                                    <form method="post" action="Catalogo.jsp" name="Edit">
                                        <button type="submit" name="Edit" value="<%out.println(prodct.getIdProcuto());%>" class="btn btn-lg btn-warning"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Editar</button>
                                    </form>
                                </div>
                                <div class="col-md-6 text-left">
                                    <form method="post" action="../../Delete " name="Delete">
                                        <button type="submit" onsubmit="ClickBorrarProducto()" onclick="ClickBorrarProducto()" name='Delete' value="<%out.println(prodct.getIdProcuto());%>" class="btn btn-lg btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Eliminar</button>
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
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/EncabezadoCatalogo.jspf" %> 
        <%@include file="../../WEB-INF/jspf/ModalConfigClient.jspf" %>
        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalAgregarServicio.jspf" %>

        <%@include file="../../WEB-INF/jspf/Empleados/Admin/ModalCerrarSesion.jsp" %> 
    </body>
</html>
