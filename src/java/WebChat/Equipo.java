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
public class Equipo {
    private int IdEquipo;
    private String Nombre;
    private String Tema;
    private int Creador;
    private String FechaDeCreacion;
    private String Estado;

    public Equipo() {
    }

    public Equipo(int IdEquipo, String Nombre, String Tema, int Creador, String FechaDeCreacion, String Estado) {
        this.IdEquipo = IdEquipo;
        this.Nombre = Nombre;
        this.Tema = Tema;
        this.Creador = Creador;
        this.FechaDeCreacion = FechaDeCreacion;
        this.Estado = Estado;
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

    
    
    public int getIdEquipo() {
        return IdEquipo;
    }

    public void setIdEquipo(int IdEquipo) {
        this.IdEquipo = IdEquipo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getTema() {
        return Tema;
    }

    public void setTema(String Tema) {
        this.Tema = Tema;
    }

    public int getCreador() {
        return Creador;
    }

    public void setCreador(int Creador) {
        this.Creador = Creador;
    }
    
    
}
