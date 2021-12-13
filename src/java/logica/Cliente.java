package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Cliente extends Persona implements Serializable {

    @Id
    @Column(name="id_cliente")
    private int id_cliente;
    @OneToMany
    private List<Venta> listaVentas;

    public Cliente() {
    }

    public Cliente(int id_cliente, String dni, String nombre, String apellido,
            String direccion, String celular, String email, String nacionalidad, Date fecha_nac) {
        super(dni, nombre, apellido, direccion, celular, email, nacionalidad, fecha_nac);
        this.id_cliente = id_cliente;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public List<Venta> getListaVentas() {
        return listaVentas;
    }

    public void setListaVentas(List<Venta> listaVentas) {
        this.listaVentas = listaVentas;
    }
    

}
