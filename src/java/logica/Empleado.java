package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Empleado extends Persona implements Serializable {

    private String cargo;
    private float sueldo;
    @OneToOne
    private Usuario usuario;
    @OneToMany
    private List<Venta> listaVentas;

    public Empleado() {
    }

    public Empleado(String cargo, float sueldo, String dni, 
            String nombre, String apellido, String direccion, String celular, 
            String email, String nacionalidad, Date fecha_nac) {
        super(dni, nombre, apellido, direccion, celular, email, nacionalidad, fecha_nac);
        this.cargo = cargo;
        this.sueldo = sueldo;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public float getSueldo() {
        return sueldo;
    }

    public void setSueldo(float sueldo) {
        this.sueldo = sueldo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Venta> getListaVentas() {
        return listaVentas;
    }

    public void setListaVentas(List<Venta> listaVentas) {
        this.listaVentas = listaVentas;
    }

}
