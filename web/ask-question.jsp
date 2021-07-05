<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Ask Question - CSTALKS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
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

    

    <jsp:useBean id="category" class="BeansPkg.categoriesHelper" scope="page"></jsp:useBean>

    <jsp:useBean id="categoryVal" class="BeansPkg.categoriesHelper" scope="page"></jsp:useBean>

    <% 
        if(session.getAttribute("email")==null){
            response.sendRedirect("login.jsp");
        }
    %>

    <div id="wrapper">
        
        <jsp:include page="menu.jsp" />

        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                
                
                <jsp:include page="navigation.jsp" />

                <!--

    Your Code Goes Here
-->

                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Post a Question</h3>
                    <p>
                    <div class="card shadow">

                        <div class="card-body">
                            <form method="POST" action="http://localhost:8080/CSTalks/askquestion" name="ask-question-form">
                                <div class="d-table w-100">
                                    <p class="text-dark mb-4">Category of question : </p>

                                    <div class="d-table-cell tar">
                                            <select name="categories">

                                                <% for(int i=0;i<category.getcount();i++){ %>

                                                    <!--Need to change this approach
                                                    Not Good Practice-->

                                                    <option value=
                                                    "<jsp:getProperty name="categoryVal" property="title" />"
                                                    >
                                                        <jsp:getProperty name="category" property="title" />
                                                    </option>

                                                    <% } category.resetIndex(); categoryVal.resetIndex();%>

                                            </select>
                                            <br><br>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <input class="form-control form-control-user" type="text" id="exampleInputEmail"
                                        aria-describedby="emailHelp" placeholder="Question statement" name="statement">
                                </div>

                                <button class="btn btn-primary text-white btn-user" type="submit"
                                    style="float:right">Post</button>

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
</body>

</html>