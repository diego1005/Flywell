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
            <a href="employee.jsp">Empleado</a>
            <a href="order.jsp">Orden</a>
        </nav>
        <section>
            <div class="cape">
                <input type="text" name="search" id="search" placeholder="Ingrese DNI">
                <button type="button" name="scform" id="seform" onclick="capaEmployee('seform')">Buscar</button>
                <button type="button" name="ncform" id="neform" onclick="capaEmployee('neform')">+</button>
            </div>
            <form action="svEmpleado" method="post" id="form">
                <div class="contain">
                    <div class="content">
                        <div class="field">
                            <label for="name">Nombre:</label><br>
                            <input type="text" name="name" required>
                            <label for="lastname">Apellido:</label>
                            <input type="text" name="lastname" required>
                            <label for="dni">DNI:</label>
                            <input type="text" name="dni" required>
                        </div>
                        <div class="field">
                            <label for="address">Direccion:</label>
                            <input type="text" name="address" required>
                            <label for="phone">Telefono:</label>
                            <input type="text" name="phone" required>
                            <label for="email">E-Mail:</label>
                            <input type="text" name="email" required>
                        </div>
                        <div class="field">
                            <label for="nac">Nacionalidad:</label>
                            <input type="text" name="nac" required>
                            <label for="birth">Fecha de Nac.:</label>
                            <input type="date" name="birth" required>
                        </div>
                    </div>
                </div>
                <input id="send" type="submit" name="crearEmpleado" value="Agregar">
            </form>

            <div class="search-table-cont" id="search-table">
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
                                <%}}else{%>
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
                                <th>EDITAR</th>
                                <th>ELIMINAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  if (!listaEmpleados.isEmpty()) {
                                    for (Empleado emp : listaEmpleados) { %>
                            <tr>
                                <%  String dni = emp.getDni();
                                    Date f_nac = emp.getFecha_nac();
                                    String direccion = emp.getDireccion();
                                    String email = emp.getEmail();
                                    String tel = emp.getCelular();
                                    String nacion = emp.getNacionalidad();
                                %>
                                <td><%=dni%></td>
                                <td><%=f_nac%></td>
                                <td><%=direccion%></td>
                                <td><%=email%></td>
                                <td><%=tel%></td>
                                <td><%=nacion%></td>
                                <td><button type="button" name="ecform" id="eeform" onclick="capaEmployee('eeform')">Editar</button></td>
                                <td><button type="button" name="dcform" id="deform" onclick="capaEmployee('deform')">Eliminar</button></td>
                                <%}}else{%>
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
        </section>
    </body>

</html>
