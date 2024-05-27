<%-- 
    Document   : usuario
    Created on : 24 may. 2024, 22:08:01
    Author     : Deyver
--%>

<%@page import="modelo.Usuario"%>
<%@page import="dao.DaoUsuarios"%>
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
                   
        
        <div class="col-sm-12">
            <!-- Grafico productos segun categoria-->

            <%
                DaoUsuarios obj = new DaoUsuarios();
  
                String codc = "";
                if (request.getParameter("cbc") != null) {
                    codc = request.getParameter("cbc");
                }

                String label = "'18-25','26-35','36-50','51-65','>65'";
                String data = "";
                int c1 = 0, c2 = 0, c3 = 0, c4 = 0, c5=0;
                //int stock=0,stock1=0,stock2=0,stock3=0,stock4=0,stock5=0,stock6=0;
                    for (Usuario x : obj.LisAllUsuario()) {
                        if (x.getEdad()<=25) {
                         
                            c1++;
                        } else if (x.getEdad()<=35)  {
                      
                            c2++;
                        }else if (x.getEdad()<=50)  {
                      
                            c3++;
                        }else if (x.getEdad()<=65)  {
                      
                            c4++;
                        }else {
                          
                            c5++;
                        }   
                    }
                data = data +c1+ "," + c2+ "," + c3 + "," + c4+ "," + c5;

            %>   
            <div class="container-fluid">
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
                                                for (Usuario x : obj.LisAllUsuario()){
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
                            <h2>GRAFICO DE EDADES DE USUARIOS</h2>
                            <div>
                                <canvas id="myChart"></canvas>
                            </div>
                        </div>


                    </div>
                </div> 
            </div>
        </div>
        
        
    </body>

    <script>
  var ctx = document.getElementById("myChart").getContext("2d");
  var myChart = new Chart(ctx, {
    type: "bar",
    data: {
      labels: [<%=label%>],
      datasets: [
        {
          label: "Total de usuarios",
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
</html>
