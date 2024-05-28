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
     <div class="container-fluid">
                 <div class="row">
         <div class="col-sm-10">
        <!-- Grafico productos segun categoria-->

        <%
            DaoCategoria obj = new DaoCategoria();
            DaoProducto obj2 = new DaoProducto();

            String codc = "";
            if (request.getParameter("cbc") != null) {
                codc = request.getParameter("cbc");
            }

            String label = "'Kingston','Crucial','Adata','Asus','Generico','Gigabit','AMD'";
            String data = "";
            int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5 = 0, c6 = 0, c7 = 0;
            int stock = 0, stock1 = 0, stock2 = 0, stock3 = 0, stock4 = 0, stock5 = 0, stock6 = 0, stock7 = 0;
            for (Producto x : obj2.LisProducto(codc)) {
                if (x.getMarca().equalsIgnoreCase("kingston")) {
                    stock = x.getStock();
                    c1++;
                } else if (x.getMarca().equalsIgnoreCase("Crucial")) {
                    stock1 += x.getStock();
                    c2++;
                } else if (x.getMarca().equalsIgnoreCase("Adata")) {
                    stock2 += x.getStock();
                    c3++;
                } else if (x.getMarca().equalsIgnoreCase("Asus")) {
                    stock3 += x.getStock();
                    c4++;
                } else if (x.getMarca().equalsIgnoreCase("Generico")) {
                    stock4 += x.getStock();
                    c5++;
                } else if (x.getMarca().equalsIgnoreCase("Gigabit")) {
                    stock5 += x.getStock();
                    c6++;
                } else if (x.getMarca().equalsIgnoreCase("amd")) {
                    stock6 += x.getStock();
                    c7++;
                }
            }
            data = stock + "," + stock1 + "," + stock2 + "," + stock3 + "," + stock4 + "," + stock5 + "," + stock6;

        %>
        <div >
            <div class="row">
                <div class="col-sm-10">
                    <div class="card">
                        <div class="card-body">
                         <form>
<form>
                                <div class="form-group">
                                    <label>Consulte stock de productos</label>
                                    <select name="cbc" class="form-control" onchange="submit()">
                                        <option>--elegir--</option>

                                        <%
                                            for (Categoria x : obj.LisCategoria()) {
                                                if (codc.equals(x.getId_cat())) {
                                                    out.print("<option value=" + x.getId_cat() + " selected>" + x.getNombre());
                                                } else {
                                                    out.print("<option value=" + x.getId_cat() + ">" + x.getNombre());
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div><!-- comment -->


                                </div>


                            </form>

                            <table class="table table-bordered">
                                <tr>
                                    <th>Codigo
                                    <th>Nombre
                                    <th>Marca
                                    <th>Stock
                                    <%
                                        for (Producto x : obj2.LisProducto(codc)) {
                                            out.print("<tr><td>" + x.getId_prod() + "<td>" + x.getNombre() + "<td>" + x.getMarca() + "<td>" + x.getStock());
                                        }

                                    %>
                            </table>
                        </div>
                    </div>

                </div>

            </div>
            <div class="row">
                <div class="col-sm-10">
                    <div class="container">
                        <center>
                     <label>Grafico de stock  por productos</label>
                        <div>
                            <canvas id="myChart"></canvas>
                        </div>
                        </center>
                    </div>


                </div>
            </div>
        </div>
        <script>
            var ctx = document.getElementById("myChart").getContext("2d");
            var myChart = new Chart(ctx, {
                type: "line",
                data: {
                    labels: [<%=label%>],
                    datasets: [
                        {
                            label: "Stock de productos",
                            data: [<%=data%>],
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


        
