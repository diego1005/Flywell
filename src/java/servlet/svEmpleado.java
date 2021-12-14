package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("name");
        String apellido = request.getParameter("lastname");
        String direccion = request.getParameter("address");
        String telefono = request.getParameter("phone");
        String email = request.getParameter("email");
        String nacionalidad = request.getParameter("nac");
        String nacimiento = request.getParameter("birth");
        SimpleDateFormat f_nac = new SimpleDateFormat("dd/mm/yyyy");
        Date f_nacim = new Date();
        try {
            f_nacim = f_nac.parse(nacimiento);
        } catch (ParseException ex) {
        }
        String cargo = request.getParameter("pos");
        float sueldo = Float.parseFloat(request.getParameter("salary"));
        
        Empleado emp = new Empleado(0, cargo, sueldo, dni, nombre, apellido, direccion, telefono, email, nacionalidad, f_nacim);
        
        control.crearEmpleado(emp);
        response.sendRedirect("employee.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}