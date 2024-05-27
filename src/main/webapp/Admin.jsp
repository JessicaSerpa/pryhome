<%-- 
    Document   : pagina_administrador
    Created on : 14 may 2024, 19:19:27
    Author     : USUARIO
--%>

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
           <%@include file="MenuAdmin.jsp"%>
             <!-- Aquí va el contenido principal de la página-->
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
                                <div class="form-group">
                                    <label>Seleccione categoria de producto</label>
                                    <select name="cbc" class="form-control" onchange="submit()">
                                        <option>Elegir</option>

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
                                    <h1>

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
                        <h2>GRAFICO DE PRODUCTOS </h2>
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
                                    <div class="col-sm-10">
                                            <div class="col-sm-10">
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
                            <center>
                            <h2>GRAFICO DE CLIENTES POR DEPARTAMENTOS</h2>
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
                     <!-- Grafico empleados  por departamento-->
        <div class="col-sm-10">
             <div class="col-sm-10">
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
                            <h2>GRAFICO DE EMPLEADOS POR DEPARTAMENTOS</h2>
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
                <div class="col-sm-10">
            <!-- Grafico productos segun categoria-->

            <%
                DaoUsuarios objEd = new DaoUsuarios();
  
                String cod = "";
                if (request.getParameter("cbc") != null) {
                    cod = request.getParameter("cbc");
                }

                String la = "'18-25','26-35','36-50','51-65','>65'";
                String d = "";
                int z1 = 0, z2 = 0, z3 = 0, z4 = 0, z5=0;
                //int stock=0,stock1=0,stock2=0,stock3=0,stock4=0,stock5=0,stock6=0;
                    for (Usuario g : objEd.LisAllUsuario()) {
                        if (g.getEdad()<=25) {
                         
                            z1++;
                        } else if (g.getEdad()<=35)  {
                      
                            z2++;
                        }else if (g.getEdad()<=50)  {
                      
                            z3++;
                        }else if (g.getEdad()<=65)  {
                      
                            z4++;
                        }else {
                          
                            c5++;
                        }   
                    }
                d = d +z1+ "," + z2+ "," + z3 + "," + z4+ "," + z5;

            %>   
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-10"> 
                        <div class="card">
                            <div class="card-body">
                                <form>
                            
                                </form>    
                                <table class="table table-bordered">
                                    <thead><h2>Lista de usuarios</thead>
                                    <tr><th>Codigo<th>Nombre<th>Edad
                                            <%
                                                for (Usuario g : objEd.LisAllUsuario()){
                                                    out.print("<tr><td>" + g.getId_usu()+ "<td>" + g.getNom_usuario()+ "<td>" + g.getEdad());
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
                            <h2>GRAFICO DE EDADES DE USUARIOS</h2>
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
  
  
         
           </div>
        </div>
    </body>

   
</html>
