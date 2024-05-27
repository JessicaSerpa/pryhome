<%-- 
    Document   : pagina_administrador
    Created on : 14 may 2024, 19:19:27
    Author     : USUARIO
--%>

<%@page import="modelo.Usuario"%>
<%@page import="dao.DaoUsuarios"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Producto"%>
<%@page import="dao.DaoProducto"%>
<%@page import="dao.DaoCategoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
        <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <style>
          .container {
            width: 100%;
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
        
        <title>JSP Page</title>
    </head>
    <body>
        
        <%@include file="MenuAdmin.jsp"%>
             <!-- Aquí va el contenido principal de la página-->
       
        
        <div class="col-sm-12">
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
                int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5=0, c6=0, c7=0;
                int stock=0,stock1=0,stock2=0,stock3=0,stock4=0,stock5=0,stock6=0, stock7=0;
                    for (Producto x : obj2.LisProducto(codc)) {
                        if (x.getMarca().equalsIgnoreCase("kingston")) {
                            stock= x.getStock();
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
                            stock5+= x.getStock();
                            c6++;
                        } else if(x.getMarca().equalsIgnoreCase("amd")){
                            stock6+= x.getStock();
                            c7++;
                        }   
                    }
                data = stock + "," + stock1 + "," + stock2 + "," + stock3+ "," + stock4+ "," + stock5+ "," + stock6;

            %>   
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-5"> 
                        <div class="card">
                            <div class="card-body">
                                <form>
                                    <div class="form-group">
                                        <label><h4>Seleccione categoria de producto</label>
                                        <select name="cbc" class="form-control" onchange="submit()">
                                            <option>Elegir</option>
                                            
                                            <%  for (Categoria x : obj.LisCategoria()) {
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
                                        <h1>

                                    </div>


                                </form>    
                                <table class="table table-bordered">
                                    <tr><th>Codigo<th>Nombre<th>Marca<th>Stock
                                            <%
                                                for (Producto x : obj2.LisProducto(codc)) {
                                                    out.print("<tr><td>" + x.getId_prod() + "<td>" + x.getNombre() + "<td>" + x.getMarca()+"<td>" + x.getStock());
                                                }

                                            %> 
                                </table>
                            </div>          
                        </div>  

                    </div> 

                </div>  
                                
                <div class="row">
                    <div class="col-sm-5">
                        <div class="container">
                            <h4>GRAFICO DE PRODUCTOS </h4>
                            <div>
                                <canvas id="myChart"></canvas>
                            </div>
                        </div>


                    </div>
                </div> 
                                
                                <!<!-- lista de usuarios  -->
         <div>
                
            <%
                DaoUsuarios obj3 = new DaoUsuarios();
  
                String codc1 = "";
                if (request.getParameter("cbc") != null) {
                    codc = request.getParameter("cbc");
                }

                String label1 = "'18-25','26-35','36-50','51-65','>65'";
                String data1 = "";
                int u1 = 0, u2 = 0, u3 = 0, u4 = 0, u5=0;
                //int stock=0,stock1=0,stock2=0,stock3=0,stock4=0,stock5=0,stock6=0;
                    for (Usuario x : obj3.LisAllUsuario()) {
                        if (x.getEdad()<=25) {
                         
                            u1++;
                        } else if (x.getEdad()<=35)  {
                      
                            u2++;
                        }else if (x.getEdad()<=50)  {
                      
                            u3++;
                        }else if (x.getEdad()<=65)  {
                      
                            u4++;
                        }else {
                          
                            u5++;
                        }   
                    }
                data1 = data1 +u1+ "," + u2+ "," + u3 + "," + u4+ "," + u5;

            %>   
           
                <div class="row">
                    <div class="col-sm-5"> 
                        <div class="card">
                            <div class="card-body">
                                <form>
                            
                                </form>    
                                <table class="table table-bordered">
                                    <thead><h2>Lista de usuarios</thead>
                                    <tr><th>Codigo<th>Nombre<th>Edad
                                            <%
                                                for (Usuario x : obj3.LisAllUsuario()){
                                                    out.print("<tr><td>" + x.getId_usu()+ "<td>" + x.getNom_usuario()+ "<td>" + x.getEdad());
                                                }

                                            %> 
                                </table>
                            </div>          
                        </div>  

                    </div> 

                </div>  
                <div class="row">
                    <div class="col-sm-5">
                        <div class="container">
                            <h4>GRAFICO DE EDADES DE USUARIOS</h4>
                            <div>
                                <canvas id="myChart1"></canvas>
                            </div>
                        </div>


                    </div>
                </div> 
            </div>
        </div>
            </div>
        </div>
        
                                 
        <div >
   
        
    </body>
 <!<!-- grafico para productos por categoria -->
    <script>
  var ctx = document.getElementById("myChart").getContext("2d");
  var myChart = new Chart(ctx, {
    type: "bar",
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
    <!<!-- grafico para usuarios  -->
     <script>
  var ctx = document.getElementById("myChart1").getContext("2d");
  var myChart = new Chart(ctx, {
    type: "bar",
    data: {
      labels: [<%=label1%>],
      datasets: [
        {
          label: "Total de usuarios",
          data: [<%=data1%>],
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
</html>
