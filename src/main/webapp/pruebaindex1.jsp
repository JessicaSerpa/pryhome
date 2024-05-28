<%-- 
    Document   : consultaClientes
    Created on : 27 may 2024, 21:21:03
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DaoUsuarios"%>
<%@page import="modelo.*"%>
<%
    String departamento = request.getParameter("departamento");
    DaoUsuarios daoUsuarios = new DaoUsuarios();
    if (departamento != null && !departamento.isEmpty()) {
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
                for (Usuario usu : daoUsuarios.getClientePorDepartamento(departamento)) {
                    out.print("<tr>");
                    out.print("<td>" + usu.getId_usu() + "</td>");
                    out.print("<td>" + usu.getNom_usuario() + "</td>");
                    out.print("<td>" + usu.getDepartamento() + "</td>");
                    out.print("</tr>");
                }
            %>
        </tbody>
    </table>
<%
    } else {
        out.print("<p>No se encontraron usuarios en el departamento seleccionado.</p>");
    }
%>
