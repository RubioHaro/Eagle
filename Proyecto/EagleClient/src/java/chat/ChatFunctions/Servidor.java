/*
 * New Ligths
 * Services info Web
 * Rubio Haro 
 */
package chat.ChatFunctions;

import chat.ChatFunctions.clientThread;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.util.Scanner;

/**
 * JAVA CLASS
 *
 * @author Rod
 */
public class Servidor extends Thread {

    public Servidor() {
    }

    private static ServerSocket serverSocket = null;
    // The client socket.
    private static java.net.Socket clientSocket = null;
    private DataInputStream is = null;

    private final int ConexionesMaximas = 100;
    private int ConexionesActivas;
    int PuertoReceptor = 2221;
    int PuertoEmisor = 2222;
    String ip = "192.168.1.70";
    private boolean Estado;
    private final clientThread[] threads = new clientThread[ConexionesMaximas];

    // This chat server can accept up to maxClientsCount clients' connections.    
    public void setConexionesActivas() {
        this.ConexionesActivas = ConexionesActivas + 1;
    }

    public boolean isEstado() {
        return Estado;
    }

    public void DetenerServidor() throws IOException {
        serverSocket.close();
        clientSocket.close();
        Estado = false;
    }

    @Override
    public void run() {
        Estado = true;
        IniciarServidor();
    }

    public void IniciarServidor() {
        System.out.println("Puerto usado:" + PuertoEmisor);
        try {
            serverSocket = new ServerSocket(PuertoEmisor);
            System.out.println("Conexion establecida");

        } catch (IOException e) {
            System.out.println(e);
        }

        while (Estado) {
            try {
                clientSocket = serverSocket.accept();
                int i;
                for (i = 0; i < ConexionesMaximas; i++) {
                    setConexionesActivas();
                    if (threads[i] == null) {
                        System.out.println("obteniendo Flujo de entrada ...");
                        is = new DataInputStream(clientSocket.getInputStream());
                        System.out.println("Flujo de entrada obtenido");
                        String line = is.readLine();
                        System.out.println(line);
                        if (line.startsWith("//cerrar")) {
                            System.out.println("Se cerro el servidor");
                            DetenerServidor();
                            break;
                        }else{
                            (threads[i] = new clientThread(clientSocket, threads)).start();
                            if(threads[i].isCerrarServer()){
                                Estado =false;
                            }
                        }                        
                        break;
                    }
                }
                if (i == ConexionesMaximas) {
                    try (PrintStream os = new PrintStream(clientSocket.getOutputStream())) {
                        os.println("El servidor esta lleno, intentalo en un rato ;)");
                    }
                    clientSocket.close();
                    break;
                }

            } catch (IOException e) {
                System.out.println(e);
            }
        }

    }

}
