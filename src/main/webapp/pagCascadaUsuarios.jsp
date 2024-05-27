<%-- 
    Document   : pagCascadaUsuarios
    Created on : 27 may 2024, 09:09:00
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DaoUsuarios"%>
<%@page import="modelo.*"%>
        
    <!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Consulta de Usuarios por Departamento</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@include file="MenuAdmin.jsp"%>

    <div class="container">
        <h1>Consulta de Clientes por Departamento</h1>
        
        <form>
            <div class="form-group">
                <label>Seleccione Departamento</label>
                <select name="departamento" class="form-control" onchange="submit()">
                    <option value="">--elegir--</option>
                    <%
                        DaoUsuarios daoUsuarios = new DaoUsuarios();
                        String selectedDepartamento = request.getParameter("departamento");
                        
                        for (String dept : daoUsuarios.getDepartamentosCli()) {
                            if (selectedDepartamento != null && selectedDepartamento.equals(dept)) {
                                out.print("<option value=\"" + dept + "\" selected>" + dept + "</option>");
                            } else {
                                out.print("<option value=\"" + dept + "\">" + dept + "</option>");
                            }
                        }
                    %>
                </select>
            </div>
        </form>

        <%
            if (selectedDepartamento != null && !selectedDepartamento.isEmpty()) {
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
                        for (Usuario usu : daoUsuarios.getClientePorDepartamento(selectedDepartamento)) {
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
        %>
            <p>No se encontraron usuarios en el departamento seleccionado.</p>
        <%
            }
        %>
    </div>
       <div class="container">
        <h1>Consulta de Empleados por Departamento</h1>
        
        <form>
            <div class="form-group">
                <label>Seleccione Departament</label>
                <select name="departament" class="form-control" onchange="submit()">
                    <option value="">--elegir--</option>
                    <%
                        DaoUsuarios daE = new DaoUsuarios();
                        String selecteddepE = request.getParameter("departament");
                        
                        for (String deptE : daE.getDepartamentosEmp()) {
                            if (selecteddepE != null && selecteddepE.equals(deptE)) {
                                out.print("<option value=\"" + deptE + "\" selected>" + deptE + "</option>");
                            } else {
                                out.print("<option value=\"" + deptE + "\">" + deptE + "</option>");
                            }
                        }
                    %>
                </select>
            </div>
        </form>

        <%
            if (selecteddepE != null && !selecteddepE.isEmpty()) {
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
                        for (Usuario usuE : daE.getEmpleadoPorDepartamento(selecteddepE)) {
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
        %>
            <p>No se encontraron usuarios en el departamento seleccionado.</p>
        <%
            }
        %>
    </div>
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>