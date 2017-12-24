
package Servicios;

import Usuarios.Direccion;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *JAVA CLASS
 * @author Miguel
 */
public class Servicio {

    private int IdServicio;
    private String DescripcionDeServicio;
    private String FechaSolicitud;
    private String FechaEntrega;
    private int Costo;
    private int IdCliente;
    private int IdUnidad;
    private int IdDireccion;
    private String Estatus;
    private String Nombre;
    private String correo;
    private Direccion dir;

    public Servicio() {
    }


    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

   

    public Direccion getDir() {
        return dir;
    }

    public void setDir(Direccion dir) {
        this.dir = dir;
    }        

    public int getIdServicio() {
        return IdServicio;
    }

    public void setIdServicio(int IdServicio) {
        this.IdServicio = IdServicio;
    }

    public String getDescripcionDeServicio() {
        return DescripcionDeServicio;
    }

    public void setDescripcionDeServicio(String DescripcionDeServicio) {
        this.DescripcionDeServicio = DescripcionDeServicio;
    }

    public String getFechaSolicitud() {
        return FechaSolicitud;
    }

    public void setFechaSolicitud(String FechaSolicitud) {
        this.FechaSolicitud = FechaSolicitud;
    }

    public String getFechaEntrega() {
        return FechaEntrega;
    }

    public void setFechaEntrega(String FechaEntrega) {
        this.FechaEntrega = FechaEntrega;
    }

    public int getCosto() {
        return Costo;
    }

    public void setCosto(int Costo) {
        this.Costo = Costo;
    }

    public int getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(int IdCliente) {
        this.IdCliente = IdCliente;
    }

    public int getIdUnidad() {
        return IdUnidad;
    }

    public void setIdUnidad(int IdUnidad) {
        this.IdUnidad = IdUnidad;
    }

    public int getIdDireccion() {
        return IdDireccion;
    }

    public void setIdDireccion(int IdDireccion) {
        this.IdDireccion = IdDireccion;
    }

    public String getEstatus() {
        return Estatus;
    }

    public void setEstatus(String Estatus) {
        this.Estatus = Estatus;
    }

    private DataSource getJuj() throws NamingException {
        Context c = new InitialContext();
        return (DataSource) c.lookup("java:comp/env/juj");
    }
    
    
}
