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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <label>Consulte empleados por departamento</label>
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
            
<%
            DaoEmpleados daoEmpleados= new DaoEmpleados();
            List<Usuario> empleados = daoEmpleados.getAllEmpleados();

            Map<String, Integer> depaCount = new HashMap<>();

            for (Usuario empleado : empleados) {
                String departamento = empleado.getDepartamento();
                if (departamento != null) {
                    departamento = departamento.trim().toLowerCase(); // Normalizar a minúsculas y eliminar espacios
                    depaCount.put(departamento, depaCount.getOrDefault(departamento, 0) + 1);
                }
            }

            StringBuilder labe = new StringBuilder();
            StringBuilder da = new StringBuilder();

            for (Map.Entry<String, Integer> entry : depaCount.entrySet()) {
                if (labe.length() > 0) {
                    labe.append(",");
                    da.append(",");
                }
                labe.append("'").append(entry.getKey()).append("'");
                da.append(entry.getValue());
            }
        %>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-5"> 
                        <div class="card">
                            <div class="card-body">
                                <form>
                            
                                </form>    
                              
                            </div>          
                        </div>  

                    </div> 

                </div>  
                <div class="row">
                    <div class="col-sm-10">
                        <div class="container">
                         <label>Grafico general de empleados por departamento</label>
                            <div>
                                <canvas id="myChart3"></canvas>
                            </div>
                        </div>


                    </div>
                </div> 
            </div>
                    <script>
  var ctx = document.getElementById("myChart3").getContext("2d");
  var myChart3 = new Chart(ctx, {
    type: "bar",
    data: {
      labels:[<%= labe.toString() %>],
      datasets: [
        {
          label: "Total de usuarios",
          data: [<%=da%>],
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