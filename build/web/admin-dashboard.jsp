<%@page import="BeansPkg.websiteStatistics"%>
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

</head>

<body id="page-top">


            <% 
                if(session.getAttribute("adminEmail")==null){
                    response.sendRedirect("login.jsp");
            }
            %>

            <jsp:useBean id="webStats" class="BeansPkg.websiteStatistics" scope="page"></jsp:useBean>
            
    <div id="wrapper">
        
        <jsp:include page="admin-menu.jsp" />


        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                
                <jsp:include page="admin-navigation.jsp"/>

                <div class="container-fluid">
                    <div class="d-sm-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-dark mb-0">Admin Dashboard</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-left-primary py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-primary font-weight-bold text-xs mb-1"><span>Users Visited</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span><%= webStats.getUserVisits() %></span></div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-calendar fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-left-success py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-success font-weight-bold text-xs mb-1"><span>Questions Asked</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span><%= webStats.getQuestionsAsked() %></span></div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-dollar-sign fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-left-info py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-info font-weight-bold text-xs mb-1"><span>Questions Reported</span></div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="text-dark font-weight-bold h5 mb-0 mr-3"><span><%= webStats.getQuestionsReported() %></span></div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-clipboard-list fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xl-3 mb-4">
                            <div class="card shadow border-left-warning py-2">
                                <div class="card-body">
                                    <div class="row align-items-center no-gutters">
                                        <div class="col mr-2">
                                            <div class="text-uppercase text-warning font-weight-bold text-xs mb-1"><span>Answers</span></div>
                                            <div class="text-dark font-weight-bold h5 mb-0"><span><%= webStats.getQuestionsAnswered() %></span></div>
                                        </div>
                                        <div class="col-auto"><i class="fas fa-comments fa-2x text-gray-300"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6 mb-4">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="text-primary font-weight-bold m-0">Trending Topics</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold"><%= webStats.gettopic(1) %><span class="float-right"><%= webStats.getpercentage(1) %>%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" aria-valuenow="<%= webStats.getpercentage(1) %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= webStats.getpercentage(1) %>%;"><span class="sr-only"><%= webStats.getpercentage(1) %>%</span></div>
                                    </div>
                                    <h4 class="small font-weight-bold"><%= webStats.gettopic(2) %><span class="float-right"><%= webStats.getpercentage(2) %>%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning" aria-valuenow="<%= webStats.getpercentage(2) %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= webStats.getpercentage(2) %>%;"><span class="sr-only"><%= webStats.getpercentage(2) %>%</span></div>
                                    </div>
                                    <h4 class="small font-weight-bold"><%= webStats.gettopic(3) %><span class="float-right"><%= webStats.getpercentage(3) %>%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-primary" aria-valuenow="<%= webStats.getpercentage(3) %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= webStats.getpercentage(3) %>%;"><span class="sr-only"><%= webStats.getpercentage(3) %>%</span></div>
                                    </div>
                                    <h4 class="small font-weight-bold"><%= webStats.gettopic(4) %><span class="float-right"><%= webStats.getpercentage(4) %>%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" aria-valuenow="<%= webStats.getpercentage(4) %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= webStats.getpercentage(4) %>%;"><span class="sr-only"><%= webStats.getpercentage(4) %>%</span></div>
                                    </div>
                                    <h4 class="small font-weight-bold"><%= webStats.gettopic(5) %><span class="float-right"><%= webStats.getpercentage(5) %>%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-success" aria-valuenow="<%= webStats.getpercentage(5) %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= webStats.getpercentage(5) %>%;"><span class="sr-only"><%= webStats.getpercentage(5) %>%</span></div>
                                    </div>

                                    <% webStats.resetindex(); %>

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
</body>

</html>