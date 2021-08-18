<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.meecommerce.beans.Clients"%>  
<%@ page import="com.meecommerce.beans.Client"%>
<%
if(session.getAttribute( "id_c" )==null){
    this.getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
}
%>
<% 
Clients Clients=new Clients();
Client Client =new Client(0,"0","0","0","0");
Client.setId((Clients.chercherClient(String.valueOf(session.getAttribute( "id_c" )))).getId());
Client.setNom((Clients.chercherClient(String.valueOf(session.getAttribute( "id_c" )))).getNom());
Client.setPrenom((Clients.chercherClient(String.valueOf(session.getAttribute( "id_c" )))).getPrenom());
Client.setEmail((Clients.chercherClient(String.valueOf(session.getAttribute( "id_c" )))).getEmail());
Client.setPassword((Clients.chercherClient(String.valueOf(session.getAttribute( "id_c" )))).getPassword());
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
        <title>Online Store - Mon profil</title>
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
              <li class="pt-4" style="margin-left:-5%;"><a href="ecommerce.html" class="color">home</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="ecommerce-price-men.html" class="color">products</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="#/" class="color">about</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="contact-form.html" class="color">contact</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="#/" class="color">Update profile</a></li>
              <li class="pt-3"style="margin-left:-5%"><a href="login-form.html" class="color">Log In</a><span><a href="#" class="color"><img src="log-in..png" class="log-in"></a></span></li>
            </ul>
        </div>
    </div>
    <!--header part end-->

    <!--middle part start-->
    <div class="container mt-5">
        <div class="row mt-5">
            <div class="col-12 mt-5 text-center">
                <span class="header">Bienvenue M.${sessionScope.nom } ${sessionScope.prenom }</span>
            </div>
        </div>
        
        <!--main content-->
        <div class="row mt-5 text-centrer">
            <form action="editerprofil" method="post">
  				<div class="form-group">
    				<label for="exampleInputEmail1">Nom</label>
    				<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${sessionScope.nom }" name="Nom">
  				</div>
  				<div class="form-group">
    				<label for="exampleInputEmail1">Prenom</label>
    				<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${sessionScope.prenom }" name="Prenom">
  				</div>
  				<div class="form-group">
    				<label for="exampleInputEmail1">Nom</label>
    				<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value=<%=Client.getEmail() %> name="Email">
  				</div>
  				<div class="form-group">
    				<label for="exampleInputPassword1">Password</label>
    				<input type="password" class="form-control" id="exampleInputPassword1" name="Password">
  				</div>
  				<strong style="color: red"><% 
                                            String msg=(String) request.getAttribute("message");
                                            if(msg!=null){
                                                out.println(msg);
                                            }
                                            %>
                </strong><br>
  				<button type="submit" class="btn btn-primary">enregistrer</button>
			</form>
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