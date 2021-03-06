<%@page import="logica.Servicio"%>
<%@page import="java.util.Date"%>
<%@page import="logica.PaqueteTuristico"%>
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
            <a href="service.jsp">Servicio</a>
            <a href="package.jsp" style="background-color: rgb(38,37,35)">Paquete Turistico</a>
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
                                <th>SERVICIOS</th>
                            </tr>
                        </thead>    
                        <tbody>
                            <%  Controladora control = new Controladora();
                                List<PaqueteTuristico> listaPaquetes = control.listarPaquetesTuristicos();
                                List<Servicio> listaServEnPaq = null;
                                if (!listaPaquetes.isEmpty()) {
                                    for (PaqueteTuristico paq : listaPaquetes) { %>
                            <tr>
                                <% listaServEnPaq = paq.getListaServicios();
                                    String nombre_serv = "";
                                    for (Servicio serv : listaServEnPaq) {
                                        nombre_serv = serv.getNombre();
                                    }
                                %>
                                <td><%=nombre_serv%></td>
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
                                <th>COSTO DEL PAQUETE</th>
                                <th>EDITAR</th>
                                <th>ELIMINAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (!(listaPaquetes.isEmpty())) {
                                    for (PaqueteTuristico paq : listaPaquetes) { %>
                            <tr>
                                <%  int id = paq.getCod_paquete();
                                    float costo_paq = paq.getCosto_paquete();%>
                                <td name="costoPaq"><%=costo_paq%></td>
                        <form action="svService" method="post">
                            <input type="hidden" name="id" id="nid" value="<%=id%>">
                            <input type="hidden" name="edit" value="edit">
                            <td><button type="submit" id="edi">Editar</button></td>
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
                        <%}%>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--ALTA-->
            <form action="svPackage" method="post">
                <div class="table-paq-cont" id="new-element">
                    <div class="new-element-paq-head">
                        <table>
                            <tr>
                                <th>SERVICIO</th>
                            </tr>
                            <tr>
                                <%
                                    List<Servicio> listaServ = control.listarServicios();
                                    for (Servicio serv : listaServ) {
                                        int idS = serv.getCod_servicio();
                                        String nombre_serv = serv.getNombre();
                                        String dest_serv = serv.getDestino();
                                        float costo_serv = serv.getCosto_servicio();
                                %>
                                <td class="checklist">
                                    <input type="checkbox" name="listServ" value="<%=idS%>" style="display:none" readonly />
                                </td>
                                 <td><input type="checkbox" name="nombreServ" value="<%=nombre_serv%>" /></td>
                                <td><input type="hidden" name="costoServ" value="<%=costo_serv%>" /></td>
                            </tr>
                        </table>
                    </div>
                    <div class="new-element-paq-body">
                        <table>
                            <tr>
                                <th>DESTINO</th>
                                <th>COSTO SERVICIO</th>
                            </tr>
                            <tr>
                                <td id="dest"><%=dest_serv%></td>
                                <td id="cost"><%=costo_serv%></td>
                            </tr>
                        </table>
                        <%}%>
                        <h3></h3>
                        <td><input id="sendPaq" type="submit" value="AGREGAR"></td>
                    </div>
                </div>
            </form>
        </section>
        <%}%>
    </body>

</html>
