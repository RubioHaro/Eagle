/*
 * New Ligths
 * Services info Web
 * Rubio Haro 
 */
package chat;

import chat.ChatFunctions.Servidor;
import chat.ChatFunctions.Cliente;


/**
 * JAVA CLASS
 *
 * @author Rod
 */
public class ControladorDeServidor {

    Servidor server;
    Cliente client;
    boolean Estatus;

    public ControladorDeServidor() {
        server= new Servidor();        
        
    }

    public String GetEstadoDelServidor() {
        if (Estatus) {
            return "El servidor esta en linea";
        } else {
            return "El servidor no esta en linea";
        }
    }

    public boolean ServerEx() {
        client = new Cliente();
       
        return Estatus=client.isEstatus();
        
    }

    public String IniciarServidor() {
        if (!ServerEx()) {
            try {
                server.setName("ServidorPrincipalDeComunicacion");
                server.start();
                return "server Iniciado";
            } catch (Exception e) {
                return e.getLocalizedMessage();
            }
        } else {
            return "Ya existe el server";
        }

    }

    public String DetenerServidor() {
        if (ServerEx()) {
            try {                  
                if(!client.ApagarServidor()){
                    return "Servidor Detenido";
                }else{
                    return "Algo ha fallado :(, El servidor sigue en linea";
                }
            } catch (Exception e) {
                return e.getLocalizedMessage();
            }
        } else {
            return "El servidor sigue en linea";
        }

    }

}
