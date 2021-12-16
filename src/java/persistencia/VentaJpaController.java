package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Empleado;
import logica.Cliente;
import logica.Servicio;
import logica.PaqueteTuristico;
import logica.Venta;
import persistencia.exceptions.NonexistentEntityException;

public class VentaJpaController implements Serializable {

    public VentaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public VentaJpaController() {
        emf = Persistence.createEntityManagerFactory("Flywell_PU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Venta venta) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Empleado empleado = venta.getEmpleado();
            if (empleado != null) {
                empleado = em.getReference(empleado.getClass(), empleado.getId_persona());
                venta.setEmpleado(empleado);
            }
            Cliente cliente = venta.getCliente();
            if (cliente != null) {
                cliente = em.getReference(cliente.getClass(), cliente.getId_persona());
                venta.setCliente(cliente);
            }
            Servicio servicio = venta.getServicio();
            if (servicio != null) {
                servicio = em.getReference(servicio.getClass(), servicio.getCod_servicio());
                venta.setServicio(servicio);
            }
            PaqueteTuristico paquete = venta.getPaquete();
            if (paquete != null) {
                paquete = em.getReference(paquete.getClass(), paquete.getCod_paquete());
                venta.setPaquete(paquete);
            }
            em.persist(venta);
            if (empleado != null) {
                empleado.getListaVentas().add(venta);
                empleado = em.merge(empleado);
            }
            if (cliente != null) {
                cliente.getListaVentas().add(venta);
                cliente = em.merge(cliente);
            }
            if (servicio != null) {
                servicio.getListaVentas().add(venta);
                servicio = em.merge(servicio);
            }
            if (paquete != null) {
                paquete.getListaVentas().add(venta);
                paquete = em.merge(paquete);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Venta venta) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Venta persistentVenta = em.find(Venta.class, venta.getNum_venta());
            Empleado empleadoOld = persistentVenta.getEmpleado();
            Empleado empleadoNew = venta.getEmpleado();
            Cliente clienteOld = persistentVenta.getCliente();
            Cliente clienteNew = venta.getCliente();
            Servicio servicioOld = persistentVenta.getServicio();
            Servicio servicioNew = venta.getServicio();
            PaqueteTuristico paqueteOld = persistentVenta.getPaquete();
            PaqueteTuristico paqueteNew = venta.getPaquete();
            if (empleadoNew != null) {
                empleadoNew = em.getReference(empleadoNew.getClass(), empleadoNew.getId_persona());
                venta.setEmpleado(empleadoNew);
            }
            if (clienteNew != null) {
                clienteNew = em.getReference(clienteNew.getClass(), clienteNew.getId_persona());
                venta.setCliente(clienteNew);
            }
            if (servicioNew != null) {
                servicioNew = em.getReference(servicioNew.getClass(), servicioNew.getCod_servicio());
                venta.setServicio(servicioNew);
            }
            if (paqueteNew != null) {
                paqueteNew = em.getReference(paqueteNew.getClass(), paqueteNew.getCod_paquete());
                venta.setPaquete(paqueteNew);
            }
            venta = em.merge(venta);
            if (empleadoOld != null && !empleadoOld.equals(empleadoNew)) {
                empleadoOld.getListaVentas().remove(venta);
                empleadoOld = em.merge(empleadoOld);
            }
            if (empleadoNew != null && !empleadoNew.equals(empleadoOld)) {
                empleadoNew.getListaVentas().add(venta);
                empleadoNew = em.merge(empleadoNew);
            }
            if (clienteOld != null && !clienteOld.equals(clienteNew)) {
                clienteOld.getListaVentas().remove(venta);
                clienteOld = em.merge(clienteOld);
            }
            if (clienteNew != null && !clienteNew.equals(clienteOld)) {
                clienteNew.getListaVentas().add(venta);
                clienteNew = em.merge(clienteNew);
            }
            if (servicioOld != null && !servicioOld.equals(servicioNew)) {
                servicioOld.getListaVentas().remove(venta);
                servicioOld = em.merge(servicioOld);
            }
            if (servicioNew != null && !servicioNew.equals(servicioOld)) {
                servicioNew.getListaVentas().add(venta);
                servicioNew = em.merge(servicioNew);
            }
            if (paqueteOld != null && !paqueteOld.equals(paqueteNew)) {
                paqueteOld.getListaVentas().remove(venta);
                paqueteOld = em.merge(paqueteOld);
            }
            if (paqueteNew != null && !paqueteNew.equals(paqueteOld)) {
                paqueteNew.getListaVentas().add(venta);
                paqueteNew = em.merge(paqueteNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = venta.getNum_venta();
                if (findVenta(id) == null) {
                    throw new NonexistentEntityException("The venta with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Venta venta;
            try {
                venta = em.getReference(Venta.class, id);
                venta.getNum_venta();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The venta with id " + id + " no longer exists.", enfe);
            }
            Empleado empleado = venta.getEmpleado();
            if (empleado != null) {
                empleado.getListaVentas().remove(venta);
                empleado = em.merge(empleado);
            }
            Cliente cliente = venta.getCliente();
            if (cliente != null) {
                cliente.getListaVentas().remove(venta);
                cliente = em.merge(cliente);
            }
            Servicio servicio = venta.getServicio();
            if (servicio != null) {
                servicio.getListaVentas().remove(venta);
                servicio = em.merge(servicio);
            }
            PaqueteTuristico paquete = venta.getPaquete();
            if (paquete != null) {
                paquete.getListaVentas().remove(venta);
                paquete = em.merge(paquete);
            }
            em.remove(venta);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Venta> findVentaEntities() {
        return findVentaEntities(true, -1, -1);
    }

    public List<Venta> findVentaEntities(int maxResults, int firstResult) {
        return findVentaEntities(false, maxResults, firstResult);
    }

    private List<Venta> findVentaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Venta.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Venta findVenta(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Venta.class, id);
        } finally {
            em.close();
        }
    }

    public int getVentaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Venta> rt = cq.from(Venta.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
