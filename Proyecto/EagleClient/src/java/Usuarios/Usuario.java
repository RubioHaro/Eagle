package Usuarios;

/**
 * JAVA CLASS
 *
 * @author Ruben
 */
public class Usuario {

    private int Idusuario;
    private String Nombre;
    private String Apellidop;
    private String Apellidom;
    private String Tipo;
    private int NivelAcceso;
    /*
        -------------------------NivelAcceso-------------------------
        Nivel de acceso para gestion de empleados para empleados:
        Nivel 3: Altas, Bajas, Cambios y Consultas.
        Nivel 2: Altas, Cambios y Consultas.
        Nivel 1: Consultas.
        Nivel 0: Sin acceso.
        -------------------------------------------------------------
    */
    private int Estatus;
    private String mail;    

    public Usuario() {
    }

    public Usuario(int Idusuario, String Nombre, String Apellidop, String Apellidom, String Tipo, int NivelAcceso, int Estatus, String mail) {
        this.Idusuario = Idusuario;
        this.Nombre = Nombre;
        this.Apellidop = Apellidop;
        this.Apellidom = Apellidom;
        this.Tipo = Tipo;
        this.NivelAcceso = NivelAcceso;
        this.Estatus = Estatus;
        this.mail = mail;
    }

    public int getIdusuario() {
        return Idusuario;
    }

    public void setIdusuario(int Idusuario) {
        this.Idusuario = Idusuario;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidop() {
        return Apellidop;
    }

    public void setApellidop(String Apellidop) {
        this.Apellidop = Apellidop;
    }

    public String getApellidom() {
        return Apellidom;
    }

    public void setApellidom(String Apellidom) {
        this.Apellidom = Apellidom;
    }


    public int getNivelAcceso() {
        return NivelAcceso;
    }

    public void setNivelAcceso(int NivelAcceso) {
        this.NivelAcceso = NivelAcceso;
    }

    public int getEstatus() {
        return Estatus;
    }

    public void setEstatus(int Estatus) {
        this.Estatus = Estatus;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }
}
