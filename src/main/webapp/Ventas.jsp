<%-- 
    Document   : Ventas
    Created on : 27 may 2024, 23:32:42
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DaoVentas" %>
<%@page import="modelo.Ventas" %>
<%@page import="modelo.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">     
        <title>JSP Page</title>
        <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link href="CSS/all.css" rel="stylesheet" type="text/css" crossorigin="anonymous"/>
        <link href="CSS/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/sweetalert.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <body>
         <%@include file="MenuAdmin.jsp"%>
         
        <%
            DaoVentas obj = new DaoVentas();
            String id_venta = "", id_usuario = "";
            if (request.getParameter("cbe") != null)
                id_venta = request.getParameter("cbe");
            if (request.getParameter("cba") != null)
                id_usuario = request.getParameter("cba");
        %>    

        <h1>Consulta en cascada</h1>
        <form>
            <div class="container-fluid">
            <div class="form-group">
                <label>Seleccione venta</label>
                <select name="cbe" class="form-control" onchange="submit()">
                    <option value="">-- seleccione codigo--</option>
                    <%
                        for (Ventas v : obj.listarVentas()) {
                            if (id_venta.equals(String.valueOf(v.getId_ventas()))) {
                                out.print("<option value=\"" + v.getId_ventas() + "\" selected>" + v.getId_ventas() + "</option>");
                            } else {
                                out.print("<option value=\"" + v.getId_ventas() + "\">" + v.getId_ventas() + "</option>");
                            }
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Seleccione cliente</label>
                <select name="cba" class="form-control" onchange="submit()">
                    <option value="">--elegir--</option>
                    <%
                        for (Usuario x : obj.LisCliC(id_venta)) {
                            if (id_usuario.equals(String.valueOf(x.getId_usu()))) {
                                out.print("<option value=\"" + x.getId_usu() + "\" selected>" + x.getNom_usuario() + "</option>");
                            } else {
                                out.print("<option value=\"" + x.getId_usu() + "\">" + x.getNom_usuario() + "</option>");
                            }
                        }
                    %>    
                </select>
            </div>
                </div>
        </form>

        <table class="table table-bordered">
            <tr>
                <th>Cod compra</th>
                <th>Monto</th>
                <th>Id cliente</th>
                <th>Tipo Comprobante</th>
                <th>Fecha</th>
            </tr>
            <%
                for (Ventas z : obj.LisVenID(id_usuario)) {
                    out.print("<tr><td>" + z.getId_ventas() + "<td>" + z.getMont_final() + "<td>" + z.getId_usuario() +
                    "<td>" + z.getId_tipoComp() + "<td>" + z.getFecha() + "</td></tr>");
                }
            %>   
        </table>     
    </body>
</html>
