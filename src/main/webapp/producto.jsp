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
  
       DaoProducto obj2 = new DaoProducto();


 %>   
         <!<!-- tabla que lista todos los productos -->
            <div >
             <div class="card">
                 <div class="card-body" >
                     <form>
                        

                     </form>    
                     <table class="table table-bordered">
                         <label>Lista de todos los productos</label>
                         <tr><th>Codigo<th>Nombre<th>Marca<th>Stock<th>Precio<th>Accion
                                 <%
                                     for (Producto x : obj2.LisAllProducto()) {
                                         out.print("<tr><td>" + x.getId_prod() + "<td>" + x.getNombre() + "<td>" + x.getMarca()+"<td>"+x.getStock()+"<td>"+x.getPrecio());
                                     }

                                 %> 
                     </table>
                 </div>          
             </div>
            </div>
                     
     </div>  
 </div>

  </body>

</html>

