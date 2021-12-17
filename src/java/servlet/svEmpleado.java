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
import logica.Controladora;
import logica.Empleado;

public class svEmpleado extends HttpServlet {

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
        String cargo = request.getParameter("pos");
        float sueldo = Float.parseFloat(request.getParameter("salary"));

        Empleado emp = control.listarEmpleado(id);

        emp.setDni(dni);
        emp.setNombre(nombre);
        emp.setApellido(apellido);
        emp.setDireccion(direccion);
        emp.setCelular(telefono);
        emp.setEmail(email);
        emp.setNacionalidad(nacionalidad);
        emp.setFecha_nac(nacimiento);
        emp.setCargo(cargo);
        emp.setSueldo(sueldo);

        control.editarEmpleado(emp);
        request.getSession().setAttribute("listaEmpleados", control.listarEmpleados());

        response.sendRedirect("employee.jsp");

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
            String cargo = request.getParameter("pos");
            float sueldo = Float.parseFloat(request.getParameter("salary"));

            //Alta
            Empleado emp = new Empleado(cargo, sueldo, dni, nombre, apellido, direccion,
                    telefono, email, nacionalidad, nacimiento);

            control.crearEmpleado(emp);
            response.sendRedirect("employee.jsp");

            //Eliminacion
        } else if (id != null && edit == null) {
            int nid = Integer.parseInt(id);
            control.eliminarEmpleado(nid);
            request.getSession().setAttribute("listaEmpleados", control.listarEmpleados());
            response.sendRedirect("employee.jsp");
        } else if (id != null && edit != null) {
            //Modificacion
            int nid = Integer.parseInt(id);
            Empleado empleado = control.listarEmpleado(nid);

            HttpSession mysession = request.getSession();
            mysession.setAttribute("empleado", empleado);

            response.sendRedirect("eemployee.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
