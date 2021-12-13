package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Empleado extends Persona implements Serializable {

    @Id
    @Column(name="id_empleado")
    private int id_empleado;
    private String cargo;
    private float sueldo;
    @OneToOne
    private Usuario usuario;
    @OneToMany
    private List<Venta> listaVentas;

    public Empleado() {
    }

    public Empleado(int id_empleado, String cargo, float sueldo,
            String dni, String nombre, String apellido, String direccion, String celular,
            String email, String nacionalidad, Date fecha_nac) {
        super(dni, nombre, apellido, direccion, celular, email, nacionalidad, fecha_nac);
        this.id_empleado = id_empleado;
        this.cargo = cargo;
        this.sueldo = sueldo;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
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
