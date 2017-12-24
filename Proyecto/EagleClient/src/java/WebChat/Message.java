/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebChat;

/**
 *
 * @author chavo
 */
public class Message {

    private int idmensaje;
    private String mensaje;
    private int IdUsuario;
    private int IdTeam;
    private int IdDestinatarioUsuario;
    private String FechaDeCreacion;
    private String Estado;            

    public Message() {
    }

    public Message(int idmensaje, String mensaje, int IdUsuario, int IdTeam, int IdDestinatarioUsuario, String FechaDeCreacion, String Estado) {
        this.idmensaje = idmensaje;
        this.mensaje = mensaje;
        this.IdUsuario = IdUsuario;
        this.IdTeam = IdTeam;
        this.IdDestinatarioUsuario = IdDestinatarioUsuario;
        this.FechaDeCreacion = FechaDeCreacion;
        this.Estado = Estado;
    }

    public int getIdmensaje() {
        return idmensaje;
    }

    public void setIdmensaje(int idmensaje) {
        this.idmensaje = idmensaje;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public int getIdTeam() {
        return IdTeam;
    }

    public void setIdTeam(int IdTeam) {
        this.IdTeam = IdTeam;
    }

    public int getIdDestinatarioUsuario() {
        return IdDestinatarioUsuario;
    }

    public void setIdDestinatarioUsuario(int IdDestinatarioUsuario) {
        this.IdDestinatarioUsuario = IdDestinatarioUsuario;
    }

    public String getFechaDeCreacion() {
        return FechaDeCreacion;
    }

    public void setFechaDeCreacion(String FechaDeCreacion) {
        this.FechaDeCreacion = FechaDeCreacion;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
}
