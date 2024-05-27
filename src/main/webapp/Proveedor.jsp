<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*,dao.DaoProveedor" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
    <title>Listado de Proveedores</title> 
</head>
<body>
 <%@include file="MenuAdmin.jsp"%>
 
    <%-- Instanciar el objeto DaoProveedor para acceder a los métodos --%>
    <% DaoProveedor daoProveedor = new DaoProveedor(); %>
   <div class="container-fluid">
    <h1>Listado de Proveedores</h1>

    <table class="table table-hover" id="tablax">
        <thead>
            <tr class="text-white bg-dark">
                <th>ID</th>
                <th>Nombre</th>
                <th>Documento</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%-- Iterar sobre la lista de proveedores y mostrar cada uno en una fila de la tabla --%>
            <% for (Proveedor proveedor : daoProveedor.LisAllProveedor()) { %>
                <tr>
                    <td><%= proveedor.getId_provee() %></td>
                    <td><%= proveedor.getNombre() %></td>
                    <td><%= proveedor.getDoc_provee() %></td>
                    <td><%= proveedor.getCorreo_provee() %></td>
                    <td><%= proveedor.getTelef_provee() %></td>
                    <td>
                        <button onclick="eliminarProveedor(<%= proveedor.getId_provee() %>)" class="btn btn-danger">Eliminar</button>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
   </div>

    <!-- Agrega aquí tus scripts JavaScript -->
    <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
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
