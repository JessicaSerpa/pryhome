<%-- 
    Document   : Ventas
    Created on : 27 may 2024, 23:32:42
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DaoVentas,modelo.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@include  file="MenuAdmin.jsp" %>
  
    <body>
        <h1>Consulta en cascada</h1>
        <form method="get">
        <div class="form-group">
            <label>Seleccione un año</label>
            <select name="anio" class="form-control" onchange="this.form.submit()">
                <option value="">-- Seleccionar año --</option>
                <%
                    dao.DaoVentas daoVentas = new dao.DaoVentas();
                    String anioSeleccionado = request.getParameter("anio");
                    java.util.List<modelo.Ventas> listaVentas = daoVentas.listarAniosVentas();

                    for (modelo.Ventas venta : listaVentas) {
                        String anio = String.valueOf(venta.getFecha());
                        if (anioSeleccionado != null && anio.equals(anioSeleccionado)) {
                            out.print("<option value=\"" + anio + "\" selected>" + anio + "</option>");
                        } else {
                            out.print("<option value=\"" + anio + "\">" + anio + "</option>");
                        }
                    }
                %>
            </select>
        </div>
    </form>
            

    </body>
</html>
