<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.meecommerce.beans.Products"%>  
<%@ page import="com.meecommerce.beans.Product"%> 
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%
if(session.getAttribute( "id_c" )==null){
    this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
}
%>
<% 	
Products Products=new Products();
Product Product2=new Product(0,"0","0",0,0,"0","0");
Product2.setproduit_id((Products.chercherProduct((String) request.getParameter("id"))).getproduit_id());
Product2.setname((Products.chercherProduct((String) request.getParameter("id"))).getname());
Product2.setdescription((Products.chercherProduct((String) request.getParameter("id"))).getdescription());
Product2.setid_M((Products.chercherProduct((String) request.getParameter("id"))).getid_M());
Product2.setprix((Products.chercherProduct((String) request.getParameter("id"))).getprix());
Product2.setsible((Products.chercherProduct((String) request.getParameter("id"))).getsible());
Product2.setimg((Products.chercherProduct((String) request.getParameter("id"))).getimg());
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
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="CSS_files/cart.css">
        <script src="JS_files/cart.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" href="Images/B.png" type="image/icon type">
        <title>Online Store - <%= Product2.getname()%></title>
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
    <form action="ajouter_au_panier?id=<%=(String) request.getParameter("id") %>" method="post">
     <div class="container mt-5">
        <div class="row pt-5">
        
          <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 mt-3">
                <div class="card">
                  <div class="card-header">
                    <div class="row pt-3 pb-3">
                      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 ">
                        <span style="font-size:20px;font-weight:700;color:grey;color:black">Produit à ajouter au panier</span>
                      </div>
                      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12  text-right">
                      </div>
                    </div>
                  </div>
                  <div>
                    <div class="card-body">
                      <div class="row pb-3 ">
                        <div class="col-xl-4 col-lg-2 col-md-3 col-sm-3 col-12 pt-5 text-center">
                          <img src=<%= Product2.getimg()%> height="200px">
                        <div class="text-left">
                        
                            <select name="Quantity" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                              <option selected disabled value="1">Quantité</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                            </select>
                          </div>
                          <div class="text-left">
                            <select name="size" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                              <option selected disabled value="1">Taille</option>
                              <option value="S">S</option>
                              <option value="M">M</option>
                              <option value="L">L</option>
                              <option value="XL">XL</option>
                              <option value="XXL">XXL</option>
                            </select>
                          </div>
                          <strong style="color: red"><% 
                                            String msg=(String) request.getAttribute("message");
                                            if(msg!=null){
                                                out.println(msg);
                                            }
                                            %>
                          </strong>
                        </div>
                        <div class="col-xl-8 col-lg-10 col-md-8 col-sm-8 col-12 pt-5">
                          <p>Nom :&nbsp;<%= Product2.getname()%></p>
                          <p>Prix :&nbsp;<%= Product2.getprix()%> MAD</p>
                          <p><a href="Produits.jsp" style="font-weight:700">Annuler</a></p>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col pr-5 text-right">
                          <p><button style="text-transform: uppercase;padding:2% 5%;background-color: tomato;color:white;border-color:transparent" data-toggle="collapse" data-target="#collapseTwo,#payment-option">ajouter au panier</button></p>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
          </div>
      </div>

  </div>
  </form>
  <!--footer-->
  <%@include file="footer.html" %>
      <!--footer-->
      <script src="https://unpkg.com/aos@next/dist/aos.js"></script> 
    <script>
        AOS.init({
          once:true,
          duration:1000,
        });
      </script>
    </body>
</html>