  <%@page import="dao.DaoUsuarios"%>
<%@page import="dao.DaoEmpleados"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="modelo.Usuario"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Producto"%>
<%@page import="dao.DaoProducto"%>
<%@page import="dao.DaoCategoria"%>
<%@page import="dao.DaoClientes" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
        <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <style>
    .container {
      width: 70%;
      margin: 15px auto;
    }
          body {
            text-align: center;
            color: #5b0cdd;
          }
          h2 {
            text-align: center;
            font-family: "Verdana", sans-serif;
            font-size: 30px;
          }
          
          
        </style>
 
        
    </head>
 
    <body>
<div class="col-sm-10">
                                            <div class="col-sm-10">
        
        <form>
            <div class="form-group">
                <label>Consulte clientes por departamento</label>
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
        
<%
            DaoClientes daoClientes = new DaoClientes();
            List<Usuario> clientes = daoClientes.getAllClientes();

            Map<String, Integer> departamentoCount = new HashMap<>();

            for (Usuario cliente : clientes) {
                String departamento = cliente.getDepartamento();
                if (departamento != null) {
                    departamento = departamento.trim().toLowerCase(); // Normalizar a minúsculas y eliminar espacios
                    departamentoCount.put(departamento, departamentoCount.getOrDefault(departamento, 0) + 1);
                }
            }

            StringBuilder labels = new StringBuilder();
            StringBuilder dat = new StringBuilder();

            for (Map.Entry<String, Integer> entry : departamentoCount.entrySet()) {
                if (labels.length() > 0) {
                    labels.append(",");
                    dat.append(",");
                }
                labels.append("'").append(entry.getKey()).append("'");
                dat.append(entry.getValue());
            }
        %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-10"> 
                        <div >
                            <div>
                                <form>
                            
                                </form>    
                              
                            </div>          
                        </div>  

                    </div> 

                </div>  
                <div class="row">
                    <div class="col-sm-10">
                        <div class="container">
                            <center>
                             <label>Grafico  general clientes por departamento</label>
                            </center>
                            <div>
                                <canvas id="myChart2"></canvas>
                            </div>
                        </div>


                    </div>
                </div> 
            </div>
                    <script>
  var ctx = document.getElementById("myChart2").getContext("2d");
  var myChart2 = new Chart(ctx, {
    type: "pie",
    data: {
      labels:[<%= labels.toString() %>],
      datasets: [
        {
          label: "Total de usuarios",
          data: [<%=dat%>],
          backgroundColor: ["purple", "lightblue", "yellow", "orange", "blue", "green"],
        },
      ],
    },
    options: {
      plugins: {
        datalabels: {
          anchor: 'end',
          align: 'top',
          formatter: (value, context) => {
            return value;
          },
          color: 'purple',
          font: {
            weight: 'bold'
          }
        }
      }
    },
    plugins: [ChartDataLabels]
  });
    </script>
        </div>