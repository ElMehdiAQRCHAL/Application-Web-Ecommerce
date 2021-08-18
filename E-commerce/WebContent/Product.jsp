<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.meecommerce.beans.Products"%>  
<%@ page import="com.meecommerce.beans.Product"%> 
<% Products Products=new Products();
	Product Product1=new Product(12,"12","12",12,12,"12","12");
	Product1.setproduit_id((Products.chercherProduct((String) request.getParameter("id"))).getproduit_id());
    Product1.setname((Products.chercherProduct((String) request.getParameter("id"))).getname());
    Product1.setdescription((Products.chercherProduct((String) request.getParameter("id"))).getdescription());
    Product1.setid_M((Products.chercherProduct((String) request.getParameter("id"))).getid_M());
    Product1.setprix((Products.chercherProduct((String) request.getParameter("id"))).getprix());
    Product1.setsible((Products.chercherProduct((String) request.getParameter("id"))).getsible());
    Product1.setimg((Products.chercherProduct((String) request.getParameter("id"))).getimg());%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="CSS_files/for-each-image.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"/>
        <link rel="stylesheet" type="text/css" href="Plugins/slick-master/slick/slick-theme1.css"/>
        <script type="text/javascript" src="Plugins/slick-master/slick/slick.min.js"></script>
        <script src="JS_files/for-each-image.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="Plugins\jQuery-Plugin-For-Image-Hover-Zoom-WM-Zoom\wm-zoom\jquery.wm-zoom-1.0.min.css">
        <style>
          a:hover,a{color:black}
        </style>
        <link rel="icon" href="Images/B.png" type="image/icon type">
        <title>Online Store - <%= Product1.getname()%></title>
    </head>
    <body>
            <!--pop up-->
    <div class="container-fluid mt-5 pop-container" style="position:absolute;z-index:3;background-color: transparent;">
        
    </div>
    <!--pop up-->
             <!--header part start-->                
     <div class="container-fluid text-white" id="change-color">
        <div class="row" id="top-containt">
          <%@include file="Head.jsp" %>
        </div>
        <div class="container-fluid side-bar px-0">
          <div class="col-12 text-right bg-danger"> 
            <span class="close"><a href="#/" class="color">&times;</a></span>
          </div>
        </div>
    </div>
    <!--header part end-->
    <!--middle part start-->
    <div class="container mt-5 pt-4 hide-for-tablate">
        <div class="row pt-5">
            <div class="col-1">
                <div class="row pt-3 pb-2">
                    	
                    
                </div>
            </div>
            <div class="col-5 text-center zooming-open-head wm-zoom-container my-zoom-1">
              <div class="wm-zoom-box">
                <img src=<%= Product1.getimg()%> height="400px" width="405px" class="wm-zoom-default-img" alt="alternative text" data-hight-src="for-each-image-1.jpg">
              </div>
            </div>
<!--hidden--> 
            <div class="col-5">
                <div class="row">
                    <div class="col-12 pt-3">
                        <p style="font-size:25px;font-weight:600"><%= Product1.getname()%></p>
                    </div>
                    <div class="col-12 pl-5">
                        <p style="font-weight:600;font-size:20px;"> Prix : <span style="color:red"><%= Product1.getprix()%> MAD</span></p>
                    </div>
                    <div class="col-12 pl-5">
                        <p style="font-weight:600;font-size:20px;">Taille : <span style="border:1px solid;padding:1% 3%" class="ml-3">M</span> <span style="border:1px solid;padding:1% 4%" class="ml-2">L</span> <span style="border:1px solid;padding:1% 3%" class="ml-2">XL</span></p>
                    </div>
                    <div class="col-12">
                        <ul>
                            <li>Instructions d'entretien: lavage à la main</li>
                            <li>Type de coupe: coupe régulière</li>
                            <li>60% polyester et 40% coton</li>
                            <li>Polo à col classique</li>
                           
                        </ul>
                    </div>
                </div>
            </div>  
        </div>
        <div class="row pt-2">
            <div class="col-6">
            </div>
            <div class="col-6 pl-5 text-white">
                <a href="Addproduct.jsp?id=<%=(String) request.getParameter("id") %>" style="color:white"><span style="width:30%;border:1px solid;padding:2% 5%;text-transform: uppercase;font-size:15px;font-weight:600;background-color:rgb(255, 174, 0);border-radius:10px;"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="ml-2">ajouter au panier</span></span></a>
            </div>
        </div>
        <div class="rows pb-5">
          <div class="col">
            
          </div>
        </div>
    </div>
    <div class="container show-for-small-devices mt-5 pt-1">
      <div class="row pt-5 mt-5">
        <div class="col-2 col-xs-3">
          <div class="row pt-3 pb-2">
        	</div>
        </div>
      </div>
      <div class="row">
        <div class="col">
        </div>
      </div>
      <div class="container-fluid mt-5">
      </div>
    </div>
    <!--middle part end-->

              <!--recommend-->
             
     <!--footer-->
    <%@include file="footer.html" %>
    <!--footer-->
    <script type="text/javascript">
      //for single slider
$('.single-slider').slick({
  dots: false,
  infinite:false,
  autoplaySpeed: 300,
  slidesToShow: 4,
  slidesToScroll: 1,
  responsive: [
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        arrows: false,
        dots: false
      }
    },
    {
      breakpoint: 991,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1,
        infinite: true,
        dots: false,
        arrows: false
      }
    },
    {
      breakpoint: 576,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
        infinite: true,
        dots: false,
        arrows: false
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
}); 
    </script>
    <script type="text/javascript" src="Plugins\jQuery-Plugin-For-Image-Hover-Zoom-WM-Zoom\assets\js\jquery-1.11.1.js"></script>
    <script type="text/javascript" src="Plugins\jQuery-Plugin-For-Image-Hover-Zoom-WM-Zoom\wm-zoom\jquery.wm-zoom-1.0.min.js"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script> 
    <script type="text/javascript">
      $(document).ready(function(){
      $('.my-zoom-1').WMZoom();
        config : {
          inner : true
        }
      });
      </script>
       <script>
        AOS.init({
          once:true,
          duration:1000,
        });
      </script>
      
    </body>
</html>