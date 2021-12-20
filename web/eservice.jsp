<%@page import="logica.Servicio"%>
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
            <a href="service.jsp" style="background-color: rgb(38,37,35)">Servicio</a>
            <a href="package.jsp">Paquete Turistico</a>
            <a href="sell.jsp">Ventas</a>
        </nav>
        <section>
            <!--MODIFICACION-->
            <form action="svService" method="get">
                <%
                    Servicio serv = (Servicio) mysession.getAttribute("servicio");
                %>
                <div class="table-cont-edit">
                    <div class="new-element-head">
                        <table>
                            <tr>
                                <th>SELECCIONADO</th>
                                <th>SERVICIO</th>
                            </tr>
                            <tr>
                                <td><h4><%=serv.getNombre()%></h4></td>
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
                                <th>MODIFICAR</th>
                            </tr>
                            <tr>
                            <input type="hidden" name="id" value="<%=serv.getCod_servicio()%>">
                            <td><input class="new" type="text" name="desc" value="<%=serv.getDescripcion()%>" required></td>
                            <td><input class="new" type="text" name="dest" value="<%=serv.getDestino()%>" required></td>
                            <td><input class="new" type="text" name="cost" value="<%=serv.getCosto_servicio()%>" required></td>
                            <td><input class="new" type="date" name="f_serv" value="<%=serv.getFecha_servicio()%>" required></td>
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