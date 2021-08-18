<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="icon" href="Images/B.png" type="image/icon type">
    <title>OnlineStore - S'inscrire</title>

    <!-- Custom fonts for this template-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="styleshe">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4" style="color: #006400">Compte Crée!</h1>
                            </div>
                            <div class="form-group">
                                <p style="color: black" align="center"><% String Id_user = String.valueOf(request.getAttribute("Id_user")); out.println("User id : " +Id_user); %> </p>
                                <p style="color: black" align="center"><% String Nom = (String) request.getAttribute("Nom"); out.println("Nom : " +Nom); %> </p>
                                <p style="color: black" align="center"><% String Prenom = (String) request.getAttribute("Prenom"); out.println("Prenom : " +Prenom); %> </p>
                                <p style="color: black" align="center"><% String Password = (String) request.getAttribute("Password"); out.println("Password : " +Password); %> </p>
                                <p style="color: black" align="center"><% String Email = (String) request.getAttribute("Email"); out.println("Email : " +Email); %> </p>
                                <p style="color: black" align="center"><% String Compte = (String) request.getAttribute("Compte"); out.println("Compte : " +Compte); %> </p>
                            </div>
                            <div class="text-center">
                                <a class="small" href="Login.jsp">Connexion!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>