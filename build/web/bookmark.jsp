<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - CSTALKS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
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
                    <li class="nav-item"><a class="nav-link active" href="user-profile.jsp"><i class="fas fa-user"></i><span>Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="notes.jsp"><i class="fas fa-table"></i><span>Check Personal Notes</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="search-questions.jsp"><i class="fas fa-table"></i><span>Search Questions</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="bookmark.jsp"><i class="fas fa-table"></i><span>BookMarked Questions</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="ask-question.jsp"><i class="fas fa-table"></i><span>Ask Question</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="request-topic.jsp"><i class="fas fa-table"></i><span>Request New Topic</span></a></li>

                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                            </div>
                        </form>
                        <ul class="navbar-nav flex-nowrap ml-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>

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
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Bookmarks</h3>
                    <div class="card shadow">

                        <div class="card-body">

                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>Questions </th>
                                            <th>Category</th>
                                        </tr>




                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td><a href="#">What does ACID stand for in Database?</a></td>
                                            <td>Database</td>
                                        </tr>


                                        <tr>
                                            <td><a href="#">Why do we use Transactions in Database?</a></td>
                                            <td>Database</td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">What is Difference Between Dynamic and Static Ploymorphism?</a></td>
                                            <td>OOP</td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">What is Ton for Air Conditioner mean?</a></td>
                                            <td>General</td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">What are Draw Backs of Inheritance?</a></td>
                                            <td>OOP</td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">What is Static in Java Programming? </a></td>
                                            <td>OOP</td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <a href="#">What is the one thing that you would like to do in your Life?</a>
                                                <td>General</td>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <a href="#">Who was Dena Wadia?</a>
                                                <td>General Knowledge</td>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <a href="#">Who was Emma Wegenast?</a>
                                                <td>General Knowledge</td>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Why main() function is static in Java and NOT in C++ Programming Language?</a></td>
                                            <td>Java Programming (OOP)</td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Why we don't Need Object Reference to call a Static Function?</a></td>
                                            <td>OOP</td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Why do we need Trees eventhough we have LinkedLists?</a></td>
                                            <td>Data Structures</td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Why we have to make Constructor and Destructor Virtual in C++ while implementing Ploymorphism?</a></td>
                                            <td>C++ Programming</td>
                                        </tr>

                                    </tbody>

                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-6 align-self-center">
                                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 13 of 77</p>
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