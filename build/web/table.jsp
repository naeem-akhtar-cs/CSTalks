<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Website Users - CSTALKS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
</head>

<body id="page-top">
    <div id="wrapper">
        
        <jsp:include page="admin-menu.jsp" />

        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                
                <jsp:include page="admin-navigation.jsp"/>
                
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Users Info (Click to See More Details)</h3>
                    <div class="card shadow">

                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 text-nowrap">

                                </div>
                                <div class="col-md-6">
                                    <div class="text-md-left dataTables_filter" id="dataTable_filter"><label><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>
                                </div>
                            </div>
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th id="name">Name</th>
                                            <th id="dob">DOB</th>
                                            <th id="level">Level</th>
                                            <th id="city">City</th>
                                            <th id="age">Age</th>
                                            <th id="joined">Join Date</th>
                                            <th id="university">University</th>
                                            <th id="action">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="#">Naeem Akhtar</td>
                                            <td>Sep 20, 1999</td>
                                            <td>level 0</td>
                                            <td>Lahore</td>
                                            <td>21</td>
                                            <td>2021/11/28</td>
                                            <td>FAST-NU Lahore</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Sameen Akram</a></td>
                                            <td>Sep 20, 1999</td>
                                            <td>Level 1</td>
                                            <td>Lahore</td>
                                            <td>21</td>
                                            <td>2020/03/13</td>
                                            <td>FAST-NU Lahore</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Samran Waheed</a></td>
                                            <td>Sep 20, 1999</td>
                                            <td>Level 2</td>
                                            <td>Lahore</td>
                                            <td>21</td>
                                            <td>2018/08/12</td>
                                            <td>FAST-NU Lahore</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Ahmad Waheed</a></td>
                                            <td>Sep 20, 1999</td>
                                            <td>Level 3</td>
                                            <td>Lahore</td>
                                            <td>21</td>
                                            <td>2018/05/14</td>
                                            <td>FAST-NU Lahore</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-6 align-self-center">
                                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 4 of 13</p>
                                </div>
                                <div class="col-md-6">
                                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination">
                                            <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                        </ul>
                                    </nav>
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