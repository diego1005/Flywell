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
        <%  session.invalidate();
            }%>
        
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
        <section>
            <form action="svUser" method="post">
                <div class="login">
                    <input type="text" id="usuario" name="user" placeholder="Usuario" required>
                    <input type="password" id="pass" name="pass" placeholder="Contraseña" required>
                    <input type="submit" id="btn_login" value="Login">
                    <p>ó</p>
                    <input type="button" id="btn_reg" onclick="location.href = 'employee.jsp'" 
                           value="Alta Empleado"><br>
                </div>
            </form>
        </section>
    </body>

</html>

