<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.meecommerce.beans.Products"%>  
<%@ page import="com.meecommerce.beans.Product"%> 
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<% 
Products Products=new Products();
List<Product> ProductsT = new ArrayList<Product>();
List<Product> ProductsKids = new ArrayList<Product>();
List<Product> ProductsMens = new ArrayList<Product>();
List<Product> ProductsWomans = new ArrayList<Product>();
ProductsT=Products.recupererProducts();
ProductsKids=Products.recupererProducts("Kids");
ProductsMens=Products.recupererProducts("Mens"); 
ProductsWomans=Products.recupererProducts("Womans"); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="CSS_files/ecommerce.css">
        <script src="JS_files/ecommerce.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" href="Images/B.png" type="image/icon type">
        <title>Online Store</title>
    </head>
    <body>
        <div class="carousel slide" data-ride="carousel" style="z-index:1">
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
            <div class="carousel-inner text-center ">
              <div class="carousel-item" style="height:100vh"> 
                <div style="height:100vh;width:100vw" class="text-right pr-5">
                  <div class="container pt-4">
                    <div class="row mt-3 pt-5">
                      <div class="col-12 text-center pt-5">
                        <a href="Produits.jsp"><span class="box"><img src="Images/sale-box.jpg" height="320px"  style="transform: translateY(10%);"></span></a>
                        <a href="Produits.jsp"><img src="Images/sale-1..png" height="300px" class="sale-img"></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div> 
              <div class="carousel-item  active" style="height:100vh">
                  <div class="container mt-4 pt-5">
                    <div class="row pt-5 pb-5">
                      <div class="col-12 text-center pb-4">
                        <a href="Produits.jsp"><span class="hide-banner"><img src="Images/ballon.jpg" height="350px;"></span></a>
                        <a href="Produits.jsp"><img src="Images/background-image-2.jpg" height="320px"></a>
                      </div>
                    </div>
                  </div>
              </div>
          </div>
        </div>
          <div class='container-fluid pb-3'>
            <div class="row">
              <div class="col text-center">
                <a href="Produits.jsp"><span style="font-size:30px;text-transform:uppercase;font-weight:bold" data-aos="zoom-in">POPULAIRE</span></a>
              </div>
            </div>
          </div>
          <div class="container-fluid pt-5" style="background-color:white">
            <div class="container"> 
              <div class="row text-center">
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 text-center">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                    <a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(0)).getproduit_id())%>"><img src=<%= (ProductsT.get(0)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;"><br></a>
                    <a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(0)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsT.get(0)).getname()%><br><%= (ProductsT.get(0)).getprix()%> MAD</span></a>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 text-center popular-sift-down">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                  	<a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(1)).getproduit_id())%>"><img src=<%= (ProductsT.get(1)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;"><br></a>
                    <a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(1)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsT.get(1)).getname()%><br><%= (ProductsT.get(1)).getprix()%> MAD</span></a>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-4 hide-lady-1">
                  <div class="container pl-0 text-center" height="250px" width="250px" style="overflow:hidden">
                  	<a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(2)).getproduit_id())%>"><img src=<%= (ProductsT.get(2)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;"><br></a>
                    <a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(2)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsT.get(2)).getname()%><br><%= (ProductsT.get(2)).getprix()%> MAD</span></a>
                  </div>
                </div>
                <div class="col-xl-3 hide-lady">
                  <div class="container pl-0 text-center" height="250px" width="250px" style="overflow:hidden">
                  	<a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(3)).getproduit_id())%>"><img src=<%= (ProductsT.get(3)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;"><br></a>
                    <a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(3)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsT.get(3)).getname()%><br><%= (ProductsT.get(3)).getprix()%> MAD</span></a>
                  </div>
                </div>
              </div>
              <div class="row pt-5 pb-4 text-center">
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 text-center">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                  	<a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(4)).getproduit_id())%>"><img src=<%= (ProductsT.get(4)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;"><br></a>
                    <a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(4)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsT.get(4)).getname()%><br><%= (ProductsT.get(4)).getprix()%> MAD</span></a>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 text-center popular-sift-down">
                    <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                    	<a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(5)).getproduit_id())%>"><img src=<%= (ProductsT.get(5)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;"><br></a>
                    <a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(5)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsT.get(5)).getname()%><br><%= (ProductsT.get(5)).getprix()%> MAD</span></a>
                  </div>
                </div>
                <div class="col-xl-3 col-lg-4 text-center hide-lady-1">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                  	<a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(6)).getproduit_id())%>"><img src=<%= (ProductsT.get(6)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;"><br></a>
                    <a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(6)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsT.get(6)).getname()%><br><%= (ProductsT.get(6)).getprix()%> MAD</span></a>
                  </div>
                </div>
                <div class="col-xl-3 text-center hide-lady">
                  <div class="container pl-0" height="250px" width="250px" style="overflow:hidden">
                  	<a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(7)).getproduit_id())%>"><img src=<%= (ProductsT.get(7)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;"><br></a>
                    <a href="Product.jsp?id=<%= String.valueOf((ProductsT.get(7)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsT.get(7)).getname()%><br><%= (ProductsT.get(7)).getprix()%> MAD</span></a>
                  </div>
                </div>
              </div>
              <div class="row mb-1 pb-3">
                <div class="col-12 pb-5 text-center">
                  <a href="Produits.jsp"><span style="font-weight:700;font-size:20px;color:blue" data-aos="zoom-in">voir plus</span><span class="pl-3" style="color:blue"><i class="fa fa-arrow-right" aria-hidden="true" data-aos="zoom-in"></i></span></a>
                </div>
              </div>
            </div>
          </div>
          
          <div class="container-fluid mt-5">
           <div class="container pt-3 pb-3">
             <div class="row">
              <div class="col-sm-12 text-center pb-4 pt-4">
                <a href="ProductMens.jsp"><span style="text-transform: uppercase;font-weight: 700;font-size:30px;" data-aos="zoom-in">produits pour hommes</span></a>
              </div>
             </div>
            <div class="row pt-1">
              <div class="col-xl-5 col-lg-5 text-center pt-5 hide-popular">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(0)).getproduit_id())%>"><img src=<%= (ProductsMens.get(0)).getimg()%> height="400px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(0)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsMens.get(0)).getname()%><br><%= (ProductsMens.get(0)).getprix()%> MAD</span></a>
              </div>
              <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
                <div class="row">
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(1)).getproduit_id())%>"><img src=<%= (ProductsMens.get(1)).getimg()%> height="200px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(1)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsMens.get(1)).getname()%><br><%= (ProductsMens.get(1)).getprix()%> MAD</span></a>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(2)).getproduit_id())%>"><img src=<%= (ProductsMens.get(2)).getimg()%> height="200px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(2)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsMens.get(2)).getname()%><br><%= (ProductsMens.get(2)).getprix()%> MAD</span></a>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(3)).getproduit_id())%>"><img src=<%= (ProductsMens.get(3)).getimg()%> height="200px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(3)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsMens.get(3)).getname()%><br><%= (ProductsMens.get(3)).getprix()%> MAD</span></a>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(4)).getproduit_id())%>"><img src=<%= (ProductsMens.get(4)).getimg()%> height="200px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsMens.get(4)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsMens.get(4)).getname()%><br><%= (ProductsMens.get(4)).getprix()%> MAD</span></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="container pr-5 text-center mt-2 pb-3">
              <div class="row pt-5">
                <div class="col">
                  <a href="ProductMens.jsp"><span style="border:3px solid rgb(180, 69, 69);border-radius:10px;padding:1% 2%;background-color:rgb(177, 84, 84);" class="ml-4" data-aos="zoom-in"><span style="font-weight:700;font-size:20px;color:white;text-transform: uppercase;">voir plus</span><span class="pl-3" style="color:white;"><i class="fa fa-arrow-right" aria-hidden="true"></i></span></span></a>
                </div>
              </div>
            </div>
          </div> 
          </div>
           <div class="container-fluid mt-4 pt-2">
            <div class="container pt-4 pb-4">
              <div class="row">
               <div class="col-sm-12 text-center pb-4">
                 <a href="ProductLadies.jsp"><span style="text-transform: uppercase;font-weight: 700;font-size:30px;" data-aos="zoom-in">produits pour femmes</span></a>
               </div>
              </div>
             <div class="row">
               <div class="col-xl-5 col-lg-5 text-center pt-5 hide-popular">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(0)).getproduit_id())%>"><img src=<%= (ProductsWomans.get(0)).getimg()%> height="400px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(0)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsWomans.get(0)).getname()%><br><%= (ProductsWomans.get(0)).getprix()%> MAD</span></a>
               </div>
               <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
                 <div class="row">
                   <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(1)).getproduit_id())%>"><img src=<%= (ProductsWomans.get(1)).getimg()%> height="200px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(1)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsWomans.get(1)).getname()%><br><%= (ProductsWomans.get(1)).getprix()%> MAD</span></a>
                   </div>
                   <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(2)).getproduit_id())%>"><img src=<%= (ProductsWomans.get(2)).getimg()%> height="200px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(2)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsWomans.get(2)).getname()%><br><%= (ProductsWomans.get(2)).getprix()%> MAD</span></a>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(3)).getproduit_id())%>"><img src=<%= (ProductsWomans.get(3)).getimg()%> height="200px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(3)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsWomans.get(3)).getname()%><br><%= (ProductsWomans.get(3)).getprix()%> MAD</span></a>
                   </div>
                   <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 text-center pt-3">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(4)).getproduit_id())%>"><img src=<%= (ProductsWomans.get(4)).getimg()%> height="200px" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsWomans.get(4)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsWomans.get(4)).getname()%><br><%= (ProductsWomans.get(4)).getprix()%> MAD</span></a>
                   </div>
                 </div>
               </div>
             </div>
           </div>
           <div class="container pr-5 text-center mt-4 pb-5">
            <div class="row pt-2 pb-3">
              <div class="col">
                <a href="ProductLadies.jsp"><span style="border:3px solid rgb(180, 69, 69);border-radius:10px;padding:1% 2%;background-color:rgb(177, 84, 84);" class="ml-4" data-aos="zoom-in"><span style="font-weight:700;font-size:20px;color:white;text-transform: uppercase;">voir plus</span><span class="pl-3" style="color:white;"><i class="fa fa-arrow-right" aria-hidden="true"></i></span></span></a>
              </div>
            </div>
          </div>
          </div> 
          <div class="container pt-4 pb-5">
            <div class="row">
              <div class="col-sm-12 text-center">
                <a href="ProductKids.jsp"><span style="text-transform: uppercase;font-weight: 700;font-size:30px;" data-aos="zoom-in">produits pour enfants</span></a>
              </div>
            </div>
          </div> 
          <div class="container-fluid pt-5 pb-3 px-0" id = "parallax2" style="background-image:url('Images/desktop-1.jpg');background-size:cover;background-attachment: fixed;">
            <div class="container" height="200px">
              <div class="row pt-1">
              <%for(int i = 0; i < 4; i++){ %>
               <div class="col-xl-3 col-lg-3  col-md-4 col-sm-6 col-12 pb-3 text-center">
                <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i)).getproduit_id())%>"><img src=<%= (ProductsKids.get(i)).getimg()%> height="200px" style="border-radius:20px;" data-aos="fade-up"><br></a>
                <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i)).getproduit_id())%>"><span class="image-lable" data-aos="zoom-in"><%= (ProductsKids.get(i)).getname()%><br><%= (ProductsKids.get(i)).getprix()%> MAD</span></a>
               </div>
              <%}; %>
              </div>
            </div>
            <div class="row">
              <div class="col pt-4 pb-5 text-center">
                <a href="ProductKids.jsp"><span style="border:3px solid rgb(180, 69, 69);border-radius:10px;padding:1% 2%;background-color:rgb(177, 84, 84);" class="ml-4" data-aos="zoom-in"><span style="font-weight:700;font-size:20px;color:white;text-transform: uppercase;">voir plus</span><span class="pl-3" style="color:white;"><i class="fa fa-arrow-right" aria-hidden="true"></i></span></span></a>
              </div>
            </div>
          </div>
         <%@include file="footer.html" %>
          <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
          <script>
            AOS.init({
              once:true,
              duration:1000,
            });
          /* const parallax1 =document.getElementById('parallax1');
          const parallax2 =document.getElementById('parallax2');
          window.addEventListener("scroll",function(){
            let offset = window.pageYOffset;
            parallax1.style.backgroundPositionY = offset * 0.4 + 'px';
            parallax2.style.backgroundPositionY = offset * 0.9 + 'px';
          });*/
        </script>
    </body>
</html>