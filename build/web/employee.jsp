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
            if (usuario == "invalido") {
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
                                <%  int id = emp.getId_persona();
                                    String dni = emp.getDni();
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
                        <form action="svEmpleado" method="post">
                            <input type="hidden" name="id" value="<%=id%>">
                            <input type="hidden" name="edit" value="edit">
                            <td><button type="submit" name="eeform" id="eeform">Editar</button></td>
                        </form>
                        <form action="svEmpleado" method="post">
                            <input type="hidden" name="id" value="<%=id%>">
                            <td><button type="submit" name="deform" id="deform">Eliminar</button></td>
                        </form>
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
            <form action="svEmpleado" method="post">
                <div class="table-cont" id="new-element">
                    <div class="new-element-head">
                        <table>
                            <tr>
                                <th>EMPLEADO</th>
                            </tr>
                            <tr>
                                <td>
                                    <input class="new" type="text" name="name">
                                    <input class="new" type="text" name="lastname">
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
                                <td><input class="new" type="text" name="dni" required></td>
                                <td><input class="new" type="date" name="birth" required></td>
                                <td><input class="new" type="text" name="address" required></td>
                                <td><input class="new" type="email" name="email" required></td>
                                <td><input class="new" type="text" name="phone" required></td>
                                <td><input class="new" type="text" name="nac" required></td>
                                <td><input class="new" type="text" name="pos" required></td>
                                <td><input class="new" type="text" name="salary" required></td>
                                <td><input id="send" type="submit" name="crearEmpleado" value="+"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>
            <div class="table-cont" id="cont-user">
                <button type="button" id="user" onclick="capaEmployee('user')">Alta Usuario</button>
            </div>
            <div class="new-element-second" id="new-user">
                <table>
                    <tr>
                        <th>USUARIO</th>
                        <th>CONTRASEÑA</th>
                        <th>AGREGAR</th>
                    </tr>
                    <tr>
                    <form action="svUser" method="post">
                        <td><input class="new" type="text" name="new-user" required></td>
                        <td><input class="new" type="password" name="new-pass" required></td>
                        <td><input id="send" type="submit" name="crearEmpleado" value="+"></td>
                    </form>
                    </tr>
                </table>
            </div>
            <!--</form>-->
        </section>
        <%}%>
    </body>

</html>
