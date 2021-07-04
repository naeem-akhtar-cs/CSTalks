<!DOCTYPE html>


<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - CSTALKS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>

</head>

<body id="page-top">

    <% 
    if(session.getAttribute("email")!=null){
        response.sendRedirect("user-profile.jsp");
    } 
    %>

    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>CSTALKS</span></div>
                </a>
                <hr class="sidebar-divider my-0">
            </div>
        </nav>

        <div class="container">

            </br>
            </br>
            </br>
            </br>
            </br>

            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-9 col-lg-12 col-xl-10">
                        <div class="card shadow-lg o-hidden border-0 my-5">
                            <div class="card-body p-0">
                                <div class="row">
                                    <div class="col-lg-6 d-none d-lg-flex">
                                        <div class="flex-grow-1 bg-login-image"
                                            style="background-image: url(&quot;assets/img/images/image1.jpg&quot;);">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="p-5">
                                            <div class="text-center">
                                                <h4 class="text-dark mb-4">Login to Your Account</h4>
                                            </div>

                                            <form class="user" method="POST"
                                                action="http://localhost:8080/CSTalks/login" name="login-form">
                                                
                                                <div class="form-group"><input class="form-control form-control-user"
                                                        type="email" id="exampleInputEmail" aria-describedby="emailHelp"
                                                        placeholder="Email Address" name="email"></div>

                                                <div class="form-group"><input class="form-control form-control-user"
                                                        type="Password" id="exampleInputPassword" placeholder="Password"
                                                        name="password"></div>
                                                </br>
                                                
                                                <button class="btn btn-primary btn-block text-white btn-user" type="submit">Login</button>
                                            </form>

                                            </br>
                                            <a href="admin-dashboard.jsp">Admin Dash (Temp Button)</a>
                                            </br>
                                            <a href="user-profile.jsp">User Dash (Temp Button)</a>
                                            <hr>

                                            <div class="text-center"><a class="small" href="register.jsp">Create an
                                                    Account!</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
</body>

</html>