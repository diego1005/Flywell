<%@page import="java.util.Date"%>
<%@page import="logica.Cliente"%>
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
            <a href="client.jsp" style="background-color: rgb(38,37,35)">Cliente</a>
            <a href="employee.jsp">Empleado</a>
            <a href="order.jsp">Orden</a>
        </nav>
        <section>
            <div class="cape">
                <input type="text" name="search" id="search" placeholder="Ingrese DNI">
                <button type="button" name="scform" id="scform" onclick="show('search-table')">Buscar</button>
                <button type="button" name="ncform" id="ncform" onclick="show('new-element')">+</button>
            </div>
            <!--LECTURA-->
            <div class="table-cont" id="search-table">
                <div class="search-table-head">
                    <table>
                        <thead>
                            <tr>
                                <th>CLIENTE</th>
                            </tr>
                        </thead>    
                        <tbody>
                            <%  Controladora control = new Controladora();
                                List<Cliente> listaClientes = control.listarClientes();
                                if (!listaClientes.isEmpty()) {
                                    for (Cliente cli : listaClientes) { %>
                            <tr>
                                <% String nombre = cli.getNombre() + " " + cli.getApellido();%>
                                <td id="cname"><%=nombre%></td>
                                <%}
                                    } else {%>
                                <td id="clast">No hay datos</td>
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
                            <% if (!listaClientes.isEmpty()) {
                                        for (Cliente cli : listaClientes) { %>
                            <tr>
                                <%  int id = cli.getId_persona();
                                    String dni = cli.getDni();
                                    Date f_nac = cli.getFecha_nac();
                                    String direccion = cli.getDireccion();
                                    String email = cli.getEmail();
                                    String tel = cli.getCelular();
                                    String nacion = cli.getNacionalidad();
                                %>
                                <td id="cdni"><%=dni%></td>
                                <td id="cfnac"><%=f_nac%></td>
                                <td id="cdir"><%=direccion%></td>
                                <td id="cmail"><%=email%></td>
                                <td id="ctel"><%=tel%></td>
                                <td id="cnac"><%=nacion%></td>
                        <form action="svCliente" method="post">
                            <input type="hidden" name="id" id="nid" value="<%=id%>">
                            <input type="hidden" name="edit" value="edit">
                            <td><button type="submit" name="ecform" id="ecform">Editar</button></td>
                        </form>
                        <!--BAJA-->
                        <form action="svCliente" method="post">
                            <input type="hidden" name="id" value="<%=id%>">
                            <td><button type="submit" name="dcform" id="dcform">Eliminar</button></td>
                        </form>
                            <!--BAJA-->
                        <%}
                            } else {%>
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
                        <!--ALTA-->
            <form action="svCliente" method="post" >
                <div class="table-cont" id="new-element">
                    <div class="new-element-head">
                        <table>
                            <tr>
                                <th>CLIENTE</th>
                            </tr>
                            <tr>
                                <td>
                                    <input class="new-head" type="text" name="name" 
                                           placeholder="Nombre" required>
                                    <input class="new-head" type="text" name="lastname" 
                                           placeholder="Apellido" required="">
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
                                <th>AGREGAR</th>
                            </tr>
                            <tr>
                                <td><input class="new" type="text" name="dni" required></td>
                                <td><input class="new" type="date" name="birth" required></td>
                                <td><input class="new" type="text" name="address" required></td>
                                <td><input class="new" type="email" name="email" required></td>
                                <td><input class="new" type="text" name="phone" required></td>
                                <td><input class="new" type="text" name="nac" required></td>
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
