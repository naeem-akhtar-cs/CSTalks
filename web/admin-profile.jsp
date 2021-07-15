<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile - CSTALKS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
</head>

<body id="page-top">

    <jsp:useBean id="user" class="BeansPkg.adminprofile" scope="page"></jsp:useBean>
    
    <% if(session.getAttribute("adminEmail")==null){ response.sendRedirect("login.jsp"); } else{
        user.getData((String)session.getAttribute("adminEmail")); } %>

        <div id="wrapper">

            <jsp:include page="admin-menu.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">

                    <jsp:include page="admin-navigation.jsp" />

                    <div class="container-fluid">
                        <h3 class="text-dark mb-4">Profile</h3>
                        <div class="row mb-3">
                            <div class="col-lg-4">
                                <div class="card mb-3">
                                    <div class="card-body text-center shadow"><img class="rounded-circle mb-3 mt-4"
                                            src="assets/img/images/sample.jpg" width="160" height="160">
                                        <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Change
                                                Photo</button></div>
                                    </div>
                                </div>


                            </div>
                            <div class="col-lg-8">

                                <div class="row">
                                    <div class="col">

                                        <div class="card shadow mb-3">
                                            <div class="card-header py-3">
                                                <p class="text-primary m-0 font-weight-bold">Personal Information</p>
                                            </div>
                                            <div class="card-body">
                                            
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group"><label for="username"><strong>User
                                                                        ID</strong></label><input class="form-control"
                                                                    type="text" id="username" value=<jsp:getProperty
                                                                    name="user" property="ID" />
                                                                name="username" readonly></div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group"><label for="email"><strong>Email
                                                                        Address</strong></label><input
                                                                    class="form-control" type="email" id="email"
                                                                    value=<jsp:getProperty name="user"
                                                                    property="email" /> name="email" readonly></div>
                                                        </div>
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group"><label
                                                                    for="first_name"><strong>First
                                                                        Name</strong></label><input readonly class="form-control"
                                                                    type="text" id="first_name" value=<jsp:getProperty
                                                                    name="user" property="fName" /> name="first_name">
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group"><label for="last_name"><strong>Last
                                                                        Name</strong></label><input readonly class="form-control"
                                                                    type="text" id="last_name" value=<jsp:getProperty
                                                                    name="user" property="lName" /> name="last_name">
                                                            </div>
                                                        </div>
                                                    </div>
                                                 
                                            </div>
                                        </div>


                                        <div class="card shadow">
                                            <div class="card-header py-3">
                                                <p class="text-primary m-0 font-weight-bold">Contact Information</p>
                                            </div>
                                            <div class="card-body">
                                                
                                                    <div class="form-group"><label
                                                            for="address"><strong>Address</strong></label><input readonly
                                                            class="form-control" type="text" id="address"
                                                            value="<jsp:getProperty name="user" property="address" />"
                                                        name="address"></div>
                                                    <div class="form-row">
                                                        <div class="col">
                                                            <div class="form-group"><label
                                                                    for="city"><strong>City</strong></label><input readonly
                                                                    class="form-control" type="text" id="city"
                                                                    value=<jsp:getProperty name="user"
                                                                    property="city" /> name="city"></div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group"><label
                                                                    for="Province"><strong>Province</strong></label><input readonly
                                                                    class="form-control" type="text" id="province"
                                                                    value=<jsp:getProperty name="user"
                                                                    property="province" /> name="country"></div>
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
                <footer class="bg-white sticky-footer">

                </footer>
            </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/chart.min.js"></script>
        <script src="assets/js/bs-init.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
        <script src="assets/js/theme.js"></script>
</body>

</html>