
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoClientes;
import java.util.List;
import modelo.Usuario;


public class controlCliente extends HttpServlet {

     DaoClientes obj=new DaoClientes();
     Usuario cli =new Usuario();
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    int op=Integer.parseInt(request.getParameter("opc"));

     if(op==1)allCli(request, response);
     if(op==2)editar(request, response);
     if(op==3)adiCli(request, response);
     if(op==4)delCli(request, response);
    }
        
    protected void delCli(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod=request.getParameter("id");
        obj.borra(cod);
        request.setAttribute("dato", obj.getAllClientes());
        request.setAttribute("titulo", "Registro de Cliente");
        request.setAttribute("nro", 7);
        request.setAttribute("cli", new Usuario());
        String pag="pagClientes.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    
    
    //editar alumno pasando un codigp
     protected void editar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod=request.getParameter("id");
         
        request.setAttribute("dato", obj.getAllClientes());
        request.setAttribute("titulo", "Actualizar Dato Cliente");
        request.setAttribute("nro", 3);
        request.setAttribute("cli", obj.busCli(cod));
        String pag="pagClientes.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    
    
    
protected void allCli(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setAttribute("dato", obj.getAllClientes());
        request.setAttribute("titulo", "Registro de Cliente");
        request.setAttribute("nro", 1);
        request.setAttribute("cli", cli);
        String pag="pagClientes.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

       // Obtener la lista de clientes del DAO
    // Obtener la lista de clientes del DAO
    /*
    List<Usuario> clientes = obj.getAllClientes();
    
    // Establecer la lista de clientes como atributo en el request con el nombre "cli"
    request.setAttribute("cli", clientes);
    
    // Establecer la lista de clientes como atributo en el request con el nombre "dato"
    request.setAttribute("dato", clientes);
    
    // Establecer otros atributos si es necesario
    request.setAttribute("titulo", "Registro de Cliente");
    request.setAttribute("nro", 7);
    
    // Redirigir a la página JSP
    String pag = "pagClientes.jsp";
    request.getRequestDispatcher(pag).forward(request, response);
    */
    }
    //grabar
    protected void adiCli(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sw=0;//0=adicionar 1=actualizar
 if (request.getParameter("id_usu") != null && !request.getParameter("id_usu").isEmpty()) {
        cli.setId_usu(Integer.parseInt(request.getParameter("id_usu")));
        sw = 1;
    }
 cli.setNom_usuario(request.getParameter("nom_usuario"));
    cli.setCorreo(request.getParameter("correo"));
    cli.setPass_usuario(request.getParameter("pass_usuario"));
    cli.setTelefono(request.getParameter("telefono"));
    cli.setDireccion(request.getParameter("direccion"));
    cli.setDni(request.getParameter("dni"));
    cli.setTipo_usuario(request.getParameter("tipo_usuario"));
    cli.setEdad(Integer.parseInt(request.getParameter("edad")));
    cli.setDepartamento(request.getParameter("departamento"));
        if(sw==0)
        obj.adicion(cli);
        else
           obj.cambia(cli);
        
        request.setAttribute("dato", obj.getAllClientes());
        request.setAttribute("titulo", "Registro de Cliente");
        request.setAttribute("nro", 7);
        request.setAttribute("cli", new Usuario());
        String pag="pagClientes.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
