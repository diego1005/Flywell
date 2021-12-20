package servlet;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Servicio;

public class svService extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("s_name");
        String descripcion = request.getParameter("desc");
        String destino = request.getParameter("dest");
        float costo = Float.parseFloat(request.getParameter("cost"));
        Date fecha_serv = Date.valueOf(request.getParameter("f_serv"));

        Servicio serv = control.listarServicio(id);

        serv.setNombre(nombre);
        serv.setDescripcion(descripcion);
        serv.setDestino(destino);
        serv.setCosto_servicio(costo);
        serv.setFecha_servicio(fecha_serv);

        control.editarServicio(serv);
        request.getSession().setAttribute("listaServicios", control.listarServicios());

        response.sendRedirect("service.jsp");

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
            String nombre = request.getParameter("s_name");
            System.out.println(nombre);
            String descripcion = request.getParameter("desc");
            String destino = request.getParameter("dest");
            float costo = Float.parseFloat(request.getParameter("cost"));
            Date fecha_serv = Date.valueOf(request.getParameter("f_serv"));

            //Alta
            Servicio serv = new Servicio(nombre, descripcion, destino, costo, fecha_serv);

            control.crearServicio(serv);
            response.sendRedirect("service.jsp");

            //Eliminacion
        } else if (id != null && edit == null) {
            int nid = Integer.parseInt(id);
            control.eliminarServicio(nid);
            request.getSession().setAttribute("listaServicios", control.listarServicios());
            response.sendRedirect("service.jsp");
        } else if (id != null && edit != null) {
            //Modificacion
            int nid = Integer.parseInt(id);
            Servicio servicio = control.listarServicio(nid);

            HttpSession mysession = request.getSession();
            mysession.setAttribute("servicio", servicio);

            response.sendRedirect("eservice.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
