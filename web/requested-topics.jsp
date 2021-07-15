<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Requested Topis - CSTALKS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
</head>

<body id="page-top">

    <% if(session.getAttribute("adminEmail")==null){ response.sendRedirect("login.jsp"); } %>

        <jsp:useBean id="topics" class="BeansPkg.requestedTopicsHelper" scope="page"></jsp:useBean>

        <div id="wrapper">

            <jsp:include page="admin-menu.jsp" />

            <div class="d-flex flex-column" id="content-wrapper">
                <div id="content">

                    <jsp:include page="admin-navigation.jsp" />

                    <div class="container-fluid">
                        <h3 class="text-dark mb-4">Topics Requested by Users</h3>
                        <div class="card shadow">

                            <div class="card-body">

                                <div class="table-responsive table mt-2" id="dataTable" role="grid"
                                    aria-describedby="dataTable_info">
                                    <table class="table my-0" id="dataTable">
                                        <thead>
                                            <tr>
                                                <th>Title</th>
                                                <th>Date Requested</th>
                                                <th>Requested By</th>
                                                <th>Select Action</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <% for(int i=0;i<topics.getSize();i++){ %>
                                                <tr>
                                                    <form method="POST" action="http://localhost:8080/CSTalks/processRequestedTopics">
                                                        
                                                        <input type="hidden" name="topic" value="<%= topics.getTitle(i) %>"/>

                                                        <td>
                                                            <%= topics.getTitle(i) %>
                                                        </td>
                                                        <td>
                                                            <%= topics.getDateRequested(i) %>
                                                        </td>
                                                        <td><a href="">
                                                                <%= topics.getRequestedBy(i) %>
                                                            </a></td>
                                                        <td>
                                                            <div class="d-table-cell tar">

                                                                <select name="actions">
                                                                    <option value="reject">Reject</option>
                                                                    <option value="add">Add to List</option>
                                                                </select>
                                                                <br><br>

                                                            </div>
                                                        </td>
                                                        
                                                        <td>
                                                            <div class="mb-3"><input value="Proceed" class="btn btn-primary btn-sm" type="submit"/></div>
                                                        </td>
                                                    </form>
                                                </tr>
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
</body>

</html>