package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class PaqueteTuristico implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int cod_paquete;
    @Basic
    private float costo_paquete;
    @ManyToMany
    private List<Servicio> listaServicios;
    @OneToMany
    private List<Venta> listaVentas;

    public PaqueteTuristico() {
    }

    public PaqueteTuristico(int cod_paquete, float costo_paquete, List<Servicio> listaServicios) {
        this.cod_paquete = cod_paquete;
        this.costo_paquete = costo_paquete;
        this.listaServicios = listaServicios;
    }

    public int getCod_paquete() {
        return cod_paquete;
    }

    public void setCod_paquete(int cod_paquete) {
        this.cod_paquete = cod_paquete;
    }

    public float getCosto_paquete() {
        return costo_paquete;
    }

    public void setCosto_paquete(float costo_paquete) {
        this.costo_paquete = costo_paquete;
    }

    public List<Servicio> getListaServicios() {
        return listaServicios;
    }

    public void setListaServicios(List<Servicio> listaServicios) {
        this.listaServicios = listaServicios;
    }

    public List<Venta> getListaVentas() {
        return listaVentas;
    }

    public void setListaVentas(List<Venta> listaVentas) {
        this.listaVentas = listaVentas;
    }
    

    public void add(PaqueteTuristico paqueteTuristico) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void remove(PaqueteTuristico paqueteTuristico) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
