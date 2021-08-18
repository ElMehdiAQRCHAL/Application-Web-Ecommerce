<div class="col-4 text-center">
                  <a href="Index.jsp"><img src="Images/A.png" height="130px" class="color logo-1 logo-sift"></a>
                  <a href="ecommerce.html"><img src="Images/pinterest_icon.png" height="70px" class=" color logo-2 mt-1 ml-2"></a>
</div>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-8 pt-4 mt-1 text-center">
                  <span class="menu-1"><a href="Index.jsp" class="color">accueil</a></span>
                  <span class="menu"><a href="Produits.jsp" class="color">produits</a></span>
                  <span class="menu"><a href="About.jsp" class="color">à propos</a></span>
                  <span class="menu"><a href="Contact.jsp" class="color">contact</a></span>
                  <c:if test="${ empty prenom && empty nom }">
                  		<span class="menu"><a href="Login.jsp" class="btn btn-outline-success" type="submit">SE CONNECTER</a></span>
                  </c:if>
                  <c:if test="${ !empty prenom && !empty nom }">
        				<span class="menu">
        				<div class="btn-group">
  							<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${sessionScope.nom } ${sessionScope.prenom} </button>
  						<div class="dropdown-menu">
    						<a class="dropdown-item" href="Profile.jsp">mon profil</a>
    						<a class="dropdown-item" href="SommeCard.jsp">mon panier</a>
    						<a class="dropdown-item" href="CommandesC.jsp">mes commandes</a>
   						<div class="dropdown-divider"></div>
    					<a class="dropdown-item" href="Index_Out.jsp">déconnexion</a>
  						</div>
						</div>
						</span>
    				</c:if>
                  
                  <span class="menu-bar text-right"><a href="#/" class="color">&#9776;</a></span>
                  <span class="menu-bar-1 text-right"><a href="#/" class="color">&#9776;</a></span>
                  <span class="menu-bar-2 text-right"><a href="#/" class="color">&#9776;</a></span>
 </div>
             