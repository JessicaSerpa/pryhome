<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
           <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap">

    <link href="CSS/StyleMenu.css" rel="stylesheet"/>
    <title>Menu</title>

</head>
<body>
    <header>
        <div class="logo">
            <a href="#"><img src="Imagenes/TechStore.png" alt="Logo"/> </a> 
        </div>
        <nav>
            <ul>
                <li><a href="#" class="menu-toggle"><i class="fas fa-bars"></i> Menú</a></li>
            </ul>
        </nav>
        <div class="search-container">
            <input type="text" placeholder="¿Qué estás buscando?" class="search-input">
        </div>
        <div class="account-cart">
            <a href="login.jsp" class="account-link">
                <i class="fas fa-user"></i>
                <span>Mi Cuenta</span>
            </a>
            <a href="#" class="cart-link">
                <i class="fas fa-shopping-cart"></i>
                <span>Carrito</span>
            </a>
        </div>
    </header>
    
    <!-- Menú lateral -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <h2>¡Hola!</h2>
            <a href="#" class="close-btn" id="close-btn"><i class="fas fa-times"></i></a>
        </div>
        <ul>
            <li><a href="#"><i class="fa-solid fa-house"></i> Incio</a></li>
            <li><a href="#"><i class="fa-solid fa-tag"></i> Ofertas</a></li>
            <li><a href="#"><i class="fa-solid fa-desktop"></i> Computadoras</a></li>
            <li><a href="#"><i class="fa-solid fa-laptop"></i>Laptops</a></li>
            <li><a href="#"><i class="fa-solid fa-microchip"></i>Componentes </a></li>
            <li><a href="#"><i class="fa-solid fa-keyboard"></i>Perifericos</a></li>
             <li><a href="#"><i class="fa-solid fa-question"></i></i>Quienes Somos</a></li>
        </ul>
    </div>
    
    <!-- Overlay -->
    <div class="overlay" id="overlay"></div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const menuToggle = document.querySelector('.menu-toggle');
            const sidebar = document.getElementById('sidebar');
            const closeBtn = document.getElementById('close-btn');
            const overlay = document.getElementById('overlay');

            menuToggle.addEventListener('click', function() {
                sidebar.classList.add('sidebar-visible');
                overlay.classList.add('overlay-visible');
            });

            closeBtn.addEventListener('click', function() {
                sidebar.classList.remove('sidebar-visible');
                overlay.classList.remove('overlay-visible');
            });

            overlay.addEventListener('click', function() {
                sidebar.classList.remove('sidebar-visible');
                overlay.classList.remove('overlay-visible');
            });
        });
    </script>
</body>
</html>
