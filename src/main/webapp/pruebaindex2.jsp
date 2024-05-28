<%-- 
    Document   : consultaEmpleados
    Created on : 27 may 2024, 21:21:16
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DaoUsuarios"%>
<%@page import="modelo.*"%>
<%
    String departament = request.getParameter("departament");
    DaoUsuarios daoUsuarios = new DaoUsuarios();
    if (departament != null && !departament.isEmpty()) {
%>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>ID Usuario</th>
                <th>Nombre</th>
                <th>Departamento</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Usuario usuE : daoUsuarios.getEmpleadoPorDepartamento(departament)) {
                    out.print("<tr>");
                    out.print("<td>" + usuE.getId_usu() + "</td>");
                    out.print("<td>" + usuE.getNom_usuario() + "</td>");
                    out.print("<td>" + usuE.getDepartamento() + "</td>");
                    out.print("</tr>");
                }
            %>
        </tbody>
    </table>
<%
    } else {
        out.print("<p>No se encontraron empleados en el departamento seleccionado.</p>");
    }
%>
