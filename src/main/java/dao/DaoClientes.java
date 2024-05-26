
package dao;
import java.sql.*;
import util.MySQLConexion;
import java.util.*;
import modelo.*;


public class DaoClientes {
    //lista total de alumnos
 public List<Usuario> getAllClientes(){
     List<Usuario> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select  id_usuario,nom_usuario,correo, pass_usuario, telefono, direccion, dni, tipo_usuario, edad, departamento  from usuario where tipo_usuario='Cliente' ";
      PreparedStatement st=cn.prepareStatement(sql);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Usuario p=new Usuario();
          p.setId_usu(rs.getInt(1));
          p.setNom_usuario(rs.getString(2));
          p.setCorreo(rs.getString(3));
          p.setPass_usuario(rs.getString(4));
          p.setTelefono(rs.getString(5));
          p.setDireccion(rs.getString(6));
          p.setDni(rs.getString(7));
          p.setTipo_usuario(rs.getString(8));
          p.setEdad(rs.getInt(9));
          p.setDepartamento(rs.getString(10));
          
          lista.add(p);
        
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }   
 //buscar por codigo
 public Usuario busCli(String cod){
    Usuario p=null;
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select * from usuario where id_usuario=?";
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, cod);
      ResultSet rs=st.executeQuery();
      if(rs.next()){
          p=new Usuario();
        p.setId_usu(rs.getInt(1));
          p.setNom_usuario(rs.getString(2));
          p.setCorreo(rs.getString(3));
          p.setPass_usuario(rs.getString(4));
          p.setTelefono(rs.getString(5));
          p.setDireccion(rs.getString(6));
          p.setDni(rs.getString(7));
          p.setTipo_usuario(rs.getString(8));
          p.setEdad(rs.getInt(9));
          p.setDepartamento(rs.getString(10));
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return p;
 }
 
      //añadir    id_usu
 public void adicion(Usuario a){
  Connection cn=MySQLConexion.getConexion();
  try{
  String sql = "{call spadiCliente(?, ?, ?, ?, ?, ?, ?, ?)}";
  CallableStatement st=cn.prepareCall(sql);
  st.setString(1, a.getNom_usuario());
  st.setString(2, a.getCorreo());
  st.setString(3, a.getPass_usuario());
  st.setString(4, a.getTelefono());
  st.setString(5, a.getDireccion());
  st.setString(6, a.getDni());
  st.setInt(7, a.getEdad());
  st.setString(8, a.getDepartamento());
  st.executeUpdate();
 }catch(Exception ex){
     ex.printStackTrace();
 }
 
}
//modificacion editar usuario id_usu
public void cambia(Usuario a){
  Connection cn=MySQLConexion.getConexion();
  try{
  String sql="{call spModiUsu(?, ?, ?, ?, ?, ?, ?, ?,?)}";   
  CallableStatement st=cn.prepareCall(sql);
  st.setInt(1, a.getId_usu());
  st.setString(2, a.getNom_usuario());
  st.setString(3, a.getCorreo());
  st.setString(4, a.getPass_usuario());
  st.setString(5, a.getTelefono());
  st.setString(6, a.getDireccion());
  st.setString(7, a.getDni());
  st.setInt(8, a.getEdad());
  st.setString(9, a.getDepartamento());
  st.executeUpdate();
 }catch(Exception ex){
     ex.printStackTrace();
 }
 System.out.println("aqui esta");
} 
 //borrar pasando codigo de cliente
public void borra(String cod){
  Connection cn=MySQLConexion.getConexion();
  try{                              
  String sql="{call spDelUsu(?)}";   
  CallableStatement st=cn.prepareCall(sql);
  st.setString(1, cod);
  st.executeUpdate();
 }catch(Exception ex){
     ex.printStackTrace();
 }

}  
 
    
}
