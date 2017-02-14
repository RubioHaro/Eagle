package BD;

import Usuarios.TicketDeUsuarios;
import Usuarios.Usuario;

/**
 * JAVA CLASS
 *
 * @author Ruben
 */
public class ResultsSetDB {

    private String Estaus;
    private Usuario user;
    private TicketDeUsuarios ListaUsuarios;
    private Boolean condicion;
    private int Errores;

    public ResultsSetDB() {
        
    }

    public ResultsSetDB(String Estaus, Usuario user, Boolean condicion) {
        this.Estaus = Estaus;
        this.user = user;
        this.condicion = condicion;
        this.Errores = 0;        
    }

    public void CrearListaDeUsuarios(){
        this.ListaUsuarios = new TicketDeUsuarios();
    }
    
    public void AñadirUsuarioALista(Usuario user){
        this.ListaUsuarios.AñadirATicket(user);
    }
    public void BorrarLista(Usuario user){
        this.ListaUsuarios= new TicketDeUsuarios();
    }
    
    public TicketDeUsuarios getListaUsuarios() {
        return this.ListaUsuarios;
    }

    public void setListaUsuarios(TicketDeUsuarios ListaUsuarios) {
        this.ListaUsuarios = ListaUsuarios;
    }
    
    

    public void AgregarError() {
        this.Errores = Errores + 1;
    }

    public ResultsSetDB(String Estaus, Usuario user) {
        this.Estaus = Estaus;
        this.user = user;
        this.Errores = 0;
    }

    public ResultsSetDB(Usuario user, Boolean condicion) {
        this.user = user;
        this.condicion = condicion;
        this.Errores = 0;
    }

    public ResultsSetDB(Usuario user) {
        this.user = user;
        this.Errores = 0;
    }

    public ResultsSetDB(Boolean condicion) {
        this.condicion = condicion;
        this.Errores = 0;
    }

    public int getErrores() {
        return Errores;
    }

    public String getEstaus() {
        return Estaus;
    }

    public void setEstaus(String Estaus) {
        this.Estaus = Estaus;
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public Boolean getCondicion() {
        return condicion;
    }

    public void setCondicion(Boolean condicion) {
        this.condicion = condicion;
    }

}
