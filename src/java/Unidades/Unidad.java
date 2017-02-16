
package Unidades;

/**
 *JAVA CLASS
 * @author Emilio
 */
public class Unidad {
private int IdUnidad;
private String Matricula;
private String Marca;
private String Modelo;
private String Tipo;
private int Puertas;
private String Blindaje;
private String Antiguedad;
private String Estatus;

    public Unidad() {
    }

    public Unidad(int IdUnidad, String Matricula, String Marca, String Modelo, String Tipo, int Puertas, String Clindaje, String Antiguedad, String Estatus) {
        this.IdUnidad = IdUnidad;
        this.Matricula = Matricula;
        this.Marca = Marca;
        this.Modelo = Modelo;
        this.Tipo = Tipo;
        this.Puertas = Puertas;
        this.Blindaje = Clindaje;
        this.Antiguedad = Antiguedad;
        this.Estatus = Estatus;
    }

    public int getIdUnidad() {
        return IdUnidad;
    }

    public void setIdUnidad(int IdUnidad) {
        this.IdUnidad = IdUnidad;
    }

    public String getMatricula() {
        return Matricula;
    }

    public void setMatricula(String Matricula) {
        this.Matricula = Matricula;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public int getPuertas() {
        return Puertas;
    }

    public void setPuertas(int Puertas) {
        this.Puertas = Puertas;
    }

    public String getBlindaje() {
        return Blindaje;
    }

    public void setBlindaje(String Clindaje) {
        this.Blindaje = Clindaje;
    }

    public String getAntiguedad() {
        return Antiguedad;
    }

    public void setAntiguedad(String Antiguedad) {
        this.Antiguedad = Antiguedad;
    }

    public String getEstatus() {
        return Estatus;
    }

    public void setEstatus(String Estatus) {
        this.Estatus = Estatus;
    }
}
