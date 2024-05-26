
<%@page import="dao.DaoClientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*,java.util.*" %>
<%@page import="control.*,java.util.*" %>

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
      DaoClientes obj=new DaoClientes();  
     %>    
 
        <div class="container-fluid">
        <div class="row">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h3>${titulo}</h3>
                        </div>    
                        <div class="card-body">
                            <form action="controlCliente?opc=${nro}" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id_usu" value="${cli.getId_usu()}">      
                                </div>      
                                <div class="form-group">
                                    <label>Ingrese Nombre</label>
                                    <input class="form-control" name="nom_usuario" value="${cli.getNom_usuario()}">      
                                </div>      
                                    <div class="form-group">
                                        <label>Ingrese Correo</label>
                                        <input class="form-control" name="correo" value="${cli.getCorreo()}">      
                                    </div>      
                                    <div class="form-group">
                                        <label>Ingrese Contraseña</label>
                                        <input class="form-control" name="pass_usuario" value="${cli.getPass_usuario()}">      
                                    </div>      
                                    <div class="form-group">
                                        <label>Ingrese Telefono</label>
                                        <input class="form-control" name="telefono" value="${cli.getTelefono()}">      
                                    </div>      
                                    <div class="form-group">
                                        <label>Ingrese Direccion</label>
                                        <input class="form-control" name="direccion" value="${cli.getDireccion()}">      
                                    </div>      
                                    <div class="form-group">
                                        <label>Ingrese DNI</label>
                                        <input class="form-control" name="dni" value="${cli.getDni()}">      
                                    </div>      
                                    <div class="form-group">
                                        <label>Ingrese edad</label>
                                        <input class="form-control" name="edad" value="${cli.getEdad()}">      
                                    </div>      
                                    <div class="form-group">
                                        <label>Ingrese departamento</label>
                                        <input class="form-control" name="departamento" value="${cli.getDepartamento()}">      
                                    </div>      


                                <button class="btn btn-success">
                                    <i class="far fa-save"></i>
                                    Grabar
                                </button>
                            </form>           
                        </div>
                    </div>
                </div>   
<div class="col-sm-8">
    <h2 class="text-blue">Lista de Clientes</h2>
    <table class="table table-hover" id="tablax">
        <thead>
            <tr class="text-white bg-dark">
                <th>Código</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Teléfono</th>
                <th>Dirección</th>
                <th>DNI</th>
                <th>Tipo</th>
                <th>Dep.</th>
                <th>Acción</th> <!-- Agregué una columna para la acción -->
            </tr>
        </thead>
     
          <%           for (Usuario x : obj.getAllClientes()) {
                          out.print("<tr><td>" + x.getId_usu() + "<td>" + x.getNom_usuario() + "<td>" + x.getCorreo()  + "<td>" + x.getTelefono() + "<td>" + x.getDireccion() + "<td>" + x.getDni() + "<td>" + x.getTipo_usuario() + "<td>" + x.getDepartamento());
         %>

                        <td><a href="controlCliente?opc=2&id=<%=x.getId_usu()%>" class="btn btn-success">
                                <i class="far fa-edit"></i>
                                </a>
                                <a href="controlCliente?opc=4&id=<%=x.getId_usu()%>" class="btn btn-success">
                                <i class="far fa-trash-alt"></i>    
                                </a>

                                                <%
                                                    }
                                                %> 
        
                </table>
            </div>                       
        </div>  
        </div> 
        <script>
            function valida(cod) {
                alert(cod);
                swal({
                    title: "Seguro de borrar?",
                    text: "una vez borrado,ya no se puede recuperar!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                             //llamar al servlet   
                         location.href='control?opc=6&id=>'+cod;    
                             swal("Poof! Your record has been deleted!", {
                                    icon: "success",
                                });
                                
                                
                            } else {
                                swal("Your imaginary file is safe!");
                            }
                        });

            }
        </script>    



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
