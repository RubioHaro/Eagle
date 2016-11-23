/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

/**
 *
 * @author Rod
 */
public class BaseDeDatos {
    private String NombreServidor;
    private String NombreUsuario;
    private String Password;
    private String NombreBaseDeDatos;
    private String Puerto;
    private String URL;
    private String driverClassName;

    public BaseDeDatos(String NombreServidor, String NombreUsuario, String Password, String NombreBaseDeDatos, String Puerto, String driverClassName) {
        this.NombreServidor = NombreServidor;
        this.NombreUsuario = NombreUsuario;
        this.Password = Password;
        this.NombreBaseDeDatos = NombreBaseDeDatos;
        this.Puerto = Puerto;
        this.URL = "jdbc:mysql://"+NombreServidor+":"+Puerto+"/"+NombreBaseDeDatos+"";
        this.driverClassName = driverClassName;
    }

    public BaseDeDatos() {
        this.NombreBaseDeDatos = "BDatos";
        this.NombreUsuario = "root";
        this.Password = "n0m3l0";
        this.NombreServidor = "localhost";
        this.Puerto = "3306";
        this.URL = "jdbc:mysql://"+NombreServidor+":"+Puerto+"/"+NombreBaseDeDatos+"";
        this.driverClassName = "com.mysql.jdbc.Driver"; 
        
    }

    public String getNombreServidor() {
        return NombreServidor;
    }

    public void setNombreServidor(String NombreServidor) {
        this.NombreServidor = NombreServidor;
    }

    public String getNombreUsuario() {
        return NombreUsuario;
    }

    public void setNombreUsuario(String NombreUsuario) {
        this.NombreUsuario = NombreUsuario;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getNombreBaseDeDatos() {
        return NombreBaseDeDatos;
    }

    public void setNombreBaseDeDatos(String NombreBaseDeDatos) {
        this.NombreBaseDeDatos = NombreBaseDeDatos;
    }

    public String getPuerto() {
        return Puerto;
    }

    public void setPuerto(String Puerto) {
        this.Puerto = Puerto;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public String getDriverClassName() {
        return driverClassName;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }
    
    
    
}
