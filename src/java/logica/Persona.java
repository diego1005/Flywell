package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Inheritance (strategy = InheritanceType.TABLE_PER_CLASS)
public class Persona implements Serializable {
    
    @Id
    @GeneratedValue (strategy=GenerationType.AUTO)
    private int id_persona;
    @Basic
    private String dni;
    private String nombre;
    private String apellido;
    private String direccion;
    private String celular;
    private String email;
    private String nacionalidad;
    @Temporal(TemporalType.DATE)
    private Date fecha_nac;

    public Persona() {
    }

    public Persona(String dni, String nombre, String apellido, 
            String direccion, String celular, String email, String nacionalidad, 
            Date fecha_nac) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.celular = celular;
        this.email = email;
        this.nacionalidad = nacionalidad;
        this.fecha_nac = fecha_nac;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public Date getFecha_nac() {
        return fecha_nac;
    }

    public void setFecha_nac(Date fecha_nac) {
        this.fecha_nac = fecha_nac;
    }

    @Override
    public String toString() {
        return "Persona{" + "id_persona=" + id_persona + ", dni=" + dni + ", nombre=" + nombre + ", apellido=" + apellido + ", direccion=" + direccion + ", celular=" + celular + ", email=" + email + ", nacionalidad=" + nacionalidad + ", fecha_nac=" + fecha_nac + '}';
    }

}
