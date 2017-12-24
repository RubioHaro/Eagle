
package Servicios;

import java.util.ArrayList;

/**
 *JAVA CLASS
 * @author Rod
 */
public class ListaServicios {
    private ArrayList<Servicio> ListaServicios;

    public ListaServicios() {
        ListaServicios = new ArrayList<>();
    }
    

    public ListaServicios(ArrayList<Servicio> ListaServicios) {
        this.ListaServicios = ListaServicios;
    }
    public void AñadirALista(Servicio service){
        this.ListaServicios.add(service);
    }

    public int getTamañoLista(){
        return this.ListaServicios.size();
    }
    
    public Servicio GetService(int i){
        return ListaServicios.get(i);
    }
    
    public ArrayList<Servicio> getListaServicios() {
        return ListaServicios;
    }
    
}
