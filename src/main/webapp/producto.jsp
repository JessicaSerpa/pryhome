<%-- 
    Document   : producto
    Created on : 23 may. 2024, 17:43:01
    Author     : Deyver
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*,dao.DaoProducto" %>
<%@page import="modelo.*,dao.DaoCategoria" %>
<!DOCTYPE html>
<html>
  <head>
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
</head>
  <body>
    
<%
   DaoCategoria obj = new DaoCategoria();
       DaoProducto obj2 = new DaoProducto();

       String codc = "";
       if (request.getParameter("cbc") != null) {
           codc = request.getParameter("cbc");
       }
   
      
       String label = "'0','10-20','20-40','41-80'";
       String data = "";
       int c1 = 0, c2 = 0, c3 = 0, c4 = 0;

       for (Producto x : obj2.LisProducto(codc)) {
           if (x.getStock() == 0) {
               c1++;
           } else if (x.getStock() <= 20) {
               c2++;
           } else if (x.getStock() <= 40) {
               c3++;
           } else {
               c4++;
           }
       }

       data = data + c1 + "," + c2 + "," + c3 + "," + c4;
   
 %>   
 <div class="container-fluid">
     <div class="row">
         <div class="col-sm-5"> 
             <div class="card">
                 <div class="card-body">
                     <form>
                         <div class="form-group">
                             <label>Seleccione categoria de producto</label>
                             <select name="cbc" class="form-control" onchange="submit()">
                                 <option>Elegir</option>
                                 <%                                     for (Categoria x : obj.LisCategoria()) {
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
                         <tr><th>Codigo<th>Nombre<th>Stock
                                 <%
                                     for (Producto x : obj2.LisProducto(codc)) {
                                         out.print("<tr><td>" + x.getId_prod() + "<td>" + x.getNombre() + "<td>" + x.getStock());
                                     }

                                 %> 
                     </table>
                 </div>          
             </div>  
         </div>
         <div class="col-sm-7">
             <div class="container">
                 <h2>GRAFICO DE PRODUCTOS </h2>
                 <div>
                     <canvas id="myChart"></canvas>
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
          label: "Stock de productos",
          data: [<%=data%>],
          backgroundColor: ["lightblue", "purple", "yellow", "orange", "blue", "green"],
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

