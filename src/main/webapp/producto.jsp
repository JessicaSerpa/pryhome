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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
         <title>JSP Page</title> 
    </head>
    <body>
     <%@include file="MenuAdmin.jsp"%>
        <%

            DaoProducto obj2 = new DaoProducto();


        %>   
        <!<!-- tabla que lista todos los productos -->
         <%@include file="MenuAdmin.jsp"%>
        <div class="container-fluid">
            <div class="row">    

                <div class="col-sm-8">
                    <h2 class="text-blue">Lista de Productos</h2>
                    <table class="table table-hover" id="tablax">
                           <thead>
                            <tr class="text-white bg-dark">
                                <th>Código</th>
                                <th>Nombre</th>
                                <th>Marca</th>
                                <th>Stock</th>
                                <th>Precio</th
                                
                            </tr>
                            </thead>

                        
                                <%   for (Producto x : obj2.LisAllProducto()) {
                                        out.print("<tr><td>" + x.getId_prod() + "<td>" + x.getNombre() + "<td>" + x.getMarca() + "<td>" + x.getStock()+" Uds" + "<td>" + "S/."+x.getPrecio());
                                    }

                                %> 
                    </table>

                </div>
            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.4.1.js"
                integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
        </script>
        <!-- DATATABLES -->
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
        </script>
        <!-- BOOTSTRAP -->
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $('#tablax').DataTable({
                    language: {
                        processing: "Tratamiento en curso...",
                        search: "Buscar&nbsp;:",
                        lengthMenu: "Agrupar de _MENU_ items",
                        info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                        infoEmpty: "No existen datos.",
                        infoFiltered: "(filtrado de _MAX_ elementos en total)",
                        infoPostFix: "",
                        loadingRecords: "Cargando...",
                        zeroRecords: "No se encontraron datos con tu busqueda",
                        emptyTable: "No hay datos disponibles en la tabla.",

                        paginate: {
                            first: "Primero",
                            previous: "Anterior",
                            next: "Siguiente",
                            last: "Ultimo"
                        },
                        aria: {
                            sortAscending: ": active para ordenar la columna en orden ascendente",
                            sortDescending: ": active para ordenar la columna en orden descendente"
                        }
                    },
                    scrollY: 400,
                    lengthMenu: [[7, 10, 25, -1], [7, 10, 25, "All"]],
                });
            });
        </script>
    </body>

</html>

