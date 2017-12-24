

package Unidades;

import java.util.ArrayList;

/**
 *JAVA CLASS
 * @author Miguel
 */
public class ListaUnidades {
    private ArrayList<Unidad> ListaUnidades;

    public ListaUnidades() {
        ListaUnidades = new ArrayList<>();
    }
    

    public ListaUnidades(ArrayList<Unidad> ListaUnidades) {
        this.ListaUnidades = ListaUnidades;
    }
    public void AñadirALista(Unidad Unit){
        this.ListaUnidades.add(Unit);
    }

    public int getTamañoLista(){
        return this.ListaUnidades.size();
    }
    
    public Unidad GetUnidad(int i){
        return ListaUnidades.get(i);
    }
    
    public ArrayList<Unidad> getListaUnidades() {
        return ListaUnidades;
    }
    
}
