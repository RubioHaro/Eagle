

package Usuarios;

/**
 *JAVA CLASS
 * @author Hiram
 */
public class Direccion {
    private int IdDireccion;
    private int IdUsuario;
    private String Colonia;
    private String Calle;
    private String Delegacion;
    private String Tipo;
    private int CP;
    private int NumeroExt;
    private int NumeroInt;

    public Direccion() {
    }

    public Direccion(int IdDireccion, int IdUsuario, String Colonia, String Calle, String Delegacion, String Tipo, int CP, int NumeroExt, int NumeroInt) {
        this.IdDireccion = IdDireccion;
        this.IdUsuario = IdUsuario;
        this.Colonia = Colonia;
        this.Calle = Calle;
        this.Delegacion = Delegacion;
        this.Tipo = Tipo;
        this.CP = CP;
        this.NumeroExt = NumeroExt;
        this.NumeroInt = NumeroInt;
    }        

    public int getIdDireccion() {
        return IdDireccion;
    }

    public void setIdDireccion(int IdDireccion) {
        this.IdDireccion = IdDireccion;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public String getColonia() {
        return Colonia;
    }

    public void setColonia(String Colonia) {
        this.Colonia = Colonia;
    }

    public String getCalle() {
        return Calle;
    }

    public void setCalle(String Calle) {
        this.Calle = Calle;
    }

    public String getDelegacion() {
        return Delegacion;
    }

    public void setDelegacion(String Delegacion) {
        this.Delegacion = Delegacion;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public int getCP() {
        return CP;
    }

    public void setCP(int CP) {
        this.CP = CP;
    }

    public int getNumeroExt() {
        return NumeroExt;
    }

    public void setNumeroExt(int NumeroExt) {
        this.NumeroExt = NumeroExt;
    }

    public int getNumeroInt() {
        return NumeroInt;
    }

    public void setNumeroInt(int NumeroInt) {
        this.NumeroInt = NumeroInt;
    }
    
    
}
