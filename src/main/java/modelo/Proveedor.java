package modelo;

public class Proveedor {
    
    int id_provee;
    String nombre;
    String doc_provee;
    String correo_provee;
    String telef_provee;

    public Proveedor() {
    }

    public int getId_provee() {
        return id_provee;
    }

    public void setId_provee(int id_provee) {
        this.id_provee = id_provee;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDoc_provee() {
        return doc_provee;
    }

    public void setDoc_provee(String doc_provee) {
        this.doc_provee = doc_provee;
    }

    public String getCorreo_provee() {
        return correo_provee;
    }

    public void setCorreo_provee(String correo_provee) {
        this.correo_provee = correo_provee;
    }

    public String getTelef_provee() {
        return telef_provee;
    }

    public void setTelef_provee(String telef_provee) {
        this.telef_provee = telef_provee;
    }
}
