<%@page import="java.util.Date"%>
<%@page import="logica.Servicio"%>
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
            <a href="service.jsp" style="background-color: rgb(38,37,35)">Servicio</a>
            <a href="package.jsp">Paquete Turistico</a>
            <a href="sell.jsp">Ventas</a>
        </nav>
        <section>
            <div class="cape">
                <input type="text" name="search" id="search" placeholder="Ingrese NRO">
                <button type="button" onclick="show('search-table')">Buscar</button>
                <button type="button" onclick="show('new-element')">+</button>
            </div>
            <!--LECTURA-->
            <div class="table-cont" id="search-table">
                <div class="search-table-head">
                    <table>
                        <thead>
                            <tr>
                                <th>SERVICIO</th>
                            </tr>
                        </thead>    
                        <tbody>
                            <%  Controladora control = new Controladora();
                                List<Servicio> listaServicios = control.listarServicios();
                                if (!listaServicios.isEmpty()) {
                                    for (Servicio serv : listaServicios) { %>
                            <tr>
                                <% String nombre_serv = serv.getNombre();%>
                                <td id="name"><%=nombre_serv%></td>
                                <%}
                                } else {%>
                                <td id="name">No hay datos</td>
                                <%}%>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="search-table-body">
                    <table>
                        <thead>
                            <tr>
                                <th>DESCRIPCION</th>
                                <th>DESTINO</th>
                                <th>COSTO</th>
                                <th>FECHA_SERVICIO</th>
                                <th>EDITAR</th>
                                <th>ELIMINAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (!listaServicios.isEmpty()) {
                                    for (Servicio serv : listaServicios) { %>
                            <tr>
                                <%  int id = serv.getCod_servicio();
                                    String descripcion = serv.getDescripcion();
                                    String destino = serv.getDestino();
                                    float costo = serv.getCosto_servicio();
                                    Date f_serv = serv.getFecha_servicio();
                                %>
                                <td id="desc"><%=descripcion%></td>
                                <td id="dest"><%=destino%></td>
                                <td id="cost"><%=costo%></td>
                                <td id="f_serv"><%=f_serv%></td>
                        <form action="svService" method="post">
                            <input type="hidden" name="id" id="nid" value="<%=id%>">
                            <input type="hidden" name="edit" value="edit">
                            <td><button type="submit" id="ede">Editar</button></td>
                        </form>
                        <!--BAJA-->
                        <form action="svService" method="post">
                            <input type="hidden" name="id" value="<%=id%>">
                            <td><button type="submit" id="eli">Eliminar</button></td>
                        </form>
                        <!--BAJA-->
                        <%}
                        } else {%>
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
            <form action="svService" method="post">
                <div class="table-cont" id="new-element">
                    <div class="new-element-head">
                        <table>
                            <tr>
                                <th>SERVICIO</th>
                            </tr>
                            <tr>
                                <td>
                                    <select name="s_name">
                                        <option class="new" type="text" value="Hotel por noche/s">
                                            Hotel por noche/s
                                        </option>
                                        <option class="new" type="text" value="Alquiler de Auto">
                                            Alquiler de Auto
                                        </option>
                                        <option class="new" type="text" value="Pasaje Omnibus">
                                            Pasaje Omnibus
                                        </option>
                                        <option class="new" type="text" value="Pasaje Avion">
                                            Pasaje Avion
                                        </option>
                                        <option class="new" type="text" value="Pasaje Tren">
                                            Pasaje Tren
                                        </option>
                                        <option class="new" type="text" value="Excursiones">
                                            Excursiones
                                        </option>
                                        <option class="new" type="text" value="Ticket Eventos">
                                            Ticket Eventos
                                        </option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="new-element-body">
                        <table>
                            <tr>
                                <th>DESCRIPCION</th>
                                <th>DESTINO</th>
                                <th>COSTO</th>
                                <th>FECHA_SERVICIO</th>
                                <th>AGREGAR</th>
                            </tr>
                            <tr>
                                <td><input class="new" type="text" name="desc" required></td>
                                <td><input class="new" type="text" name="dest" required></td>
                                <td><input class="new" type="text" name="cost" required></td>
                                <td><input class="new" type="date" name="f_serv" required></td>
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
