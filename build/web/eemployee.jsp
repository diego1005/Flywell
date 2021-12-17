<%@page import="logica.Empleado"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="logica.Controladora"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width" initial-scale="1.0">
        <title>Flywell</title>
        <link rel="stylesheet" href="./assets/css/estilos.css">
        <script type="text/javascript" src="./assets/js/funct.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap" rel="stylesheet">
    </head>

    <body>

        <%
            HttpSession mysession = request.getSession();
            String usuario = (String) mysession.getAttribute("usuario");
            if (usuario == null) {
        %>
        <script>
            alert("Usuario incorrecto");
        </script>
        <%    response.sendRedirect("login.jsp");
        } else {
        %>

        <header>
            <div class="header-left">
                <img src="./assets/img/logo.png" alt="logo">
            </div>
            <div class="header-right">
                <nav class="main-menu">
                    <a href="index.jsp">Home</a>
                    <a href="operations.jsp">Operaciones</a>
                    <a href="contact.jsp">Contacto</a>
                    <a href="login.jsp">Login</a>
                </nav>
            </div>
        </header>
        <nav class="lower-menu">
            <a href="client.jsp">Cliente</a>
            <a href="employee.jsp" style="background-color: rgb(38,37,35)">Empleado</a>
            <a href="order.jsp">Orden</a>
        </nav>
        <section>
            <!--MODIFICACION-->
            <form action="svEmpleado" method="get">
                <%
                    Empleado emp = (Empleado) mysession.getAttribute("empleado");
                %>
                <div class="table-cont-edit">
                    <div class="new-element-head">
                        <table>
                            <tr>
                                <th>EMPLEADO</th>
                            </tr>
                            <tr>
                                <td>
                                    <input class="new-head" type="text" name="name" 
                                           placeholder="Nombre" value="<%=emp.getNombre()%>" required>
                                    <input class="new-head" type="text" name="lastname" 
                                           placeholder="Apellido" value="<%=emp.getApellido()%>" required="">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="new-element-body">
                        <table>
                            <tr>
                                <th>DNI</th>
                                <th>FECHA DE NACIMIENTO</th>
                                <th>DIRECCION</th>
                                <th>EMAIL</th>
                                <th>TELEFONO</th>
                                <th>NACIONALIDAD</th>
                                <th>CARGO</th>
                                <th>SUELDO</th>
                                <th>MODIFICAR</th>
                            </tr>
                            <tr>
                                <input type="hidden" name="id" value="<%=emp.getId_persona()%>">
                                <td><input class="new" type="text" name="dni" value="<%=emp.getDni()%>" required></td>
                                <td><input class="new" type="date" name="birth" value="<%=emp.getFecha_nac()%>" required></td>
                                <td><input class="new" type="text" name="address" value="<%=emp.getDireccion()%>" required></td>
                                <td><input class="new" type="email" name="email" value="<%=emp.getEmail()%>" required></td>
                                <td><input class="new" type="text" name="phone" value="<%=emp.getCelular()%>" required></td>
                                <td><input class="new" type="text" name="nac" value="<%=emp.getNacionalidad()%>" required></td>
                                <td><input class="new" type="text" name="poss" value="<%=emp.getCargo()%>" required></td>
                                <td><input class="new" type="text" name="salary" value="<%=emp.getSueldo()%>" required></td>
                                <td><input id="send" type="submit" value="+"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>
        </section>
        <%}%>
    </body>

</html>
