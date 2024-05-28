
package modelo;

import java.sql.Date;

public class Ventas {
     private int id_ventas;
    private Date fecha;
    private int mont_final;
    private int id_usuario;
    private int id_tipoComp;

    public Ventas() {
    }

    public Ventas(int id_ventas, Date fecha, int mont_final, int id_usuario, int id_tipoComp) {
        this.id_ventas = id_ventas;
        this.fecha = fecha;
        this.mont_final = mont_final;
        this.id_usuario = id_usuario;
        this.id_tipoComp = id_tipoComp;
    }

    public int getId_ventas() {
        return id_ventas;
    }

    public void setId_ventas(int id_ventas) {
        this.id_ventas = id_ventas;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getMont_final() {
        return mont_final;
    }

    public void setMont_final(int mont_final) {
        this.mont_final = mont_final;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_tipoComp() {
        return id_tipoComp;
    }

    public void setId_tipoComp(int id_tipoComp) {
        this.id_tipoComp = id_tipoComp;
    }


    
}
