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
            <input type="text" name="search" id="search">
            <button type="button" name="seform" id="seform" onclick="capaEmployee('seform')">Buscar</button>
            <button type="button" name="neform" id="neform" onclick="capaEmployee('neform')">+</button>
            <!--<button type="button" name="eeform" id="eeform" onclick="capaEmployee('eeform')">Editar</button>-->
            <!--<button type="button" name="deform" id="deform" onclick="capaEmployee('deform')">Eliminar</button>-->
        </div>
        <form action="" method="" id="form">
            <div class="contain">
                <h3 id="separator">Empleado:</h3>
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
            <input id="send" type="button" name="crearCliente" onclick="crearCliente()" value="Agregar">
        </form>
    </section>
</body>

</html>

