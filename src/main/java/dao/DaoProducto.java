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
import util.MySQLConexion;
import modelo.*;

/**
 *
 * @author Deyver
 */
public class DaoProducto {
    
    //lista de productos segun categoria
    public List<Producto> LisProducto(String id) {
        List<Producto> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select  a.id_prod,a.nombre,a.marca,a.stock\n"
                    + "from producto a join categoria n on a.id_cat=n.id_cat where n.id_cat=?;";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_prod(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setMarca(rs.getString(3));
                p.setStock(rs.getInt(4));
                lista.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
     } 
    
    //lista de todos los productos
        public List<Producto> LisAllProducto() {
        List<Producto> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select id_prod, nombre, marca, stock, precio from producto";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId_prod(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setMarca(rs.getString(3));
                p.setStock(rs.getInt(4));
                p.setPrecio(rs.getDouble(5));
                
                lista.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
 } 
}
/*
    int id_prod;
    int id_cat;
    int id_provee;
    
    String marca;
    String nombre;
    Double precio;
    int stock;
*/