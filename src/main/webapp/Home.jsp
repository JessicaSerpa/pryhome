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
             <meta http-equiv="X-UA-Compatible" content="IE=edge">
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
              <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
                  <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
                  <link href="CSS/adminlte.min.css" rel="stylesheet" type="text/css"/>
          <link href="CSS/StyleHome.css" rel="stylesheet" type="text/css"/>
                   <link href="CSS/StyleMenu.css" rel="stylesheet"/>
          
        <title>Home</title>

    </head>
 <body>
    <%@include file="Menu.jsp"%>
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
                <img src="img/flayer.jpg" alt="" class="slider__img"/>
              
                <div class="slider__content">
                    <h2 class="slider__title">Laptops</h2>
                    <p class="slider__txt">Las mejores laptos del mercado</p>
                    <a href="#productSection" class="btn-shop" onclick="scrollToSection('productSection')">COMPRAR
                        AHORA</a>
                </div>
            </div>
            <div class="slider__section">
                <img src="img/flayer2.jpg" alt="" class="slider__img">
                <div class="slider__content">
                    <h2 class="slider__title">Computadoras y Componenetes </h2>
                    <p class="slider__txt">Lo mejor para jugar</p>
                    <a href="#productSection" class="btn-shop" onclick="scrollToSection('productSection')">COMPRAR
                        AHORA</a>
                </div>
            </div>
            <div class="slider__section">
                <img src="img/flayer 3.jpg" alt="" class="slider__img">
                <div class="slider__content">
                    <h2 class="slider__title">Perifericos</h2>
                    <p class="slider__txt">Lomejor del mundo Gamer</p>
                    <a href="#productSection" class="btn-shop" onclick="scrollToSection('productSection')">COMPRAR
                        AHORA</a>
                </div>
            </div>
            <div class="slider__section">
                <img src="img/flayer4.jpg" alt="" class="slider__img">
                <div class="slider__content">
                    <h2 class="slider__title">Los mejores precios del mercado</h2>
                    <p class="slider__txt">Productos con las tres "B"</p>
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
         <h2 class="title">NUESTROS REFERENTE</h2> 
         <p>
           " Clientes que nos respaldan con su preferencia"
         </p>
         <div class="box-container2">
             <div class="box">
                 <img src="img/pic1.jpg" alt=""/>
                 <h3>Juan Perez</h3> 
                 <p>Lo mejor para los Gamers</p>
                 <div class="stars">
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i><!-- <i class="fas fa-stars"></i> -->      
                 </div>
                 
             </div>
         
                          <div class="box">
                 <img src="img/pic2.jpg" alt=""/>
                 <h3>Tom Perez</h3>
                 <p>Mejores precios </p>
                 <div class="stars">
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i>
                     <i class="fas fa-star"></i><!-- <i class="fas fa-stars"></i> -->      
                 </div>
                 
             </div>
                          <div class="box">
                 <img src="img/pic3.jpg" alt=""/>
                 <h3>Camila Perez</h3>
                 <p>Productos de calidad</p>
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
      <div class="container">
      <div class="mission-vision">
        <article class="cortain">          
            <h2 class="title">Misión</h2> 
            <p>"Ofrecer tecnología de vanguardia y servicios excepcionales para satisfacer las necesidades informáticas de nuestros clientes, garantizando calidad, accesibilidad y soporte técnico personalizado."</p>
                    <a href="#" class="btn">Saber precio</a>
        </article>

        <article class="cortain">          
            <h2 class="title">Visión</h2>
            <p>"Ser la tienda líder en soluciones informáticas, reconocida por nuestra innovación, confiabilidad y compromiso con el cliente, facilitando el acceso a la tecnología para todos."</p>
                    <a href="#" class="btn">Saber precio</a>
        </article>

        </div>
      </div>
    </section>
         
        <section class="content sau">
            <h2 class="title">Productos</h2>
            <p>
               Vendemos productos como:
            </p>
            
            <div class="box-container">              
                <div class="box">
                    <i class="fa-sharp fa-solid fa-computer"></i>
                    <h3>Computadoras</h3><!-- comment -->
                    <p>
                           Lo mejor del mundo Gamer
                    </p>
                </div>
                
                    <div class="box">
               <i class="fa-solid fa-microchip"></i>
                    <h3>CPUs y GPUs</h3><!-- comment -->
                    <p>
                        Disfruta tus juegos al maximo 
                    </p>
                </div>
                
                                <div class="box">
<i class="fa-solid fa-computer-mouse"></i>
                    <h3>Perifericos</h3><!-- comment -->
                    <p>
                          Los mejores perifericos para jugar
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
  
         
            </div>
     <%@include file="Footer.jsp"%>
    </body>
</html>
