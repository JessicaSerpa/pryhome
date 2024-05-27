package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.MySQLConexion;
import modelo.*;

public class DaoProveedor {
    
    // Lista de todos los proveedores
    public List<Proveedor> LisAllProveedor() {
        List<Proveedor> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select id_provee, nombre, doc_provee, correo_provee, telef_provee from proveedor";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Proveedor p = new Proveedor();
                p.setId_provee(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setDoc_provee(rs.getString(3));
                p.setCorreo_provee(rs.getString(4));
                p.setTelef_provee(rs.getString(5));
                
                lista.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    } 
}
