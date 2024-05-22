
package control;
import dao.DaoUsuarios;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DaoUsuarios daoUsuarios = new DaoUsuarios();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        if (action != null && action.equals("login")) {
            // Manejar solicitud de inicio de sesión
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Aquí deberías validar las credenciales en tu base de datos
            Usuario usuario = daoUsuarios.obtenerUsuarioPorCorreo(email);
            if (usuario != null && usuario.getPass_usuario().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
                
                // Redirigir según el tipo de usuario
                if (usuario.getTipo_usuario().equals("Administrador")) {
                    response.sendRedirect("Admin.jsp");
                } else if (usuario.getTipo_usuario().equals("Cliente")) {
                    response.sendRedirect("Home.jsp");
                } else {
                    // Tipo de usuario desconocido, redirigir a una página genérica o mostrar un mensaje de error
                    response.sendRedirect("login.jsp");
                }
            } else {
                // Credenciales inválidas, redirigir al usuario de vuelta al formulario de inicio de sesión con un mensaje de error
                String errorMessage = "Usuario o contraseña incorrectos";
                request.setAttribute("error", errorMessage);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else if (action != null && action.equals("registrarse")) {
            // Manejar solicitud de registro
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Crear un nuevo usuario con los datos proporcionados
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setNom_usuario(name);
            nuevoUsuario.setCorreo(email);
            nuevoUsuario.setPass_usuario(password);


            // Guardar el nuevo usuario en la base de datos
            daoUsuarios.registrarUsuario(nuevoUsuario);

            // Establecer sesión para el nuevo usuario y redirigirlo a la página de inicio
            HttpSession session = request.getSession();
            session.setAttribute("usuario", nuevoUsuario);
            String successMessage = "Registrado exitosamente";
            request.setAttribute("success", successMessage);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            // Si no se proporciona ninguna acción, redirige al usuario a la página de inicio
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
