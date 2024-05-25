<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%@include file="Menu.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
    <title>login y registro</title>

</head>  <!-- JEJEJEJEJEJEEEEEEEEEEEE  OJOJOJOJO-->

<body>

    <div class="LOGIN">
        <div class="container" id="container">
            <div class="form-container sign-up">
                <form action="Login?action=registrarse" method="post">
                    <h1>Registrate</h1>
                    <div class="social-icons">
                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                    <span>o usa tu correo para registrarte</span>
                    <input type="text" placeholder="Name" name="name">
                    <input type="email" placeholder="Email" name="email">
                    <input type="password" placeholder="Password" name="password">
                    <button>Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in">
                <form action="Login?action=login" method="post">
                    <h1>Login</h1>
                    <div class="social-icons">
                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                    <span>o usa tu correo para registrarte</span>
                    <input type="email" placeholder="Email" name="email">
                    <input type="password" placeholder="Password" name="password">
                    <a href="#">¿Eres administrador?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h1>Welcome Back!</h1>
                        <p>Enter your personal details to use all of site features</p>
                        <button class="hidden" id="login">Login</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Hello, Friend!</h1>
                        <p>Register with your personal details to use all of site features</p>
                        <button class="hidden" id="register">Registrarse</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const container = document.getElementById('container');
        const registerBtn = document.getElementById('register');
        const loginBtn = document.getElementById('login');

       registerBtn.addEventListener('click', () => {
         container.classList.add("active");
    });

        loginBtn.addEventListener('click', () => {
        container.classList.remove("active");
    });
    </script>
    <script>
    <% String error = (String) request.getAttribute("error");
       String success = (String) request.getAttribute("success");
    if (error != null && !error.isEmpty()) { %>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: '<%= error %>',
            timer: 4000,
            timerProgressBar: true,
            showConfirmButton: false
        }).then((result) => {
        });
    <% }else if (success != null && !success.isEmpty()) { %>
        Swal.fire({
            icon: 'success',
            title: 'Hecho',
            text: '<%= success %>',
            timer: 4000,
            timerProgressBar: true,
            showConfirmButton: false
        }).then((result) => {
        });
    <% } %>
</script>

</body>
<%@include file="Footer.jsp"%>
</html>

