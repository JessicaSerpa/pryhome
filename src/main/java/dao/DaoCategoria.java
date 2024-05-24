/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Categoria;
import util.MySQLConexion;

/**
 *
 * @author Deyver
 */
public class DaoCategoria {
    
     public List<Categoria> LisCategoria(){
     List<Categoria> lista=new ArrayList();
     Connection cn=MySQLConexion.getConexion();
     try{
      String sql="select id_cat,nom_cat from categoria";
      PreparedStatement st=cn.prepareStatement(sql);
      ResultSet rs=st.executeQuery();
      while(rs.next()){
          Categoria p=new Categoria();
          p.setId_cat(rs.getInt(1));
          p.setNombre(rs.getString(2));
          lista.add(p);
      }
     }catch(Exception ex){
        ex.printStackTrace();
     }
     return lista;
 }   
}
