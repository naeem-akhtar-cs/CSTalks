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

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    
</head>

<body id="page-top">

    <% 
                if(session.getAttribute("adminEmail")==null){
                    response.sendRedirect("index.jsp");
            }
            %>

            <jsp:useBean id="questions" class="BeansPkg.questionshelper" scope="page"></jsp:useBean>

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
                                            <th>Question</th>
                                            <th>Category</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <% for(int i=0;i<questions.getSize();i++){ %>
                                            <form method="POST"
                                                action="http://localhost:8080/CSTalks/deleteQuestion">
                                                <input type="hidden" name="questionID" value="<%= questions.getQuestionID(i) %>" />
                                                <tr>
                                                    <td>
                                                        <div>
                                                            <%= questions.getStatement(i) %>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <%= questions.getCategory(i) %>
                                                    </td>
                                                    
                                                    <td>
                                                        <div class="mb-3"><input type="submit" class="btn btn-primary btn-sm" value="Remove"/></div>
                                                    </td>

                                                </tr>
                                            </form>
                                            <% } %>

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

    <% if(session.getAttribute("alert-message")!=null){ %>
        <jsp:include page="alert.jsp" />
    <% } session.removeAttribute("alert-message"); %>

</body>

</html>