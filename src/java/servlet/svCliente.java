package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Cliente;
import logica.Controladora;

public class svCliente extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Parametro Eliminacion
        String id = request.getParameter("id");
        //Parametro Modificacion
        String edit = request.getParameter("edit");

        if (id == null && !edit.equals("edit")) {
            //Parametros Alta
            String dni = request.getParameter("dni");
            String nombre = request.getParameter("name");
            String apellido = request.getParameter("lastname");
            String direccion = request.getParameter("address");
            String telefono = request.getParameter("phone");
            String email = request.getParameter("email");
            String nacionalidad = request.getParameter("nac");
            Date nacimiento = Date.valueOf(request.getParameter("birth"));

            //Alta
            Cliente cli = new Cliente(dni, nombre, apellido, direccion, telefono,
                    email, nacionalidad, nacimiento);

            control.crearCliente(cli);
            response.sendRedirect("client.jsp");

            //Eliminacion
        } else if (id != null && !edit.equals("edit")) {
            int nid = Integer.parseInt(id);
            control.eliminarCliente(nid);
            request.getSession().setAttribute("listaClientes", control.listarClientes());
            response.sendRedirect("client.jsp");
        } else if (id != null && edit.equals("edit")) {
            //Modificacion
            System.out.println("estamos en zona");
//            int nid = Integer.parseInt(id);
//            Cliente cliente = control.listarCliente(nid);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
