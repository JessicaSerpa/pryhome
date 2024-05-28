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
            <!-- Grafico usuarios por edad-->

            <%
                DaoUsuarios objEd = new DaoUsuarios();
  
               
            %>   
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-10"> 
                        <div class="card">
                            <div class="card-body">

                                    <form id="formFiltrar" method="get"> <!-- Agrega un ID al formulario -->
                            <label>Consulte usuario por edad </label>
                            <select id="opcion1" name="opcion1" class="form-control" onchange="document.getElementById('formFiltrar').submit();"> <!-- Agrega un evento onchange -->
                                <option value="" <% if (request.getParameter("opcion1") == null || request.getParameter("opcion1").isEmpty()) { out.print("selected"); } %>>--elegir--</option>
                                <option value="cliente" <% if ("cliente".equals(request.getParameter("opcion1"))) { out.print("selected"); } %>>Cliente</option>
                                <option value="administrador" <% if ("administrador".equals(request.getParameter("opcion1"))) { out.print("selected"); } %>>Administrador</option>
                            </select>
                            <!-- Elimina el botón de enviar -->
                        </form>
                               
                                <table class="table table-bordered">
                                 
                                        <tr><th>Codigo<th>Nombre<th>Edad<th>Tipo usuario
                                                <%  
                                                    String opcionSeleccionada = request.getParameter("opcion1");
                                                    int tipo=0;
                                                    
                                                    if (opcionSeleccionada != null && !opcionSeleccionada.isEmpty()) {
                                                        for (Usuario g : objEd.LisAllUsuario()) {
                                                            if (opcionSeleccionada.equalsIgnoreCase("cliente") && g.getTipo_usuario().equalsIgnoreCase("cliente")) {%>
                                        <tr>
                                            <td><%= g.getId_usu()%></td>
                                            <td><%= g.getNom_usuario()%></td>
                                            <td><%= g.getEdad()%></td>
                                            <td><%= g.getTipo_usuario()%></td>
                                        </tr>
                                        <%
                                             tipo=1;
                                            } else if (opcionSeleccionada.equalsIgnoreCase("administrador") && g.getTipo_usuario().equalsIgnoreCase("administrador")) {
                                                tipo=2;
                                         %>
                                        <tr>
                                            <td><%= g.getId_usu()%></td>
                                            <td><%= g.getNom_usuario()%></td>
                                            <td><%= g.getEdad()%></td>
                                            <td><%= g.getTipo_usuario()%></td>
                                        </tr>
                                        <% }
                                                }
                                            }
                                        %>
                                </table>
                            </div>          
                        </div>  

                    </div> 
                                        <%
                                            String la = "'18-25','26-35','36-50','51-65','>65'";
                                            String d = "";
                                            int z1 = 0, z2 = 0, z3 = 0, z4 = 0, z5 = 0;
                                            String tipoU = "";
                                            for (Usuario g : objEd.LisAllUsuario()) {

                                                if (tipo == 1) {
                                                    tipoU = "CLIENTES";
                                                    if (opcionSeleccionada.equalsIgnoreCase("cliente") && g.getTipo_usuario().equalsIgnoreCase("cliente")) {

                                                        if (g.getEdad() <= 25) {

                                                            z1++;
                                                        } else if (g.getEdad() <= 35) {

                                                            z2++;
                                                        } else if (g.getEdad() <= 50) {

                                                            z3++;
                                                        } else if (g.getEdad() <= 65) {

                                                            z4++;
                                                        } else {

                                                            z5++;
                                                        }
                                                    }
                                                } else if (tipo == 2) {
                                                    tipoU = "EMPLEADOS";
                                                    if (opcionSeleccionada.equalsIgnoreCase("administrador") && g.getTipo_usuario().equalsIgnoreCase("administrador")) {

                                                        if (g.getEdad() <= 25) {

                                                            z1++;
                                                        } else if (g.getEdad() <= 35) {

                                                            z2++;
                                                        } else if (g.getEdad() <= 50) {

                                                            z3++;
                                                        } else if (g.getEdad() <= 65) {

                                                            z4++;
                                                        } else {

                                                            z5++;
                                                        }
                                                    }

                                                }

                                            }
                                            d = d + z1 + "," + z2 + "," + z3 + "," + z4 + "," + z5;


                                        %>

                </div>  
                <div class="row">
                    <div class="col-sm-10">
                        <div class="container">
                              <label>Grafico de usuario por edad <%=tipoU%></label>
                         
                            <div>
                                <canvas id="myChart4"></canvas>
                            </div>
                        </div>


                    </div>
                </div> 
            </div>
                                 <script>
  var ctx = document.getElementById("myChart4").getContext("2d");
  var myChart4 = new Chart(ctx, {
    type: "bar",
    data: {
      labels: [<%=la%>],
      datasets: [
        {
          label: "Total de usuarios",
          data: [<%=d%>],
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
  
  
         
        