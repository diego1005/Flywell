package logica;

import java.util.List;
import persistencia.ControladoraPersistencia;

//Nexo entre el Servlet y la Controladora de Persistencia
public class Controladora {

    ControladoraPersistencia control = new ControladoraPersistencia();

    //Methods
    //Usuario
    public void crearUser(Usuario user) {
        control.crearUser(user);
    }
    public void editarUser(Usuario user) {
        control.editUser(user);
    }
    public void eliminarUser(int id) {
        control.destroyUser(id);
    }
    public List<Usuario> listarUsers() {
        return control.findUsers();
    }
    public Usuario listarUser(int id) {
        return control.findUser(id);
    }
    
    //Cliente
    public void crearCliente(Cliente cli) {
        control.crearClient(cli);
    }
    public void editarCliente(Cliente cli) {
        control.editClient(cli);
    }
    public void eliminarCliente(int id) {
        control.destroyClient(id);
    }
    public List<Cliente> listarClientes() {
        return control.findClients();
    }
    public Cliente listarCliente(int id) {
        return control.findClient(id);
    }
    
    //Empleado
    public void crearEmpleado(Empleado emp) {
        control.crearEmpleado(emp);
    }
    public void editarEmpleado(Empleado emp) {
        control.editEmpleado(emp);
    }
    public void eliminarEmpleado(int id) {
        control.destroyEmpleado(id);
    }
    public List<Empleado> listarEmpleados() {
        return control.findEmpleados();
    }
    public Empleado listarEmpleado(int id) {
        return control.findEmpleado(id);
    }
    
    //Servicio
    public void crearServicio(Servicio serv) {
        control.crearService(serv);
    }
    public void editarServicio(Servicio serv) {
        control.editService(serv);
    }
    public void eliminarServicio(int id) {
        control.destroyService(id);
    }
    public List<Servicio> listarServicios() {
        return control.findServices();
    }
    public Servicio listarServicio(int id) {
        return control.findService(id);
    }
    
    //Paquete Turistico
    public void crearPaqueteTuristico(PaqueteTuristico paq) {
        control.crearPaqTur(paq);
    }
    public void editarPaqueteTuristico(PaqueteTuristico paq) {
        control.editPaqTur(paq);
    }
    public void eliminarPaqueteTuristico(int id) {
        control.destroyPaqTur(id);
    }
    public List<PaqueteTuristico> listarPaquetesTuristicos() {
        return control.findPaqsTur();
    }
    public PaqueteTuristico listarPaqueteTuristico(int id) {
        return control.findPaqTur(id);
    }
    
    //Venta
    public void crearVenta(Venta vent) {
        control.crearVenta(vent);
    }
    public void editarVenta(Venta vent) {
        control.editVenta(vent);
    }
    public void eliminarVenta(int id) {
        control.destroyVenta(id);
    }
    public List<Venta> listarVentas() {
        return control.findVentas();
    }
    public Venta listarVenta(int id) {
        return control.findVenta(id);
    }

}
