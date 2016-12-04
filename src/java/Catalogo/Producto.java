

package Catalogo;

/**
 *JAVA CLASS
 * @author Miguel
 */
public class Producto {
    private int IdProcuto;
    private String NombreProducto;
    private int Estatus;
    private int Costo;
    private String Descripcion;

    public Producto() {
    }

    public Producto(int IdProcuto, String NombreProducto, int Estatus, int Costo, String Descripcion) {
        this.IdProcuto = IdProcuto;
        this.NombreProducto = NombreProducto;
        this.Estatus = Estatus;
        this.Costo = Costo;
        this.Descripcion = Descripcion;
    }

    public int getIdProcuto() {
        return IdProcuto;
    }

    public void setIdProcuto(int IdProcuto) {
        this.IdProcuto = IdProcuto;
    }

    public String getNombreProducto() {
        return NombreProducto;
    }

    public void setNombreProducto(String NombreProducto) {
        this.NombreProducto = NombreProducto;
    }

    public int getEstatus() {
        return Estatus;
    }

    public void setEstatus(int Estatus) {
        this.Estatus = Estatus;
    }

    public int getCosto() {
        return Costo;
    }

    public void setCosto(int Costo) {
        this.Costo = Costo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    
}
