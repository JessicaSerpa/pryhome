package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Usuario;
import util.MySQLConexion;

public class DaoUsuarios {
    // Método para obtener un usuario por su correo electrónico
    public Usuario obtenerUsuarioPorCorreo(String correo) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Usuario usuario = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "SELECT * FROM usuario WHERE correo = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, correo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNom_usuario(rs.getString("nom_usuario"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setPass_usuario(rs.getString("pass_usuario"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setDni(rs.getString("dni"));
                usuario.setTipo_usuario(rs.getString("tipo_usuario"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            cerrarRecursos(conn, stmt, rs);
        }

        return usuario;
    }

    // Método para registrar un nuevo usuario en la base de datos
    public boolean registrarUsuario(Usuario usuario) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = MySQLConexion.getConexion();
            String sql = "INSERT INTO usuario (nom_usuario, correo, pass_usuario, telefono, direccion, dni, tipo_usuario) VALUES (?, ?, ?, ?, ?, ?, 'Cliente')";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNom_usuario());
            stmt.setString(2, usuario.getCorreo());
            stmt.setString(3, usuario.getPass_usuario());
            stmt.setString(4, usuario.getTelefono());
            stmt.setString(5, usuario.getDireccion());
            stmt.setString(6, usuario.getDni());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            cerrarRecursos(conn, stmt, null);
        }
    }

    // Método para abrir una página dependiendo del tipo de usuario
    public String abrirPaginaSegunTipoUsuario(String tipoUsuario) {
        if (tipoUsuario.equals("Administrador")) {
            return "Admin.jsp";
        } else if (tipoUsuario.equals("Cliente")) {
            return "Home.jsp";
        } else {
            return "Home.jsp"; // Página por defecto para otros tipos de usuario
        }
    }

    // Otros métodos CRUD y métodos de utilidad irían aquí

    //Metodo para listar usuarios
   
    /*
    public List<Pro> LisProducto(String id) {
        List<Producto> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select  a.id_prod,a.nombre,a.stock\n"
                    + "from producto a join categoria n on a.id_cat=n.id_cat where n.id_cat=?;";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_prod(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setStock(rs.getInt(3));
                lista.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }*/

    // Método para cerrar la conexión y liberar recursos
    private void cerrarRecursos(Connection conn, PreparedStatement stmt, ResultSet rs) {
        // Implementación para cerrar la conexión y liberar recursos
    }
}
