package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
public class Cliente extends Persona implements Serializable {

    @OneToMany
    private List<Venta> listaVentas;

    public Cliente() {
    }

    public Cliente(String dni, String nombre, String apellido, String direccion, 
            String celular, String email, String nacionalidad, Date fecha_nac) {
        super(dni, nombre, apellido, direccion, celular, email, nacionalidad, fecha_nac);
    }

        
    public List<Venta> getListaVentas() {
        return listaVentas;
    }

    public void setListaVentas(List<Venta> listaVentas) {
        this.listaVentas = listaVentas;
    }

    @Override
    public String toString() {
        return super.toString();
    }

}
