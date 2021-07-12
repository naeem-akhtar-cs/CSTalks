<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Delete Question - CSTALKS</title>
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
                    <h3 class="text-dark mb-4">Questions</h3>
                    <div class="card shadow">

                        <div class="card-body">

                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>Questions Related to Search Query</th>
                                            <th>Category</th>
                                            <th>Action</th>
                                        </tr>




                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td><a href="#">What does ACID stand for in Database?</a></td>
                                            <td>Database</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td><a href="#">Why do we use Transactions in Database?</a></td>
                                            <td>Database</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">What is Difference Between Dynamic and Static Ploymorphism?</a></td>
                                            <td>OOP</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">What is Ton for Air Conditioner mean?</a></td>
                                            <td>General</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">What are Draw Backs of Inheritance?</a></td>
                                            <td>OOP</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">What is Static in Java Programming? </a></td>
                                            <td>OOP</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <a href="#">What is the one thing that you would like to do in your Life?</a>
                                                <td>General</td>
                                                <td>
                                                    <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                                </td>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <a href="#">Who was Dena Wadia?</a>
                                                <td>General Knowledge</td>
                                                <td>
                                                    <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                                </td>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <a href="#">Who was Emma Wegenast?</a>
                                                <td>General Knowledge</td>
                                                <td>
                                                    <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                                </td>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Why main() function is static in Java and NOT in C++ Programming Language?</a></td>
                                            <td>Java Programming (OOP)</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Why we don't Need Object Reference to call a Static Function?</a></td>
                                            <td>OOP</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Why do we need Trees eventhough we have LinkedLists?</a></td>
                                            <td>Data Structures</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td><a href="#">Why we have to make Constructor and Destructor Virtual in C++ while implementing Ploymorphism?</a></td>
                                            <td>C++ Programming</td>
                                            <td>
                                                <div class="mb-3"><button class="btn btn-primary btn-sm" type="button">Remove</button></div>
                                            </td>
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