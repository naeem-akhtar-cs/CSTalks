<%@page import="BeansPkg.answer" %>
    <%@page import="java.util.ArrayList" %>
        <!DOCTYPE html>
        <html lang="Eng">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
            <title>Question - CSTALKS</title>
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

            <link rel="stylesheet" href="assets/css/style.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
            <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

        </head>

        <body id="page-top">

            <% if(session.getAttribute("email")==null){ response.sendRedirect("login.jsp"); } %>

                <jsp:useBean id="questions" class="BeansPkg.questionshelper" scope="page"></jsp:useBean>

                <div id="wrapper">

                    <jsp:include page="menu.jsp" />

                    <div class="d-flex flex-column" id="content-wrapper">
                        <div id="content">

                            <jsp:include page="navigation.jsp" />

                            <% for(int i=0;i<questions.getSize();i++){ %>
                                <div class="container-fluid">
                                    <div class="card shadow">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="d-table w-100">
                                                    <td>
                                                        <%= questions.getStatement(i) %>(<%= questions.getCategory(i) %>
                                                                )
                                                    </td>
                                                    <div class="d-table-cell tar">
                                                        <i class="fa fa-bookmark" aria-hidden="true"
                                                            style="font-size:24px;"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>


                                    <table class="table my-0" id="dataTable">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <form method="POST"
                                                        action="http://localhost:8080/CSTalks/addToBookMark">

                                                        <input type="hidden" name="questionID"
                                                            value="<%= questions.getQuestionID(i) %>" />

                                                        <button class="btn btn-primary btn-sm" type="submit"
                                                            style="background-color: green;">Add to BookMark</button>

                                                    </form>
                                                </td>
                                                <td>
                                                    <form method="POST"
                                                        action="http://localhost:8080/CSTalks/reportQuestion">

                                                        <input type="hidden" name="questionID"
                                                            value="<%= questions.getQuestionID(i) %>" />

                                                        <button class="btn btn-primary btn-sm" type="submit"
                                                            style="background-color: rgb(235, 43, 43); border: #eee; margin-left: 20%;">Report
                                                            Question</button>

                                                    </form>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>





                                    <div style="text-align:right">Posted by: <%= questions.getpostedBy(i) %></span>
                                    </div>
                                    <div style="text-align:right">Date Asked: <%= questions.getDateAsked(i) %>
                                    </div>

                                    <hr color="blue">

                                    <div>
                                        <h3 class="text-dark mb-4">Answers</h3>
                                        <hr color="blue">

                                        <% //arraylist contains all the answers of question id ArrayList<answer>
                                            ArrayList<answer> answers=questions.getAnswers(i);

                                                for(int j=0;j<answers.size();j++){ %>

                                                    <p class="text-dark mb-4">
                                                        <%= answers.get(j).getStatement() %>
                                                    </p>
                                                    <div class="d-table w-100">
                                                        <div class="d-table-cell tar">
                                                            <p style="text-align:right">Answered by: <%=
                                                                    answers.get(j).getAnsweredBy() %></span></p>
                                                        </div>
                                                    </div>
                                                    <p style="text-align:right">Date Answered: <%=
                                                            answers.get(j).getAnsweredDate() %>
                                                    </p>

                                                    <hr color="blue">

                                                    <% } %>

                                                        <div class="container-fluid">
                                                            <div class="card shadow">

                                                                <div class="card-body">
                                                                    <form method="POST"
                                                                        action="http://localhost:8080/CSTalks/addAnswer">
                                                                        <input type="hidden" name="questionID"
                                                                            value="<%= questions.getQuestionID(i) %>" />
                                                                        <div class="form-group">
                                                                            <input
                                                                                class="form-control form-control-user"
                                                                                type="text" placeholder="Your Answer"
                                                                                name="answer">
                                                                        </div>
                                                                        <button
                                                                            class="btn btn-primary text-white btn-user"
                                                                            type="submit"
                                                                            style="float:right">Post</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                    </div>
                                </div>
                                <br>
                                <hr color="red">
                                <% } %>
                        </div>
                    </div>
                </div>

                <% if(session.getAttribute("alert-message")!=null){ %>
                    <jsp:include page="alert.jsp" />
                <% } session.removeAttribute("alert-message"); %>
        
            </body>

        </html>