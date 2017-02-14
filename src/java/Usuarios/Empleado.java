/*
 * New Ligths
 * Services info Web
 * Rubio Haro 
 */
package Usuarios;

/**
 * JAVA CLASS
 *
 * @author Rod
 */
public class Empleado extends Usuario{

    private String Antiguedad;
    private String Tipo;
    private int Salario;
    private int Edad;
    private String Sexo;
    private int NivelDeAcceso;

    public Empleado() {
    }

    public Empleado(String Antiguedad, String Tipo, int Salario, int Edad, String Sexo, int NivelDeAcceso) {
        this.Antiguedad = Antiguedad;
        this.Tipo = Tipo;
        this.Salario = Salario;
        this.Edad = Edad;
        this.Sexo = Sexo;
        this.NivelDeAcceso = NivelDeAcceso;
    }

    public Empleado(String Antiguedad, int Salario, int Edad, String Sexo, int NivelDeAcceso, int Idusuario, String Nombre, String Apellidop, String Apellidom, String Tipo, int NivelAcceso, int Estatus, String mail) {
        super(Idusuario, Nombre, Apellidop, Apellidom, Tipo, NivelAcceso, Estatus, mail);
        this.Antiguedad = Antiguedad;
        this.Tipo = Tipo;
        this.Salario = Salario;
        this.Edad = Edad;
        this.Sexo = Sexo;
        this.NivelDeAcceso = NivelDeAcceso;
    }

    public String getAntiguedad() {
        return Antiguedad;
    }

    public void setAntiguedad(String Antiguedad) {
        this.Antiguedad = Antiguedad;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public int getSalario() {
        return Salario;
    }

    public void setSalario(int Salario) {
        this.Salario = Salario;
    }

    public int getEdad() {
        return Edad;
    }

    public void setEdad(int Edad) {
        this.Edad = Edad;
    }

    public String getSexo() {
        return Sexo;
    }

    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
    }

    public int getNivelDeAcceso() {
        return NivelDeAcceso;
    }

    public void setNivelDeAcceso(int NivelDeAcceso) {
        this.NivelDeAcceso = NivelDeAcceso;
    }
    
    
    
    
}
