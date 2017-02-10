/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chat.ChatFunctions;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.net.Socket;

/**
 *
 * @author mohammed
 */
// For every client's connection we call this class
public class clientThread extends Thread {

    private String clientName = null;
    private DataInputStream is = null;
    private final PrintStream os = null;
    private Socket clientSocket = null;
    private final clientThread[] threads;
    private final int maxClientsCount;
    private boolean cerrarClietn;
    private boolean cerrarServer;

    public clientThread(Socket clientSocket, clientThread[] threads) {
        this.clientSocket = clientSocket;
        this.threads = threads;
        maxClientsCount = threads.length;
        cerrarClietn = true;
        cerrarServer = true;
    }

    public boolean isCerrarServer() {
        return cerrarServer;
    }

    public void run(String nombre) {
        while (cerrarServer) {
            try {
                is = new DataInputStream(clientSocket.getInputStream());

                /* Welcome the new the client. */
                os.println("Bienvenido " + nombre
                        + " , soporte tecnico se comunicara contigo en un momento.\nTo leave enter /quit in a new line.");
                synchronized (this) {
                    for (int i = 0; i < maxClientsCount; i++) {
                        if (threads[i] != null && threads[i] == this) {
                            clientName = "@" + nombre;
                            break;
                        }
                    }
                    for (int i = 0; i < maxClientsCount; i++) {
                        if (threads[i] != null && threads[i] != this) {
                            threads[i].os.println("***" + nombre
                                    + " a entrado al chat!!! ***");
                        }
                    }
                }
                /* Start the conversation. */
                while (true) {
                    String line = is.readLine();
                    if (line.startsWith("//cerrar")) {
                        cerrarServer = false;
                        cerrarClietn = false;
                        break;
                    }
                    /* If the message is private sent it to the given client. */
                    if (line.startsWith("@")) {
                        String[] words = line.split("\\s", 2);
                        if (words.length > 1 && words[1] != null) {
                            words[1] = words[1].trim();
                            if (!words[1].isEmpty()) {
                                synchronized (this) {
                                    for (int i = 0; i < maxClientsCount; i++) {
                                        if (threads[i] != null && threads[i] != this
                                                && threads[i].clientName != null
                                                && threads[i].clientName.equals(words[0])) {
                                            threads[i].os.println("<" + nombre + "> " + words[1]);
                                            /*
                     * Echo this message to let the client know the private
                     * message was sent.
                                             */
                                            this.os.println(">" + nombre + "> " + words[1]);
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        /* The message is public, broadcast it to all other clients. */
                        synchronized (this) {
                            for (int i = 0; i < maxClientsCount; i++) {
                                if (threads[i] != null && threads[i].clientName != null) {
                                    threads[i].os.println("<" + nombre + "> " + line);
                                }
                            }
                        }
                    }
                }
                synchronized (this) {
                    for (int i = 0; i < maxClientsCount; i++) {
                        if (threads[i] != null && threads[i] != this
                                && threads[i].clientName != null) {
                            threads[i].os.println("*** The user " + nombre
                                    + " is leaving the chat room !!! ***");
                        }
                    }
                }
                os.println("*** Bye " + nombre + " ***");

                /*
       * Clean up. Set the current thread variable to null so that a new client
       * could be accepted by the server.
                 */
                synchronized (this) {
                    for (int i = 0; i < maxClientsCount; i++) {
                        if (threads[i] == this) {
                            threads[i] = null;
                        }
                    }
                }
                /*
       * Close the output stream, close the input stream, close the socket.
                 */
                is.close();
                os.close();
                clientSocket.close();
            } catch (IOException e) {
            }
        }
    }
}
