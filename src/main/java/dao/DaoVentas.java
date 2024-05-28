/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import util.MySQLConexion;
import java.util.*;
import modelo.*;
/**
 *
 * @author USUARIO
 */
public class DaoVentas {
    
    //seleccioanr informacion de ventas
       public List<Ventas> listarVentas() {
        List<Ventas> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        
        try {
            String sql = "select id_ventas  FROM ventas"; // Consulta para obtener los datos de ventas y sus años
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            // Iterar sobre los resultados y agregarlos a la lista
            while (rs.next()) {
                Ventas p = new Ventas();
                p.setId_ventas(rs.getInt(1));
                lista.add(p);
            }
           
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return lista;
    }
       //lista de alumnos x especialidad
 public List<Usuario> LisCliC(String id){
     List<Usuario> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="SELECT usuario.id_usuario, usuario.nom_usuario FROM usuario INNER JOIN ventas ON usuario.id_usuario = ventas.id_usuario WHERE ventas.id_ventas = ?";
      

      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, id);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Usuario p=new Usuario();
          p.setId_usu(rs.getInt(1));
          p.setNom_usuario(rs.getString(2));
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }
 public List<Ventas> LisVenID(String id){
     List<Ventas> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="SELECT id_ventas, mont_final, id_usuario, id_tipoComp,fecha FROM ventas WHERE id_usuario =?";
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, id);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Ventas p=new Ventas();
          p.setId_ventas(rs.getInt(1));
          p.setMont_final(rs.getInt(2));
          p.setId_usuario(rs.getInt(3));
          p.setId_tipoComp(rs.getInt(4));
          p.setFecha(rs.getDate(5));
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }  
    
}
