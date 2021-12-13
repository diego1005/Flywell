<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1.0">
    <title>Flywell</title>
    <link rel="stylesheet" href="./assets/css/style.css">
    <script type="text/javascript" src="./assets/js/app.js"></script>
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
                <a href="contact-jsp">Contacto</a>
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
            <!-- <button type="button" name="show-cli" id="show-cli" onclick="capaClient()">Nuevo Cliente</button> -->
        </div>
        <form action="" method="" id="form">
            <div class="contain">
                <h3 id="separator">Cliente:</h3>
                <div class="client-content">
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
            <hr>
            <div class="contain">
                <h3 id="separator">Destino:</h3>
                <div class="destiny-content">
                    <select class="destiny" name="destiny">
                        <option value="Argentina">Argentina</option>
                        <option value="Brasil">Brasil</option>
                        <option value="Uruguay">Uruguay</option>
                        <option value="Bolivia">Bolivia</option>
                        <option value="Paraguay">Paraguay</option>
                        <option value="Chile">Chile</option>
                    </select>
                </div>
            </div>
            <hr>
            <div class="contain">
                <h3 id="separator">Servicio:</h3>
                <div class="service-content">
                    <div class="field">
                        <input type="checkbox" name="hotel" required>
                        <label for="hotel">Reserva Hotel</label><br>
                        <input type="checkbox" name="rent-car" required>
                        <label for="rent-car">Alquiler Auto</label>
                    </div>
                    <div class="field">
                        <input type="checkbox" name="bus" required>
                        <label for="bus">Ticket Colectivo</label>
                        <input type="checkbox" name="plane" required>
                        <label for="plane">Ticket Avion</label>
                        <input type="checkbox" name="train" required>
                        <label for="train">Ticket Tren</label>
                    </div>
                    <div class="field">
                        <input type="checkbox" name="excursions" required>
                        <label for="excursions">Excursiones</label>
                        <input type="checkbox" name="events" required>
                        <label for="events">Ticket Eventos</label>
                    </div>
                </div>
            </div>
        </form>
    </section>
</body>

</html>
