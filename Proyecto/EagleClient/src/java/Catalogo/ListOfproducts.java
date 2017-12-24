
package Catalogo;
import java.util.ArrayList;

/**
 * JAVA CLASS
 *
 * @author Emilio
 */
public class ListOfproducts {
    private ArrayList<Producto> ListaProductos;

    public ListOfproducts() {
        ListaProductos = new ArrayList<>();
    }

    public ListOfproducts(ArrayList<Producto> ListaProductos) {
        this.ListaProductos = ListaProductos;
    }

    public void AñadirALista(Producto Prpduct) {
        this.ListaProductos.add(Prpduct);
    }

    public int getTamañoLista() {
        return this.ListaProductos.size();
    }
    
    public int getResOfColumns(){
        return this.ListaProductos.size()%3;
    }
    
    public int getRows(){
        if(getResOfColumns()>0){
            return ListaProductos.size()/3 +1;
        }else{
            return ListaProductos.size()/3;
        }
    }

    public Producto GetService(int i) {
        return ListaProductos.get(i);
    }

    public ArrayList<Producto> getListaServicios() {
        return ListaProductos;
    }

}
