<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
    <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 400px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       }
       #main-footer {
    background: #fff;
}

#main-footer p a {
    padding-bottom: 40px;
    font-size: 25px;
    text-decoration: none;
}

#main-footer p {
    text-align: center; 
}

.social-links {
    list-style:none;
    margin:0;
    padding:0;
    margin-bottom:30px;
}

.social-links li{
    display:inline-block;
    margin:0 5px;
    border-radius:3px;
    box-shadow:0 4px 0 transparent;
    -webkit-transition:all .3s ease-out;
    transition:all .3s ease-out;
}

.social-links li a {
    display:block;
    color:#fff;
    font-size:21px;
    width:50px;
    height:50px;
    line-height:50px;
    text-align:center;
    background:#509B9E;
    border-radius:50%;
    -webkit-transition:all .3s ease-out;
    transition:all .3s ease-out;
}

.social-links li a:hover {
    color:#fff;
    background:#f9398c;
}
    </style>
    
        <title>Somnath Sevashram</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600&amp;subset=latin-ext" rel="stylesheet">

        <!-- CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="<c:url value="/resources/home/css/main.css"/>" rel="stylesheet">

        <!-- JS -->
        <script src="<c:url value="/resources/home/js/vendor/modernizr-2.8.3.min.js"/>"></script>
        <script src="<c:url value="/resources/home/js/vendor/jquery-1.12.0.min.js"/>"></script>
    </head>
    <body>
        <div class="site" id="page">
            <a class="skip-link sr-only" href="#main">Skip to content</a>

            <!-- Options headline effects: .rotate | .slide | .zoom | .push | .clip -->
            <section class="hero-section hero-section--image clearfix clip">
                <div class="hero-section__wrap">
                    <div class="hero-section__option">
                        <img src="<c:url value="/resources/home/images/index.jpg"/>" alt="bg">
                    </div>
                    <!-- .hero-section__option -->

                    <div class="container">
                        <div class="row">
                            <div class="offset-lg-2 col-lg-8">
                                <div class="title-01 title-01--11 text-center">
                                    <h2 class="title__heading">
                                        <span>Somnath Sevashram</span>
                                        <!-- <strong class="hero-section__words">
                                            <span class="title__effect is-visible">AweSome</span>
                                            <span class="title__effect">Creative</span>
                                            <span class="title__effect">Free</span>
                                        </strong> -->
                                    </h2>
                                    <!-- <div class="title__description">Delivering extraordinary creations from the very beginning of the time!</div> -->

                                    <!-- Options btn color: .btn-success | .btn-info | .btn-warning | .btn-danger | .btn-primary -->
                                    <div class="title__action"><a href="login" class="btn btn-success">Client Login</a></div>
                                    </br> <div class="title__action"><a href="login" class="btn btn-success">Employee Login</a></div>
                                    </br><div class="title__action"><a href="register" class="btn btn-success">Client Signup</a></div>
                                    </br><div class="title__action"><a href="registerSupplier" class="btn btn-success">Supplier Registration</a></div>
                                </div> <!-- .title-01 -->
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div id="map"></div>
    <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var smnthsvrm = {lat: 22.8083697, lng: 86.2026957};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 10, center: smnthsvrm});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: smnthsvrm, map: map});
}
    </script>
    <!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDoGBVFVxUt8rge808tC5ztfqEs94ig-ZQ&callback=initMap">
    </script>
        </div>
		
        <!-- <div class="button-group">
        	<a href="index-color.html" class="btn btn-outline-success button-sm">Color</a>
            <a href="index-slider.html" class="btn btn-outline-success button-sm">Slider</a>
            <a href="index-video.html" class="btn btn-outline-success button-sm">Video Background</a>
        </div> -->

	<footer id="main-footer" class="add-padding border-top-color2">
		
			<div class="container">

				<p>Contact Us</p><br>
			
				<ul class="social-links text-center">
					<li><a href="tel:9654070844" target="_blank"><i class="fa fa-phone"></i></a></li>
				</ul>
			
				<p class="text-center">&copy; 2018 - Somnath Sevashram</p>
			
			</div>
			
		</footer>
        <!-- JS -->
        <script src="assets/js/plugins/animate-headline.js"></script>
        <script src="assets/js/main.js"></script>
    </body>
</html>