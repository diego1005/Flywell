package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Venta implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int num_venta;
    private String modo_pago;
    @Temporal(TemporalType.DATE)
    private Date fecha_venta;
    @ManyToOne
    @PrimaryKeyJoinColumn(name="id_empleado")
    private Empleado empleado;
    @ManyToOne
    @PrimaryKeyJoinColumn(name="id_cliente")
    private Cliente cliente;
    @ManyToOne
    private Servicio servicio;
    @ManyToOne
    private PaqueteTuristico paquete;

    public Venta() {
    }

    public Venta(int num_venta, String modo_pago, Date fecha_venta) {
        this.num_venta = num_venta;
        this.modo_pago = modo_pago;
        this.fecha_venta = fecha_venta;
    }

    public int getNum_venta() {
        return num_venta;
    }

    public void setNum_venta(int num_venta) {
        this.num_venta = num_venta;
    }

    public String getModo_pago() {
        return modo_pago;
    }

    public void setModo_pago(String modo_pago) {
        this.modo_pago = modo_pago;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Servicio getServicio() {
        return servicio;
    }

    public void setServicio(Servicio servicio) {
        this.servicio = servicio;
    }

    public PaqueteTuristico getPaquete() {
        return paquete;
    }

    public void setPaquete(PaqueteTuristico paquete) {
        this.paquete = paquete;
    }
    
}
