/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Activacion;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Ger
 */
public class Mail {

    public String _error = "";
    private String _para = "";
    private String _cuerpoMsj = "";
    private final String _de = "CHAVO0022009@gmail.com";
    private String _titulo = "";

    public Mail() {
    }

    public boolean mensajeDeVerificacion(String correo){
        String URL= "http://localhost:8080/ActivarCuenta.jsp?Correo="+correo;
        String mensaje = "<img src=\"http://i64.tinypic.com/sls681.jpg\" border=\"0\" style=\"height: 300px; width: 300px\" alt=\"Eagle Vision\"><br><a href=\" "+ URL +"\"> Activar Cuenta</a><br/><br/> EAGLE VISION <br/> New Lights 2017" ;
               
        return mandaMAil(correo, "Activacion de cuenta", mensaje);
    }
    
    public boolean mensajeConPass(String correo, String Password){
        String mensaje = "<img src=\"http://i64.tinypic.com/sls681.jpg\" border=\"0\" style=\"height: 300px; width: 300px\" alt=\"Eagle Vision\"><br/>Correo:" + correo + "<br/> Contraseña: " + Password  + "<br/> EAGLE VISION <br/> New Lights 2017" ;
               
        return mandaMAil(correo, "Solicitud de contraseña", mensaje);
    }
    
    public boolean mensajeAColaboradorRegistrado(String correo){
        String mensaje = "!FELICIDADES¡ Has sido agregado como colaborador";
        return mandaMAil(correo, "Registro EagleVision", mensaje);
    }
    
    public boolean mandaMAil(String Para, String Titulo, String Msj) {
        boolean envio = false;
        this._titulo = Titulo;
        this._para = Para;
        this._cuerpoMsj = Msj;

        try {

            // Configuracion de la cuenta de envio de mail
            Properties confMail = new Properties();
            confMail.setProperty("mail.smtp.host", "smtp.gmail.com");
            confMail.setProperty("mail.smtp.starttls.enable", "true");
            confMail.setProperty("mail.smtp.port", "587");
            confMail.setProperty("mail.smtp.user", "CHAVO0022009@gmail.com");
            confMail.setProperty("mail.smtp.auth", "true");
            // Sesion
            Session session = Session.getDefaultInstance(confMail);
            // Creamos el Mail
            MimeMessage correo = new MimeMessage(session);
            correo.setFrom(new InternetAddress(this._de));
            correo.addRecipient(Message.RecipientType.TO, new InternetAddress(this._para));
            correo.setSubject(this._titulo);
            
            DataHandler dh = new DataHandler(this._cuerpoMsj, "text/html");
            correo.setDataHandler(dh);

            // Enviamos correo .
            Transport transport = session.getTransport("smtp");
            transport.connect("chavo0022009@gmail.com", "RRRH5523426661");
            transport.sendMessage(correo, correo.getAllRecipients());

            // Cerramos conexion.
            transport.close();
            envio = true;
        } catch (Exception e) {
            this._error = e.getMessage();
        }
        return envio;
    }

}
