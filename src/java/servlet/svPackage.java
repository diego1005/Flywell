package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.PaqueteTuristico;
import logica.Servicio;

public class svPackage extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        int id = Integer.parseInt(request.getParameter("id"));
//        String[] listaServ = request.getParameterValues("listaServ");
//        float costo_paq = Float.parseFloat(request.getParameter("costoPaq"));
//        
//        PaqueteTuristico paq = control.listarPaqueteTuristico(id);
//        
//        paq.setListaServicios(listaServ);
//        paq.setCosto_paquete(costo_paq);
//
//
//        control.editarPaqueteTuristico(paq);
//        request.getSession().setAttribute("listaPaquetes", control.listarPaquetesTuristicos());
//
//        response.sendRedirect("package.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Parametro Eliminacion
        String id = request.getParameter("id");
        //Parametro Modificacion
        String edit = request.getParameter("edit");

        if (id == null && edit == null) {
            //Parametros Alta

            System.out.println(request.getParameterValues("listServ"));
//            for (String hg : listaServId) {
//                System.out.println(hg);
//            }
//            List<Servicio> listaServ = new ArrayList();
//            for (String idS : listaServId) {
//                listaServ.add(control.listarServicio(Integer.parseInt(idS)));
//            }

            String[] costos_serv = request.getParameterValues("costoServ");
            float costo_total = 0;
            for (String costo : costos_serv) {
                costo_total = costo_total + Integer.parseInt(costo);
            }

            //Alta
            PaqueteTuristico paq = new PaqueteTuristico();
            float costo_serv = paq.calcularCostoPaq(costo_total);
            //paq.setListaServicios(listaServ);
            paq.setCosto_paquete(costo_serv);

            control.crearPaqueteTuristico(paq);
            response.sendRedirect("package.jsp");

            //Eliminacion
        } else if (id != null && edit == null) {
            int nid = Integer.parseInt(id);
            control.eliminarPaqueteTuristico(nid);
            request.getSession().setAttribute("listaPaquetes", control.listarPaquetesTuristicos());
            response.sendRedirect("package.jsp");
        } else if (id != null && edit != null) {
            //Modificacion
            int nid = Integer.parseInt(id);
            PaqueteTuristico paquete = control.listarPaqueteTuristico(nid);

            HttpSession mysession = request.getSession();
            mysession.setAttribute("paquete", paquete);

            response.sendRedirect("epackage.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
