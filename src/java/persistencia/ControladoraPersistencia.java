package persistencia;

import java.util.ArrayList;
import java.util.List;
import logica.Cliente;
import logica.Empleado;
import logica.PaqueteTuristico;
import logica.Servicio;
import logica.Usuario;
import logica.Venta;

public class ControladoraPersistencia {

    ClienteJpaController cliJPA = new ClienteJpaController();
    EmpleadoJpaController empJPA = new EmpleadoJpaController();
    PaqueteTuristicoJpaController paqJPA = new PaqueteTuristicoJpaController();
    ServicioJpaController servJPA = new ServicioJpaController();
    UsuarioJpaController userJPA = new UsuarioJpaController();
    VentaJpaController ventaJPA = new VentaJpaController();

    //Methods
    //Usuario
    public void crearUser(Usuario user) {
        try {
            userJPA.create(user);
        } catch (Exception ex) {
        }
    }

    public void editUser(Usuario user) {
        try {
            userJPA.edit(user);
        } catch (Exception ex) {
        }
    }

    public void destroyUser(int id) {
        try {
            userJPA.destroy(id);
        } catch (Exception ex) {
        }
    }

    public List<Usuario> findUsers() {
        List<Usuario> listaUsers = new ArrayList<Usuario>();
        try {
            listaUsers = userJPA.findUsuarioEntities();
        } catch (Exception ex) {
        }
        return listaUsers;
    }

    public Usuario findUser(int id) {
        Usuario user = new Usuario();
        try {
            user = userJPA.findUsuario(id);
        } catch (Exception ex) {
        }
        return user;
    }

    //Cliente
    public void crearClient(Cliente cli) {
        try {
            cliJPA.create(cli);
        } catch (Exception ex) {
        }
    }

    public void editClient(Cliente cli) {
        try {
            cliJPA.edit(cli);
        } catch (Exception ex) {
        }
    }

    public void destroyClient(int id) {
        try {
            cliJPA.destroy(id);
        } catch (Exception ex) {
        }
    }

    public List<Cliente> findClients() {
        List<Cliente> listaClients = new ArrayList<Cliente>();
        try {
            listaClients = cliJPA.findClienteEntities();
        } catch (Exception ex) {
        }
        return listaClients;
    }

    public Cliente findClient(int id) {
        Cliente cli = new Cliente();
        try {
            cli = cliJPA.findCliente(id);
        } catch (Exception ex) {
        }
        return cli;
    }

    //Empleado
    public void crearEmpleado(Empleado emp) {
        try {
            empJPA.create(emp);
        } catch (Exception ex) {
        }
    }

    public void editEmpleado(Empleado emp) {
        try {
            empJPA.edit(emp);
        } catch (Exception ex) {
        }
    }

    public void destroyEmpleado(int id) {
        try {
            empJPA.destroy(id);
        } catch (Exception ex) {
        }
    }

    public List<Empleado> findEmpleados() {
        List<Empleado> listaEmpleados = new ArrayList<Empleado>();
        try {
            listaEmpleados = empJPA.findEmpleadoEntities();
        } catch (Exception ex) {
        }
        return listaEmpleados;
    }

    public Empleado findEmpleado(int id) {
        Empleado emp = new Empleado();
        try {
            empJPA.findEmpleado(id);
        } catch (Exception ex) {
        }
        return emp;
    }

    //Servicio
    public void crearService(Servicio serv) {
        try {
            servJPA.create(serv);
        } catch (Exception ex) {
        }
    }

    public void editService(Servicio serv) {
        try {
            servJPA.edit(serv);
        } catch (Exception ex) {
        }
    }

    public void destroyService(int id) {
        try {
            servJPA.destroy(id);
        } catch (Exception ex) {
        }
    }

    public List<Servicio> findServices() {
        List<Servicio> listaServices = new ArrayList<Servicio>();
        try {
            listaServices = servJPA.findServicioEntities();
        } catch (Exception ex) {
        }
        return listaServices;
    }

    public Servicio findService(int id) {
        Servicio serv = new Servicio();
        try {
            serv = servJPA.findServicio(id);
        } catch (Exception ex) {
        }
        return serv;
    }

    //Paquete Turisticp
    public void crearPaqTur(PaqueteTuristico paq) {
        try {
            paqJPA.create(paq);
        } catch (Exception ex) {
        }
    }

    public void editPaqTur(PaqueteTuristico paq) {
        try {
            paqJPA.edit(paq);
        } catch (Exception ex) {
        }
    }

    public void destroyPaqTur(int id) {
        try {
            paqJPA.destroy(id);
        } catch (Exception ex) {
        }
    }

    public List<PaqueteTuristico> findPaqsTur() {
        List<PaqueteTuristico> listaPaquetes = new ArrayList<PaqueteTuristico>();
        try {
            listaPaquetes = paqJPA.findPaqueteTuristicoEntities();
        } catch (Exception ex) {
        }
        return listaPaquetes;
    }

    public PaqueteTuristico findPaqTur(int id) {
        PaqueteTuristico paq = new PaqueteTuristico();
        try {
            paqJPA.findPaqueteTuristico(id);
        } catch (Exception ex) {
        }
        return paq;
    }

    //Venta
    public void crearVenta(Venta vent) {
        try {
            ventaJPA.create(vent);
        } catch (Exception ex) {
        }
    }

    public void editVenta(Venta vent) {
        try {
            ventaJPA.edit(vent);
        } catch (Exception ex) {
        }
    }

    public void destroyVenta(int id) {
        try {
            ventaJPA.destroy(id);
        } catch (Exception ex) {
        }
    }

    public List<Venta> findVentas() {
        List<Venta> listaVentas = new ArrayList<Venta>();
        try {
            listaVentas = ventaJPA.findVentaEntities();
        } catch (Exception ex) {
        }
        return listaVentas;
    }

    public Venta findVenta(int id) {
        Venta vent = new Venta();
        try {
            ventaJPA.findVenta(id);
        } catch (Exception ex) {
        }
        return vent;
    }

}
