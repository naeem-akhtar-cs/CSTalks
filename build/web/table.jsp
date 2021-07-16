<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Website Users - CSTALKS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    
</head>

<body id="page-top">


    <% if(session.getAttribute("adminEmail")==null){ response.sendRedirect("login.jsp"); } %>

        <jsp:useBean id="obj" class="BeansPkg.allUsers" scope="page"></jsp:useBean>


        <div id="wrapper">

            <jsp:include page="admin-menu.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">

                    <jsp:include page="admin-navigation.jsp" />

                    <div class="container-fluid">
                        <h3 class="text-dark mb-4">Users Info</h3>
                        <div class="card shadow">

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 text-nowrap">

                                    </div>
                                    <div class="col-md-6">
                                        <div class="text-md-left dataTables_filter" id="dataTable_filter"><label><input
                                                    type="search" class="form-control form-control-sm"
                                                    aria-controls="dataTable" placeholder="Search"></label></div>
                                    </div>
                                </div>
                                <div class="table-responsive table mt-2" id="dataTable" role="grid"
                                    aria-describedby="dataTable_info">
                                    <table class="table my-0" id="dataTable">
                                        <thead>
                                            <tr>
                                                <th id="userID">ID</th>
                                                <th id="userID">Email</th>
                                                <th id="name">Name</th>
                                                <th id="dob">Age</th>
                                                <th id="city">City</th>
                                                <th id="joined">Join Date</th>
                                                <th id="university">University</th>
                                                <th id="action">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <% for(int i=0;i<obj.getSize();i++){ %>

                                                <form method="POST" action="http://localhost:8080/CSTalks/suspendUser">

                                                    <input type="hidden" name="ID" value="<%= obj.getID(i) %>" />
                                                    <tr>
                                                        <td>
                                                            <%= obj.getID(i) %>
                                                        </td>
                                                        <td>
                                                            <%= obj.getemail(i) %>
                                                        </td>
                                                        <td>
                                                            <%= obj.getfullName(i) %>
                                                        </td>
                                                        <td>
                                                            <%= obj.getage(i) %>
                                                        </td>
                                                        <td>
                                                            <%= obj.getcity(i) %>
                                                        </td>
                                                        <td>
                                                            <%= obj.getDateJoined(i) %>
                                                        </td>
                                                        <td>
                                                            <%= obj.getuniversity(i) %>
                                                        </td>
                                                        <td>
                                                            <div class="mb-3"><button class="btn btn-primary btn-sm"
                                                                    type="submit">Suspend User</button></div>
                                                        </td>
                                                    </tr>

                                                </form>

                                                <% }%>


                                        </tbody>
                                    </table>
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