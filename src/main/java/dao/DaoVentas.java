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
       public List<Ventas> listarAniosVentas() {
        List<Ventas> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        
        try {
            String sql = "SELECT id_ventas, mont_final, id_tipoComp, YEAR(fecha) AS anio FROM ventas"; // Consulta para obtener los datos de ventas y sus años
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            // Iterar sobre los resultados y agregarlos a la lista
            while (rs.next()) {
                Ventas p = new Ventas();
                p.setId_ventas(rs.getInt(1));
                p.setMont_final(rs.getInt(2));
                p.setId_tipoComp(rs.getInt(3));
                p.setFecha(rs.getDate(4));
                lista.add(p);
            }
           
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return lista;
    }
    
}
