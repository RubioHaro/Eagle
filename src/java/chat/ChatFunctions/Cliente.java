package chat.ChatFunctions;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Observable;

// Class to manage Client chat Box.
public class Cliente {
    private ControladorDeChat access;
    private boolean Estatus;
    /**
     * Chat client access
     */
    static class ControladorDeChat extends Observable {

        @Override
        public void notifyObservers(Object arg) {
            super.setChanged();
            super.notifyObservers(arg);
        }

        public ControladorDeChat() {
        }
        
        private Socket socket;
        private OutputStream outputStream;

        public boolean tryToConnect(String server, int port) {
            try {
                IniciarSocket(server, port);
                Cerrar();

                return true;
            } catch (Exception e) {
                System.out.println("Error" + e.getLocalizedMessage());
                System.out.println("Error" + e.getMessage());
                return false;
            }
        }

        public void IniciarSocket(String server, int port) throws IOException {
            socket = new Socket(server, port);
            outputStream = socket.getOutputStream();

            Thread receivingThread = new Thread() {
                @Override
                public void run() {
                    try {
                        BufferedReader reader = new BufferedReader(
                                new InputStreamReader(socket.getInputStream()));
                        String line;
                        while ((line = reader.readLine()) != null) {
                            notifyObservers(line);
                        }
                    } catch (IOException ex) {
                        notifyObservers(ex);
                    }
                }
            };
            receivingThread.start();
        }

        private static final String CRLF = "\r\n"; // newline

        /**
         * Send a line of text
         */
        public void Enviar(String text) {
            System.out.println("Mensaje Enviado" + text);
            try {
                outputStream.write((text + CRLF).getBytes());
                outputStream.flush();
            } catch (IOException ex) {
                notifyObservers(ex);
            }
        }

        /**
         * Close the socket
         */
        public void Cerrar() {
            System.out.println("Conexion cerrada");
            try {
                
                socket.close();
            } catch (IOException ex) {
                notifyObservers(ex);
            }
        }

    }

    public Cliente() {
        Estatus = false;
        String server = "127.0.0.1";
        int port = 2222;
        access = new ControladorDeChat();
        try {
            access.IniciarSocket(server, port);
            Estatus = true;
            System.out.println("Conectado a servidor: " + server + ", Puerto:" + port);
            access.Cerrar();
        } catch (IOException ex) {
            Estatus = false;
            System.out.println("Cannot connect to " + server + ":" + port);
        }
    }

    public boolean isEstatus() {
        return Estatus;
    }
    public boolean ApagarServidor() throws IOException {
        access.Enviar("//cerrar");
        System.out.println("Apagando..");
        Cliente c =  new Cliente();        
        return c.Estatus;
    }
}
