package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Servicio implements Serializable {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int cod_servicio;
    @Basic
    private String nombre;
    private String descripcion;
    private String destino;
    private float costo_servicio;
    @Temporal(TemporalType.DATE)
    private Date fecha_servicio;
    @OneToMany
    private List<Venta> listaVentas;

    public Servicio() {
    }

    public Servicio(String nombre, String descripcion,
            String destino, float costo_servicio, Date fecha_servicio) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.destino = destino;
        this.costo_servicio = costo_servicio;
        this.fecha_servicio = fecha_servicio;
    }

    public int getCod_servicio() {
        return cod_servicio;
    }

    public void setCod_servicio(int cod_servicio) {
        this.cod_servicio = cod_servicio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public float getCosto_servicio() {
        return costo_servicio;
    }

    public void setCosto_servicio(float costo_servicio) {
        this.costo_servicio = costo_servicio;
    }

    public Date getFecha_servicio() {
        return fecha_servicio;
    }

    public void setFecha_servicio(Date fecha_servicio) {
        this.fecha_servicio = fecha_servicio;
    }

    public List<Venta> getListaVentas() {
        return listaVentas;
    }

    public void setListaVentas(List<Venta> listaVentas) {
        this.listaVentas = listaVentas;
    }
    

}
