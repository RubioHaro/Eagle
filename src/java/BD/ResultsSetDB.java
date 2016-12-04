
package BD;

import Usuarios.Usuario;

/**
 *JAVA CLASS
 * @author Ruben
 */
public class ResultsSetDB {

    private String Estaus;
    private Usuario user;
    private Boolean condicion;
    private int Errores ;

    public ResultsSetDB() {
    }
    
    
    
    
    public ResultsSetDB(String Estaus, Usuario user, Boolean condicion) {
        this.Estaus = Estaus;
        this.user = user;
        this.condicion = condicion;
        this.Errores = 0;
                
    }
    public void AgregarError(){
        this.Errores = Errores + 1;
    }
    public ResultsSetDB(String Estaus, Usuario user) {
        this.Estaus = Estaus;
        this.user = user;
        this.Errores = 0;
    }

    public ResultsSetDB(Usuario user, Boolean condicion) {
        this.user = user;
        this.condicion = condicion;
        this.Errores = 0;
    }

    public ResultsSetDB(Usuario user) {
        this.user = user;
        this.Errores = 0;
    }

    public ResultsSetDB(Boolean condicion) {
        this.condicion = condicion;
        this.Errores = 0;
    }

    public int getErrores() {
        return Errores;
    }           
    
    public String getEstaus() {
        return Estaus;
    }

    public void setEstaus(String Estaus) {
        this.Estaus = Estaus;
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }

    public Boolean getCondicion() {
        return condicion;
    }

    public void setCondicion(Boolean condicion) {
        this.condicion = condicion;
    }
    
}
