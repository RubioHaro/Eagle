/*
 * New Ligths
 * Services info Web
 * Rubio Haro 
 */

package Usuarios;



/**
 *JAVA CLASS
 * @author Rod
 */
public class Cliente extends Usuario {
    private String Cliente;
    private String FechaRegistro;

    public Cliente() {
        super();
    }

    public Cliente(Usuario user) {
        super(user.getIdusuario(), user.getNombre(), user.getApellidop(),user.getApellidom(),user.getTipo(),user.getNivelAcceso(),user.getEstatus(),user.getMail());
    }
    public Cliente(String Cliente, String FechaRegistro) {        
        this.Cliente = Cliente;
        this.FechaRegistro = FechaRegistro;
    }

    public Cliente(String Cliente, String FechaRegistro, int Idusuario, String Nombre, String Apellidop, String Apellidom, String Tipo, int NivelAcceso, int Estatus, String mail) {
        super(Idusuario, Nombre, Apellidop, Apellidom, Tipo, NivelAcceso, Estatus, mail);
        this.Cliente = Cliente;
        this.FechaRegistro = FechaRegistro;
    }
    

    public String getFechaRegistro() {
        return FechaRegistro;
    }

    public void setFechaRegistro(String FechaRegistro) {
        this.FechaRegistro = FechaRegistro;
    }
    
    public String getCliente() {
        return Cliente;
    }

    public void setCliente(String Cliente) {
        this.Cliente = Cliente;
    }
    
}
