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
List<Product> ProductsCard=(List) new ArrayList<Product>((List) session.getAttribute( "ProductsCard" ));
List<String> Quantity=(List) new ArrayList<String>((List) session.getAttribute( "Quantity" ));
List<String> size=(List) new ArrayList<String>((List) session.getAttribute( "size" ));
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
        <link rel="icon" href="Images/B.png" type="image/icon type">
        <title>Online Store - Mon panier</title>
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
    <form action="confirmer_achat" method="post">
     <div class="container mt-5">
        <div class="row pt-5">
        
          <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 mt-3">
                <div class="card">
                  <div class="card-header">
                    <div class="row pt-3 pb-3">
                      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6 ">
                        <span style="font-size:20px;font-weight:700;color:grey;color:black">Mon Panier</span>
                      </div>
                      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12  text-right">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;Livrer à &nbsp;<input type="text" placeholder="entrer votre adresse" name="address">
                      	<br><strong style="color: red"><% 
                                            String msg=(String) request.getAttribute("message");
                                            if(msg!=null){
                                                out.println(msg);
                                            }
                                            %>
                          </strong>
                      </div>
                    </div>
                  </div>
                  <div>
                    <div class="card-body">
                    <%for(int i=0;i<ProductsCard.size();i++){ %>
                      <div class="row pb-3 ">
                        <div class="col-xl-4 col-lg-2 col-md-3 col-sm-3 col-12 pt-5 text-center">
                          <img src=<%= (ProductsCard.get(i)).getimg()%> height="200px">
                        </div>
                        <div class="col-xl-8 col-lg-10 col-md-8 col-sm-8 col-12 pt-5">
                          <p>Nom :&nbsp;<%= (ProductsCard.get(i)).getname()%></p>
                          <p>Prix par unité :&nbsp;<%= (ProductsCard.get(i)).getprix()%> MAD</p>
                          <p>Quantité :&nbsp;<%=Quantity.get(i) %></p>
                          <p>Taille :&nbsp;<%=size.get(i) %></p>
                        </div>
                      </div>
                      <%}; %>
                      <div class="row">
                        <div class="col pr-5 text-right">
                          <p><button style="text-transform: uppercase;padding:2% 5%;background-color: tomato;color:white;border-color:transparent" data-toggle="collapse" data-target="#collapseTwo,#payment-option">Confirmer</button></p>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
          </div>
          <div class="col-xl-4 col-lg-12 col-md-12 col-sm-12 col-12 mt-3 pt-4">
            <div class="container">
              <div class="card">
                <div class="card-header">DÉTAILS DES PRIX</div>
                <div class="card-body">
                  <div class="row">
                    <div class="col text-left">
                      Prix(<%=ProductsCard.size() %>) :
                    </div>
                    <%
                    float j=0;
                    for(int i=0;i<ProductsCard.size();i++){
                    	j+=(ProductsCard.get(i)).getprix()*Integer.parseInt(Quantity.get(i));
                    }
                    	%>
                    
                    <div class="col text-right">
                      <%=j %> MAD
                    </div>
                  </div>
                    <div class="row pt-3">
                      <div class="col-7 text-left ">
                        Frais de livraison :
                      </div>
                      <div class="col text-right">
                        49 MAD
                      </div>
                    </div>
                  <hr>
                  <div class="row">
                    <div class="col text-left">
                      Total TTC :
                    </div>
                    <div class="col text-right">
                      <%=j+49 %> MAD
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