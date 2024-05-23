<%-- 
    Document   : Home
    Created on : 16 may 2024, 10:43:44 p.m.
    Author     : Giovanni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="CSS/StyleMenu.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
              <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
          <link href="CSS/StyleHome.css" rel="stylesheet" type="text/css"/>
          
        <title>Home</title>

    </head>
 <body>
    <div class="cabeza">
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
                    <span>Mi cuenta</span>
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

                overlay.addEventListener('click', function () {
                    sidebar.classList.remove('sidebar-visible');
                    overlay.classList.remove('overlay-visible');
                });
            });
        </script>
    </div>
     <div class ="cuerpo">
          <!-- 
           <div class="inicio">
            <h2 class="title">Inicio</h2>
            <p>
                orem aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
            </p>
            <a href="a" class="btn">Saber mas</a>
        </div> -->
      
          <div class="container-slider">
        <div class="slider" id="slider">
            <div class="slider__section">
                <img src="img/img1.jpg" alt="Lentes con nuevos diseños" class="slider__img">
              
                <div class="slider__content">
                    <h2 class="slider__title">Gafas</h2>
                    <p class="slider__txt">Con nuevos diseños</p>
                    <a href="#productSection" class="btn-shop" onclick="scrollToSection('productSection')">COMPRAR
                        AHORA</a>
                </div>
            </div>
            <div class="slider__section">
                <img src="img/img2.jpg" alt="" class="slider__img">
                <div class="slider__content">
                    <h2 class="slider__title">Lámparas</h2>
                    <p class="slider__txt">Con efectos novedosos</p>
                    <a href="#productSection" class="btn-shop" onclick="scrollToSection('productSection')">COMPRAR
                        AHORA</a>
                </div>
            </div>
            <div class="slider__section">
                <img src="img/img3.jpg" alt="" class="slider__img">
                <div class="slider__content">
                    <h2 class="slider__title">Gafas</h2>
                    <p class="slider__txt">Con efectos maravillosos</p>
                    <a href="#productSection" class="btn-shop" onclick="scrollToSection('productSection')">COMPRAR
                        AHORA</a>
                </div>
            </div>
            <div class="slider__section">
                <img src="img/img2.jpg" alt="" class="slider__img">
                <div class="slider__content">
                    <h2 class="slider__title">Lámparas</h2>
                    <p class="slider__txt">De neón para decorar</p>
                    <a href="#productSection" class="btn-shop" onclick="scrollToSection('productSection')">COMPRAR
                        AHORA</a>
                </div>
            </div>
        </div>
        <div class="slider__btn slider__btn--right" id="btn-right">&#62;</div>
        <div class="slider__btn slider__btn--left" id="btn-left">&#60;</div>
          <script>
        const slider = document.querySelector("#slider");
let sliderSection = document.querySelectorAll(".slider__section");
let sliderSectionLast = sliderSection[sliderSection.length - 1];

const btnLeft = document.querySelector("#btn-left");
const btnRight = document.querySelector("#btn-right");

slider.insertAdjacentElement('afterbegin', sliderSectionLast);

let intervalId;

function Next() {
    let sliderSectionFirst = document.querySelectorAll(".slider__section")[0];
    slider.style.marginLeft = "-200%";
    slider.style.transition = "all 0.5s";
    setTimeout(function(){
        slider.style.transition = "none";
        slider.insertAdjacentElement('beforeend', sliderSectionFirst);
        slider.style.marginLeft = "-100%";
    }, 500);
}

function Prev() {
    let sliderSection = document.querySelectorAll(".slider__section");
    let sliderSectionLast = sliderSection[sliderSection.length - 1];
    slider.style.marginLeft = "0";
    slider.style.transition = "all 0.5s";
    setTimeout(function(){
        slider.style.transition = "none";
        slider.insertAdjacentElement('afterbegin', sliderSectionLast);
        slider.style.marginLeft = "-100%";
    }, 500);
}

function restartInterval() {
    clearInterval(intervalId);
    intervalId = setInterval(function(){
        Next();
    }, 5000); 
}

btnRight.addEventListener('click', function(){
    Next();
    restartInterval();
});

btnLeft.addEventListener('click', function(){
    Prev();
    restartInterval();
});

intervalId = setInterval(function(){
    Next();
}, 3500);
</script>
    </div>
           
         <!-- aca acaba el slider -->
          <section class="content about">
         <h2 class="title">Nosotros</h2>
         <p>
             Lorem aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
         </p>
         <div class="box-container2">
             <div class="box">
                 <img src="img/pic1.jpg" alt=""/>
                 <h3>Lorem</h3>
                 <p>aaaaaaaaaaaaaaaaaaaaaaa</p>
                 <div class="stars">
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i><!-- <i class="fas fa-stars"></i> -->      
                 </div>
                 
             </div>
                          <div class="box">
                 <img src="img/pic2.jpg" alt=""/>
                 <h3>Lorem</h3>
                 <p>aaaaaaaaaaaaaaaaaaaaaaa</p>
                 <div class="stars">
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i><!-- <i class="fas fa-stars"></i> -->      
                 </div>
                 
             </div>
                          <div class="box">
                 <img src="img/pic3.jpg" alt=""/>
                 <h3>Lorem</h3>
                 <p>aaaaaaaaaaaaaaaaaaaaaaa</p>
                 <div class="stars">
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i><!-- <i class="fas fa-stars"></i> -->      
                 </div>
                 
             </div>
             
         </div>
         
         
     </section>
     
     
  <section class="content price">
      <div class="mission-vision">
        <article class="cortain">          
            <h2 class="title">Misión</h2>
            <p>Nuestra misión es proporcionar productos de alta calidad que mejoren la vida de nuestros clientes.</p>
                    <a href="#" class="btn">Saber precio</a>
        </article>

        <article class="cortain">          
            <h2 class="title">Visión</h2>
            <p>Nuestra visión es ser líderes en el mercado, reconocidos por nuestra innovación y compromiso con la excelencia.</p>
                    <a href="#" class="btn">Saber precio</a>
        </article>

        </div>
    </section>
         
        <section class="content sau">
            <h2 class="title">Productos</h2>
            <p>
                Lorem aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
            </p>
            
            <div class="box-container">              
                <div class="box">
                    <i class="fab fa-angular"></i>
                    <h3>Lorem</h3><!-- comment -->
                    <p>
                           Lorem aaaaaaaaaaaaaaaaa
                    </p>
                </div>
                
                    <div class="box">
                    <i class="fab fa-apple"></i>
                    <h3>Lorem</h3><!-- comment -->
                    <p>
                           Lorem aaaaaaaaaaaaaaaaa
                    </p>
                </div>
                
                                <div class="box">
                    <i class="fab fa-android"></i>
                    <h3>Lorem</h3><!-- comment -->
                    <p>
                           Lorem aaaaaaaaaaaaaaaaa
                    </p>
                </div>             
            </div>            
        </section>

<section class="content ubi">
    <h2 class="title">Ubicacion</h2>
    <div class="ubicacion">
        <div class="map-container">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.825198089173!2d-77.04054118851332!3d-12.055545242016718!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c8c69269e9b9%3A0x76b1eea571afda9f!2sWilson%20Plaza!5e0!3m2!1ses!2spe!4v1716275113660!5m2!1ses!2spe" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </div>
</section>
    
    <section class="footer-distributed">

        <div class="footer-left">
            <h3>Sagar<span>Developer</span></h3>

            <p class="footer-links">
                <a href="#">Home</a>
                |
                <a href="#">About</a>
                |
                <a href="#">Contact</a>
                |
                <a href="#">Blog</a>
            </p>

            <p class="footer-company-name">Copyright © 2021 <strong>SagarDeveloper</strong> All rights reserved</p>
        </div>

        <div class="footer-center">
            <div>
                <i class="fa fa-map-marker"></i>
                <p><span>Ghaziabad</span>
                    Delhi</p>
            </div>

            <div>
                <i class="fa fa-phone"></i>
                <p>+91 74**9**258</p>
            </div>
            <div>
                <i class="fa fa-envelope"></i>
                <p><a href="mailto:sagar00001.co@gmail.com">xyz@gmail.com</a></p>
            </div>
        </div>
        <div class="footer-right">
            <p class="footer-company-about">
                <span>About the company</span>
                <strong>Sagar Developer</strong> is a Youtube channel where you can find more creative CSS Animations
                and
                Effects along with
                HTML, JavaScript and Projects using C/C++.
            </p>
            <div class="footer-icons">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
            </div>
        </div>
    </section>
         
            </div>
    </body>
</html>
