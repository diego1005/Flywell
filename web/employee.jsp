<%@page import="logica.Controladora"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Empleado"%>
<%@page import="java.util.List"%>
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
            <div class="cape">
                <input type="text" name="search" id="search" placeholder="Ingrese DNI">
                <button type="button" name="seform" id="seform" onclick="capaEmployee('seform')">Buscar</button>
                <button type="button" name="neform" id="neform" onclick="capaEmployee('neform')">+</button>
            </div>
            <div class="table-cont" id="search-table">
                <div class="search-table-head">
                    <table>
                        <thead>
                            <tr>
                                <th>EMPLEADO</th>
                            </tr>
                        </thead>    
                        <tbody>
                            <%  Controladora control = new Controladora();
                                List<Empleado> listaEmpleados = control.listarEmpleados();
                                if (!listaEmpleados.isEmpty()) {
                                    for (Empleado emp : listaEmpleados) { %>
                            <tr>
                                <% String nombre = emp.getNombre() + " " + emp.getApellido();%>
                                <td><%=nombre%></td>
                                <%}
                                } else {%>
                                <td>No hay datos</td>
                                <%}%>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="search-table-body">
                    <table>
                        <thead>
                            <tr>
                                <th>DNI</th>
                                <th>FECHA DE NACIMIENTO</th>
                                <th>DIRECCION</th>
                                <th>EMAIL</th>
                                <th>TELEFONO</th>
                                <th>NACIONALIDAD</th>
                                <th>CARGO</th>
                                <th>SUELDO</th>
                                <th>EDITAR</th>
                                <th>ELIMINAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (!listaEmpleados.isEmpty()) {
                                    for (Empleado emp : listaEmpleados) { %>
                            <tr>
                                <%  String dni = emp.getDni();
                                    Date f_nac = emp.getFecha_nac();
                                    String direccion = emp.getDireccion();
                                    String email = emp.getEmail();
                                    String tel = emp.getCelular();
                                    String nacion = emp.getNacionalidad();
                                    String cargo = emp.getCargo();
                                    float sueldo = emp.getSueldo();
                                %>
                                <td><%=dni%></td>
                                <td><%=f_nac%></td>
                                <td><%=direccion%></td>
                                <td><%=email%></td>
                                <td><%=tel%></td>
                                <td><%=nacion%></td>
                                <td><%=cargo%></td>
                                <td><%=sueldo%></td>
                                <td><button type="button" name="eeform" id="eeform" onclick="capaEmployee('eeform')">Editar</button></td>
                                <td><button type="button" name="deform" id="deform" onclick="capaEmployee('deform')">Eliminar</button></td>
                                <%}
                                } else {%>
                                <td>No hay datos</td>
                                <td>No hay datos</td>
                                <td>No hay datos</td>
                                <td>No hay datos</td>
                                <td>No hay datos</td>
                                <td>No hay datos</td>
                                <td>No hay datos</td>
                                <td>No hay datos</td>
                                <%}%>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <form action="" method="" >
                <div class="table-cont" id="new-element">
                    <div class="new-element-head">
                        <table>
                            <tr>
                                <th>EMPLEADO</th>
                            </tr>
                            <tr>
                                <td>
                                    <input class="new" type="text" name="new-nombre">
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
                            </tr>
                            <tr>
                                <td><input class="new" type="text" name="new-dni" required></td>
                                <td><input class="new" type="date" name="new-birth" required></td>
                                <td><input class="new" type="text" name="new-address" required></td>
                                <td><input class="new" type="email" name="new-email" required></td>
                                <td><input class="new" type="text" name="new-phone" required></td>
                                <td><input class="new" type="text" name="new-nac" required></td>
                                <td><input class="new" type="text" name="new-pos" required></td>
                                <td><input class="new" type="text" name="new-salary" required></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="new-element-second" id="new-user">
                    <table>
                        <tr>
                            <th>USUARIO</th>
                            <th>CONTRASEÑA</th>
                            <th>AGREGAR</th>
                        </tr>
                        <tr>
                            <td><input class="new" type="text" name="new-user" required></td>
                            <td><input class="new" type="password" name="new-pass" required></td>
                            <td><input id="send" type="submit" name="crearEmpleado" value="+"></td>
                        </tr>
                    </table>
                </div>
            </form>
        </section>
        <%}%>
    </body>

</html>
