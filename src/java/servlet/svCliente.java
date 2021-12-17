package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Cliente;
import logica.Controladora;

public class svCliente extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("name");
        String apellido = request.getParameter("lastname");
        String direccion = request.getParameter("address");
        String telefono = request.getParameter("phone");
        String email = request.getParameter("email");
        String nacionalidad = request.getParameter("nac");
        Date nacimiento = Date.valueOf(request.getParameter("birth"));
        
        Cliente cli = control.listarCliente(id);
        
        cli.setDni(dni);
        cli.setNombre(nombre);
        cli.setApellido(apellido);
        cli.setDireccion(direccion);
        cli.setCelular(telefono);
        cli.setEmail(email);
        cli.setNacionalidad(nacionalidad);
        cli.setFecha_nac(nacimiento);

        control.editarCliente(cli);
        request.getSession().setAttribute("listaClientes", control.listarClientes());

        response.sendRedirect("client.jsp");

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
        } else if (id != null && edit == null) {
            int nid = Integer.parseInt(id);
            control.eliminarCliente(nid);
            request.getSession().setAttribute("listaClientes", control.listarClientes());
            response.sendRedirect("client.jsp");
        } else if (id != null && edit != null) {
            //Modificacion
            int nid = Integer.parseInt(id);
            Cliente cliente = control.listarCliente(nid);
            
            HttpSession mysession = request.getSession();
            mysession.setAttribute("cliente", cliente);

            response.sendRedirect("eclient.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
