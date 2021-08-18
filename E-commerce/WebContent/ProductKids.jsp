<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.meecommerce.beans.Products"%>  
<%@ page import="com.meecommerce.beans.Product"%> 
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
Products Products=new Products();
List<Product> ProductsKids = new ArrayList<Product>();
ProductsKids=Products.recupererProducts("Kids");
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
        <link rel="stylesheet" href="CSS_files/ecommerce-price-men.css">
        <script src="JS_files/ecommerce-price-men.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"/>
        <link rel="stylesheet" type="text/css" href="Plugins/slick-master/slick/slick-theme1.css"/>
        <script type="text/javascript" src="Plugins/slick-master/slick/slick.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.5/pagination.css"/>
        <link rel="icon" href="Images/B.png" type="image/icon type">
        <title>Online Store - Produits Enfants</title>
        <style>
          a{color:black}
          a:hover{color:black}
        </style>
    </head>
    <body>
        
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
        <!--middle-->
          <div class="container-fluid mt-5 pt-5">
            <div class="row">
              
              <!--left side col start-->
              <div class="col-xl-3 col-lg-3 col-md-3 col-sm-12 col-12">
                <div class="container large-left-sider">
                  <div class="row">
                    <div class="col-12 px-0 pt-5 pb-4 text-center pl-0">
                      <input class="search-box" type="text" placeholder="Rechercher.." ><span><button class="search-button"><i class="fa fa-search" id="search-icon"></i></button></span>
                    </div>
                  </div>
                  <div class="row pl-3">
                    
                    
                  </div>
                </div>
              </div>
              <!--left side col end-->
              
              <!--right side col start-->
              
              <!--front look-->
              <div class="col-xl-9 col-lg-9 col-md-9 col-sm-12 col-12 pl-0" style="border-left:1px solid grey">
                <div class="container large-right-sider">
                  <!--second-->
                  <div class="row pt-5 hide-front-page">
                  <%for(int i=0;i<ProductsKids.size();i+=4){ %>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6  text-center">
                       <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i)).getproduit_id())%>"><img src=<%= (ProductsKids.get(i)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;height:180px"></a> 
                       <p></p>
                       <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsKids.get(i)).getname()%><br><%= (ProductsKids.get(i)).getprix()%> MAD</span></a>
                    </div>
                    <%if(i+1<ProductsKids.size()){ %>
                    <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6  text-center">
                      <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i+1)).getproduit_id())%>"><img src=<%= (ProductsKids.get(i+1)).getimg()%> class="img-men" data-aos="fade-up" style="height:180px"><br></a>
                      <p></p>
                      <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i+1)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsKids.get(i+1)).getname()%><br><%= (ProductsKids.get(i+1)).getprix()%> MAD</span></a>
                    </div>
                    <%}; %>
                    <%if(i+2<ProductsKids.size()){ %>
                    <div class="col-xl-3 col-lg-4 col-md-4 text-center hide-containt-tablate">
                      <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i+2)).getproduit_id())%>"><img src=<%= (ProductsKids.get(i+2)).getimg()%> class="img-men" data-aos="fade-up" style="border-radius:20px;height:180px"></a>
                      <p></p>
                      <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i+2)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsKids.get(i+2)).getname()%><br><%= (ProductsKids.get(i+2)).getprix()%> MAD</span></a>
                    </div>
                    <%}; %>
                    <%if(i+3<ProductsKids.size()){ %>
                    <div class="col-xl-3 col-lg-3 col-md-3 text-center hide-containt-small-device">
                      <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i+3)).getproduit_id())%>"><img src=<%= (ProductsKids.get(i+3)).getimg()%> class="img-men" data-aos="fade-up" style="height:180px"><br></a>
                      <p></p>
                      <a href="Product.jsp?id=<%= String.valueOf((ProductsKids.get(i+3)).getproduit_id())%>"><span class="image-lable" data-aos="fade-up"><%= (ProductsKids.get(i+3)).getname()%><br><%= (ProductsKids.get(i+3)).getprix()%> MAD</span></a>
                    </div>
                    <%}; %>
                  <%}; %>
                  </div>
                  
              	</div>
              </div>
              <!--right side col end-->
            </div>
          </div>          
          <!--recommend-->
          
          <!--recommend end-->
          <%@include file="footer.html" %>

        <script src="https://unpkg.com/aos@next/dist/aos.js"></script> 
    </body>
</html>