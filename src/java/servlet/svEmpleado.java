package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Empleado;

public class svEmpleado extends HttpServlet {

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

        String id = request.getParameter("id");
        if (id == null) {
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

            Empleado emp = new Empleado(cargo, sueldo, dni, nombre, apellido, direccion,
                    telefono, email, nacionalidad, nacimiento);

            control.crearEmpleado(emp);
            response.sendRedirect("employee.jsp");
        } else {
            int nid = Integer.parseInt(id);
            control.eliminarEmpleado(nid);
            request.getSession().setAttribute("listaEmpleados", control.listarEmpleados());
            response.sendRedirect("employee.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
