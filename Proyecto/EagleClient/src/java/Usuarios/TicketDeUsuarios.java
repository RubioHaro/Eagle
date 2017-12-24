/*
 * New Ligths
 * Services info Web
 * Rubio Haro 
 */
package Usuarios;

import java.util.ArrayList;

/**
 * JAVA CLASS
 *
 * @author Rod
 */
public class TicketDeUsuarios {

    private ArrayList<Usuario> ListaUsers;

    public String PritnTicket (){
        return ListaUsers.toString();
    }
    
    public TicketDeUsuarios() {
        ListaUsers = new ArrayList<>();
    }

    public TicketDeUsuarios(ArrayList<Usuario> ListaUnidades) {
        this.ListaUsers = ListaUnidades;
    }

    public void AñadirATicket(Usuario user) {
        this.ListaUsers.add(user);
    }

    public int getTamañoTicket() {
        return this.ListaUsers.size();
    }

    public Usuario GetUser(int i) {
        return ListaUsers.get(i);
    }

    public ArrayList<Usuario> getTicketUsers() {
        return ListaUsers;
    }
}
