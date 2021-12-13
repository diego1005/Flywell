package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Venta;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.PaqueteTuristico;
import persistencia.exceptions.NonexistentEntityException;
import persistencia.exceptions.PreexistingEntityException;

public class PaqueteTuristicoJpaController implements Serializable {

    public PaqueteTuristicoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public PaqueteTuristicoJpaController() {
        emf = Persistence.createEntityManagerFactory("Flywell_PU");
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(PaqueteTuristico paqueteTuristico) throws PreexistingEntityException, Exception {
        if (paqueteTuristico.getListaVentas() == null) {
            paqueteTuristico.setListaVentas(new ArrayList<Venta>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Venta> attachedListaVentas = new ArrayList<Venta>();
            for (Venta listaVentasVentaToAttach : paqueteTuristico.getListaVentas()) {
                listaVentasVentaToAttach = em.getReference(listaVentasVentaToAttach.getClass(), listaVentasVentaToAttach.getNum_venta());
                attachedListaVentas.add(listaVentasVentaToAttach);
            }
            paqueteTuristico.setListaVentas(attachedListaVentas);
            em.persist(paqueteTuristico);
            for (Venta listaVentasVenta : paqueteTuristico.getListaVentas()) {
                PaqueteTuristico oldPaqueteOfListaVentasVenta = listaVentasVenta.getPaquete();
                listaVentasVenta.setPaquete(paqueteTuristico);
                listaVentasVenta = em.merge(listaVentasVenta);
                if (oldPaqueteOfListaVentasVenta != null) {
                    oldPaqueteOfListaVentasVenta.getListaVentas().remove(listaVentasVenta);
                    oldPaqueteOfListaVentasVenta = em.merge(oldPaqueteOfListaVentasVenta);
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findPaqueteTuristico(paqueteTuristico.getCod_paquete()) != null) {
                throw new PreexistingEntityException("PaqueteTuristico " + paqueteTuristico + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(PaqueteTuristico paqueteTuristico) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            PaqueteTuristico persistentPaqueteTuristico = em.find(PaqueteTuristico.class, paqueteTuristico.getCod_paquete());
            List<Venta> listaVentasOld = persistentPaqueteTuristico.getListaVentas();
            List<Venta> listaVentasNew = paqueteTuristico.getListaVentas();
            List<Venta> attachedListaVentasNew = new ArrayList<Venta>();
            for (Venta listaVentasNewVentaToAttach : listaVentasNew) {
                listaVentasNewVentaToAttach = em.getReference(listaVentasNewVentaToAttach.getClass(), listaVentasNewVentaToAttach.getNum_venta());
                attachedListaVentasNew.add(listaVentasNewVentaToAttach);
            }
            listaVentasNew = attachedListaVentasNew;
            paqueteTuristico.setListaVentas(listaVentasNew);
            paqueteTuristico = em.merge(paqueteTuristico);
            for (Venta listaVentasOldVenta : listaVentasOld) {
                if (!listaVentasNew.contains(listaVentasOldVenta)) {
                    listaVentasOldVenta.setPaquete(null);
                    listaVentasOldVenta = em.merge(listaVentasOldVenta);
                }
            }
            for (Venta listaVentasNewVenta : listaVentasNew) {
                if (!listaVentasOld.contains(listaVentasNewVenta)) {
                    PaqueteTuristico oldPaqueteOfListaVentasNewVenta = listaVentasNewVenta.getPaquete();
                    listaVentasNewVenta.setPaquete(paqueteTuristico);
                    listaVentasNewVenta = em.merge(listaVentasNewVenta);
                    if (oldPaqueteOfListaVentasNewVenta != null && !oldPaqueteOfListaVentasNewVenta.equals(paqueteTuristico)) {
                        oldPaqueteOfListaVentasNewVenta.getListaVentas().remove(listaVentasNewVenta);
                        oldPaqueteOfListaVentasNewVenta = em.merge(oldPaqueteOfListaVentasNewVenta);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = paqueteTuristico.getCod_paquete();
                if (findPaqueteTuristico(id) == null) {
                    throw new NonexistentEntityException("The paqueteTuristico with id " + id + " no longer exists.");
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
            PaqueteTuristico paqueteTuristico;
            try {
                paqueteTuristico = em.getReference(PaqueteTuristico.class, id);
                paqueteTuristico.getCod_paquete();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The paqueteTuristico with id " + id + " no longer exists.", enfe);
            }
            List<Venta> listaVentas = paqueteTuristico.getListaVentas();
            for (Venta listaVentasVenta : listaVentas) {
                listaVentasVenta.setPaquete(null);
                listaVentasVenta = em.merge(listaVentasVenta);
            }
            em.remove(paqueteTuristico);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<PaqueteTuristico> findPaqueteTuristicoEntities() {
        return findPaqueteTuristicoEntities(true, -1, -1);
    }

    public List<PaqueteTuristico> findPaqueteTuristicoEntities(int maxResults, int firstResult) {
        return findPaqueteTuristicoEntities(false, maxResults, firstResult);
    }

    private List<PaqueteTuristico> findPaqueteTuristicoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(PaqueteTuristico.class));
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

    public PaqueteTuristico findPaqueteTuristico(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(PaqueteTuristico.class, id);
        } finally {
            em.close();
        }
    }

    public int getPaqueteTuristicoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<PaqueteTuristico> rt = cq.from(PaqueteTuristico.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
