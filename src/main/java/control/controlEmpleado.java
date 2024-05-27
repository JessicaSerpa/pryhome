
package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoEmpleados;
import java.util.List;
import modelo.Usuario;

public class controlEmpleado extends HttpServlet {

    DaoEmpleados obj=new DaoEmpleados();
     Usuario emp =new Usuario();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            int op=Integer.parseInt(request.getParameter("opc"));
        System.out.println(op);
     if(op==1)allEmp(request, response);
     if(op==2)editarEmp(request, response);
     if(op==3)adiEmp(request, response);
     if(op==4)delEmp(request, response);
        
    }
protected void delEmp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod=request.getParameter("id");
        System.out.println("A borrar el codigo "+cod);
        obj.borraEmp(cod);
        request.setAttribute("dato", obj.getAllEmpleados());
        request.setAttribute("titulo", "Registro de Empleado");
        request.setAttribute("nro", 3);
        request.setAttribute("emp", new Usuario());
        String pag="pagEmpleados.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
//editar alumno pasando un codigp
     protected void editarEmp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod=request.getParameter("id");
         
        request.setAttribute("dato", obj.getAllEmpleados());
         System.out.println(obj.getAllEmpleados());
        request.setAttribute("titulo", "Actualizar Dato Empleado");
        request.setAttribute("nro", 3);
        request.setAttribute("emp", obj.busEmp(cod));
         System.out.println(obj.busEmp(cod));
        String pag="pagEmpleados.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    
    
    
protected void allEmp(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setAttribute("dato", obj.getAllEmpleados());
        request.setAttribute("titulo", "Registro de Empleado");
        request.setAttribute("nro", 3);
        request.setAttribute("emp", emp);
       String pag="pagEmpleados.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

    }
    //grabar
    protected void adiEmp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sw=0;//0=adicionar 1=actualizar
 if (Integer.parseInt(request.getParameter("id_usu")) > 0) {
        emp.setId_usu(Integer.parseInt(request.getParameter("id_usu")));
        sw = 1;
    }
        System.out.println("Valor de sw "+sw);
        System.out.println("El id_usu es "+request.getParameter("id_usu"));
    emp.setNom_usuario(request.getParameter("nom_usuario"));
    emp.setCorreo(request.getParameter("correo"));
    emp.setPass_usuario(request.getParameter("pass_usuario"));
    emp.setTelefono(request.getParameter("telefono"));
    emp.setDireccion(request.getParameter("direccion"));
    emp.setDni(request.getParameter("dni"));
    emp.setTipo_usuario("Usuario");
    emp.setEdad(Integer.parseInt(request.getParameter("edad")));
    emp.setDepartamento(request.getParameter("departamento"));
        if(sw==0)
        obj.adicionEmp(emp);
        else
           obj.cambiaEmp(emp);
        
        request.setAttribute("dato", obj.getAllEmpleados());
        request.setAttribute("titulo", "Registro de Empleado");
        request.setAttribute("nro", 3);
        request.setAttribute("emp", new Usuario());
        String pag="pagEmpleados.jsp";
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
