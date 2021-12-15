<%@page import="java.util.Date"%>
<%@page import="logica.Venta"%>
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
            <a href="order.jsp" style="background-color: rgb(38,37,35)">Orden</a>
        </nav>
        <section>
            <div class="cape">
                <input type="text" name="search" id="search" placeholder="Ingrese nro de venta">
                <button type="button" name="soform" id="soform" onclick="capaOrder('soform')">Buscar</button>
                <button type="button" name="noform" id="noform" onclick="capaOrder('noform')">+</button>
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
                                List<Venta> listaVentas = control.listarVentas();
                                if (!listaVentas.isEmpty()) {
                                    for (Venta venta : listaVentas) { %>
                            <tr>
                                <% String nombre = venta.getEmpleado().getNombre() 
                                        + " " + venta.getEmpleado().getApellido();%>
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
                                <th>NRO VENTA</th>
                                <th>CLIENTE </th>
                                <th>MODO DE PAGO</th>
                                <th>FECHA DE VENTA</th>
                                <th>SERVICIOS</th>
                                <th>PAQUETE NRO</th>
                                <th>EDITAR</th>
                                <th>ELIMINAR</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (!listaVentas.isEmpty()) {
                                    for (Venta venta : listaVentas) { %>
                            <tr>
                                <%  int nro = venta.getNum_venta();
                                    String empleado = venta.getEmpleado().getNombre() 
                                            + " " + venta.getEmpleado().getApellido();
                                    String pago = venta.getModo_pago();
                                    Date f_vent = venta.getFecha_venta();
                                    String servicio = venta.getServicio().getNombre();
                                    int paquete = venta.getPaquete().getCod_paquete();
                                %>
                                <td><%=nro%></td>
                                <td><%=empleado%></td>
                                <td><%=pago%></td>
                                <td><%=f_vent%></td>
                                <td><%=servicio%></td>
                                <td><%=paquete%></td>
                                <td><button type="button" name="eoform" id="eoform" onclick="capaOrder('eoform')">Editar</button></td>
                                <td><button type="button" name="doform" id="doform" onclick="capaOrder('doform')">Eliminar</button></td>
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
            <form action="" method="" >
                <div class="table-cont" id="new-element">
                    <div class="new-element-head">
                        <table>
                            <tr>
                                <th>EMPLEADO</th>
                            </tr>
                            <tr>
                                <td>
                                    <input class="new" type="text" name="new-empleado">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="new-element-body">
                        <table>
                            <tr>
                                <th>NRO VENTA</th>
                                <th>CLIENTE</th>
                                <th>MODO DE PAGO</th>
                                <th>FECHA DE VENTA</th>
                                <th>SERVICIO</th>
                                <th>NRO PAQUETE</th>
                                <th>AGREGAR</th>
                            </tr>
                            <tr>
                                <td><input class="new" type="number" name="new-nro_venta"></td>
                                <td><input class="new" type="text" name="new-cliente"></td>
                                <td><input class="new" type="text" name="new-pago""></td>
                                <td><input class="new" type="date" name="new-f_venta"></td>
                                <td><input class="new" type="text" name="new-servicio"></td>
                                <td><input class="new" type="number" name="new-nro paquete"></td>
                                <td><input id="send" type="submit" name="crearVenta" value="+"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>
        </section>
    </body>

</html>
