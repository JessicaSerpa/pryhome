<%-- 
    Document   : index
    Created on : 27 may 2024, 21:20:35
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
    <title>Consulta de Usuarios y Empleados por Departamento</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <%@include file="MenuAdmin.jsp"%>

    <div class="container">
        <h1>Consulta de Clientes por Departamento</h1>
        
        <div class="form-group">
            <label>Seleccione Departamento</label>
            <select id="departamento" name="departamento" class="form-control">
                <option value="">--elegir--</option>
                <%
                    DaoUsuarios daoUsuarios = new DaoUsuarios();
                    for (String dept : daoUsuarios.getDepartamentosCli()) {
                        out.print("<option value=\"" + dept + "\">" + dept + "</option>");
                    }
                %>
            </select>
        </div>
        <div id="clientesTabla"></div>

        <h1>Consulta de Empleados por Departamento</h1>
        
        <div class="form-group">
            <label>Seleccione Departamento</label>
            <select id="departament" name="departament" class="form-control">
                <option value="">--elegir--</option>
                <%
                    for (String deptE : daoUsuarios.getDepartamentosEmp()) {
                        out.print("<option value=\"" + deptE + "\">" + deptE + "</option>");
                    }
                %>
            </select>
        </div>
        <div id="empleadosTabla"></div>
    </div>

    <script>
        $(document).ready(function() {
            $("#departamento").change(function() {
                var departamento = $(this).val();
                $.ajax({
                    url: "pruebaindex1.jsp",
                    type: "GET",
                    data: { departamento: departamento },
                    success: function(data) {
                        $("#clientesTabla").html(data);
                    }
                });
            });

            $("#departament").change(function() {
                var departament = $(this).val();
                $.ajax({
                    url: "pruebaindex2.jsp",
                    type: "GET",
                    data: { departament: departament },
                    success: function(data) {
                        $("#empleadosTabla").html(data);
                    }
                });
            });
        });
    </script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
