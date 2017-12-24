package BD;

import Unidades.Unidad;
import Usuarios.Cliente;
import Usuarios.Empleado;
import Usuarios.TicketDeUsuarios;
import Usuarios.Usuario;
import WebChat.Message;
import java.util.ArrayList;

/**
 * JAVA CLASS
 *
 * @author Ruben
 */
public class ResultsSetDB {

    private String Estaus ="";
    private Empleado collaborator;
    private Cliente client;
    private Usuario user;
    private TicketDeUsuarios ListaUsuarios;
    private ArrayList<Message> Messages;
    private Boolean condicion;
    private int Errores;
    private Unidad Unit;

    public ResultsSetDB(Empleado collaborator, Cliente client, Usuario user, TicketDeUsuarios ListaUsuarios, ArrayList<Message> Messages, Boolean condicion, int Errores, Unidad Unit) {
        this.collaborator = collaborator;
        this.client = client;
        this.user = user;
        this.ListaUsuarios = ListaUsuarios;
        this.Messages = Messages;
        this.condicion = condicion;
        this.Errores = Errores;
        this.Unit = Unit;
    }
      
    public Unidad getUnit() {
        return Unit;
    }

    public void setUnit(Unidad Unit) {
        this.Unit = Unit;
    }

    public ResultsSetDB() {
        
    }

    public ResultsSetDB(String Estaus, Usuario user, Boolean condicion) {
        this.Estaus = Estaus;
        this.user = user;
        this.condicion = condicion;
        this.Errores = 0;        
    }

    public ArrayList<Message> getMessages() {
        return Messages;
    }

    public void setMessages(ArrayList<Message> Messages) {
        this.Messages = Messages;
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

    public Empleado getCollaborator() {
        return collaborator;
    }

    public void setCollaborator(Empleado collaborator) {
        this.collaborator = collaborator;
    }

    public Cliente getClient() {
        return client;
    }

    public void setClient(Cliente client) {
        this.client = client;
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
