<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - CSTALKS</title>
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
    <style>
        .w-100 {
            width: 100%;
        }
        
        .tar {
            text-align: right;
        }
    </style>

</head>

<body id="page-top">
    <div id="wrapper">

        
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0">
                <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>CSTALKS</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link active" href="admin-dashboard.jsp"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="admin-profile.jsp"><i class="fas fa-user"></i><span>Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="table.jsp"><i class="fas fa-table"></i><span>Users</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="topics.jsp"><i class="fas fa-table"></i><span>Topics</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="delete-question.jsp"><i class="fas fa-table"></i><span>Delete Question</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="add-topic.jsp"><i class="fas fa-table"></i><span>Add Topic</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="requested-topics.jsp"><i class="fas fa-table"></i><span>Requested Topics</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="delete-question-requests.jsp"><i class="fas fa-table"></i><span>Reported Questions</span></a></li>

                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>


        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <ul class="navbar-nav flex-nowrap ml-auto">
                            <li class="nav-item dropdown no-arrow mx-1">
                                <li class="nav-item dropdown no-arrow">
                                    <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">Naeem Akhtar</span><img class="border rounded-circle img-profile" src="assets/img/avatars/avatar1.png"></a>
                                        <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in"><a class="dropdown-item" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a>
                                        </div>
                                    </div>
                                </li>
                        </ul>
                    </div>
                </nav>


                <!--

    Your Code Goes Here
-->

                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Add Discussion Topic</h3>
                    <div class="card shadow">

                        <div class="card-body">
                            <div class="form-group">
                                <input class="form-control form-control-user" type="text" id="topic" aria-describedby="emailHelp" placeholder="Concise Title" name="statement">
                            </div>
                            <button class="btn btn-primary text-white btn-user" type="submit" style="float:right">Add</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
</body>

</html>