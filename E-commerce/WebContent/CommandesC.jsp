<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.meecommerce.beans.commandes"%>  
<%@ page import="com.meecommerce.beans.commande"%> 
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
commandes commandes=new commandes();
List<commande> tableCommandesC = new ArrayList<commande>();
tableCommandesC=commandes.recuperercommandes_C(String.valueOf(session.getAttribute( "id_c" ))); 
Products Products=new Products();
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="CSS_files/about-us.css">
        <script src="JS_files/about-us.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" href="Images/B.png" type="image/icon type">
        <title>Online Store - Mes commandes</title>
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
            <ul class="pt-5 pre-side-bar">
              </ul>
        </div>
    </div>
    <!--header part end-->

    <!--middle part start-->
    <div class="container mt-5">
        <div class="row mt-5">
            <div class="col-12 mt-5 text-center">
                <span class="header">Mes Commandes</span>
            </div>
        </div>
        
        <!--main content-->
        <div class="row mt-5">
            <table class="table">
  				<thead class="thead-dark">
    				<tr>
      					<th scope="col">ID Produit</th>
      					<th scope="col">Nom</th>
      					<th scope="col">Quantité</th>
      					<th scope="col">Taille</th>
      					<th scope="col">Prix totale</th>
      					<th scope="col">Adresse de livraison</th>
      					<th scope="col">Date de commande</th>
      					<th scope="col">Date de livraison</th>
      					<th scope="col">Statut</th>
    				</tr>
  				</thead>
  				<tbody>
  				<%for(int i = 0; i < tableCommandesC.size(); i++){ %>
    				<tr>
      					<th scope="row"><a style="color:#000000;" href="Product.jsp?id=<%= (tableCommandesC.get(i)).getid_produit() %>"><%= (tableCommandesC.get(i)).getid_produit() %></a></th>
      					<td><a style="color:#000000;" href="Product.jsp?id=<%= (tableCommandesC.get(i)).getid_produit() %>"><%=(Products.chercherProduct(String.valueOf((tableCommandesC.get(i)).getid_produit()))).getname() %></a></td>
      					<td><%= (tableCommandesC.get(i)).getQuantity()%></td>
      					<td><%= (tableCommandesC.get(i)).getsize()%></td>
      					<td><%=(Products.chercherProduct(String.valueOf((tableCommandesC.get(i)).getid_produit()))).getprix()*(tableCommandesC.get(i)).getQuantity() %></td>
      					<td><%= (tableCommandesC.get(i)).getdistinataire() %></td>
      					<td><%= (tableCommandesC.get(i)).getdate_creation() %></td>
      					<td><%= (tableCommandesC.get(i)).getdate_livraison() %></td>
      					<td><%= (tableCommandesC.get(i)).getstatut() %></td>
    				</tr>
    			<%}; %>
  				</tbody>
			</table>
        </div>
        <!--main content-->
        
        <!--cards-->
        <div class="row mt-5 mb-5">
        </div> 
    </div>
    <!--middle part end-->

     <%@include file="footer.html" %>
      <script src="https://unpkg.com/aos@next/dist/aos.js"></script>

      <script>
            //on scroll plugin//
  AOS.init({
    once:true,
    duration:1000,
  });
  //on scroll plugin//
      </script>
    </body>
</html>