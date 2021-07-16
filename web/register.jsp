<!DOCTYPE html>


<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register - CSTALKS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/theme.js"></script>

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

    <script>
        function empty() {
            
            fName=document.getElementById("FirstName").value;
            lName=document.getElementById("LastName").value;
            email = document.getElementById("Email").value;
            var password = document.getElementById("Password").value;
            var repeatPass=document.getElementById("RepeatPassword").value;

            if (fName == "" || lName == "" || email == "" || password == "" || repeatpass == "") {
                alert("Please fill all the fields");
                return false;
            };
        }
    </script>

</head>

<body id="page-top">

    <% if(session.getAttribute("email")!=null){
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
            <div class="card shadow-lg o-hidden border-0 my-5">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-flex">
                            <div class="flex-grow-1 bg-register-image" style="background-image: url(&quot;assets/img/images/image2.jpg&quot;);"></div>
                        </div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 class="text-dark mb-4">Create an Account!</h4>
                                </div>
                                
                                <form class="user" method="POST" action="http://localhost:8080/CSTalks/signup" name="signup-form">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="FirstName" placeholder="First Name" name="first_name"></div>
                                        <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="LastName" placeholder="Last Name" name="last_name"></div>
                                    </div>

                                    <div class="form-group"><input class="form-control form-control-user" type="email" id="Email" aria-describedby="emailHelp" placeholder="Email Address" name="email"></div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="password" id="Password" placeholder="Password" name="password"></div>
                                        <div class="col-sm-6"><input class="form-control form-control-user" type="password" id="RepeatPassword" placeholder="Repeat Password" name="password_repeat"></div>
                                    </div><button class="btn btn-primary btn-block text-white btn-user" type="submit" id="submit" onClick="return empty()">Register Account</button>
                                    <hr>
                                </form>

                                <div class="text-center"><a class="small" href="login.jsp">Already have an account? Login!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <% if(session.getAttribute("alert-message")!=null){ %>
        <jsp:include page="alert.jsp" />
    <% } session.removeAttribute("alert-message"); %>

</body>

</html>