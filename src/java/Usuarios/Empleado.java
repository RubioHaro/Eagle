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
    private String Poscicion;
    private int Salario;
    private int Edad;
    private String Sexo;
    private int NivelDeAcceso;

    public Empleado() {
        super();
    }
    
    public Empleado(Usuario user) {
        super(user.getIdusuario(), user.getNombre(), user.getApellidop(),user.getApellidom(),user.getTipo(),user.getNivelAcceso(),user.getEstatus(),user.getMail());
    }

    public Empleado(String Antiguedad, String Tipo, int Salario, int Edad, String Sexo, int NivelDeAcceso) {
        super();
        this.Antiguedad = Antiguedad;
        this.Poscicion = Tipo;
        this.Salario = Salario;
        this.Edad = Edad;
        this.Sexo = Sexo;
        this.NivelDeAcceso = NivelDeAcceso;
    }

    public Empleado(String Antiguedad, String Tipo, int Salario, int Edad, String Sexo, int NivelDeAcceso,Usuario user) {
        super(user.getIdusuario(), user.getNombre(), user.getApellidop(),user.getApellidom(),user.getTipo(),user.getNivelAcceso(),user.getEstatus(),user.getMail());
        this.Antiguedad = Antiguedad;
        this.Poscicion = Tipo;
        this.Salario = Salario;
        this.Edad = Edad;
        this.Sexo = Sexo;
        this.NivelDeAcceso = NivelDeAcceso;
    }
    
    public Empleado(String Antiguedad, int Salario, int Edad, String Sexo, int NivelDeAcceso, int Idusuario, String Nombre, String Apellidop, String Apellidom, String Tipo, int NivelAcceso, int Estatus, String mail) {
        super(Idusuario, Nombre, Apellidop, Apellidom, Tipo, NivelAcceso, Estatus, mail);
        this.Antiguedad = Antiguedad;
        this.Poscicion = Tipo;
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

    public String getPoscicion() {
        return Poscicion;
    }

    public void setPoscicion(String Poscicion) {
        this.Poscicion = Poscicion;
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
