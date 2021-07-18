<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Request New Topic - CSTALKS</title>
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

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>

<body id="page-top">
    <div id="wrapper">
        
        <% 
        if(session.getAttribute("email")==null){
            response.sendRedirect("index.jsp");
        }
        %>

        <jsp:include page="menu.jsp" />

        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                
                <jsp:include page="navigation.jsp" />

                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Request Admin to Add New Topic</h3>
                    <div class="card shadow">

                        <div class="card-body">
                            <div>Topic Title should be Short, Clear and Concise:</div>
                            </br>
                            <form method="POST" action="http://localhost:8080/CSTalks/requestTopic" >
                            <div class="form-group">
                                <input class="form-control form-control-user" type="text" id="topic" aria-describedby="emailHelp" placeholder="Title" name="statement">
                            </div>
                            <button class="btn btn-primary text-white btn-user" type="submit" style="float:right">Request</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
        </footer>
    </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>

    <% if(session.getAttribute("alert-message")!=null){ %>
        <jsp:include page="alert.jsp" />
    <% } session.removeAttribute("alert-message"); %>

</body>

</html>