<!DOCTYPE html>
<html lang="Eng">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Question - CSTALKS</title>
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
        .btn1 {
            border: none;
            border-radius: 12px;
            background-color: inherit;
            padding: 13px 13px;
            font-size: 13px;
            cursor: pointer;
            display: inline-block;
        }
        
        .btn1:hover {
            background: #eee;
        }
        
        .success {
            color: green;
        }
        
        .danger {
            color: red;
        }
        
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
        
        <jsp:include page="menu.jsp" />

        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                
                <jsp:include page="navigation.jsp" />


                <!--

    Your Code Goes Here
-->

                <div class="container-fluid">
                    <h2 class="text-dark mb-4">OOP</h2>
                    <!--topic of question-->

                    <div class="card shadow">

                        <div class="card-body">
                            <div class="row">

                                <div class="d-table w-100">
                                    <td>What are Draw Backs of Inheritance?</td>
                                    <div class="d-table-cell tar">
                                        <i class="fa fa-bookmark" aria-hidden="true" style="font-size:24px;"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br>
                    <button class="btn btn-primary btn-sm" type="button" style="background-color: green;">Add to BookMark</button>
                    <button class="btn btn-primary btn-sm" type="button" style="background-color: rgb(235, 43, 43); border: #eee; margin-left: 20%;">Report Question</button>
                    <div style="text-align:right">Posted by : <span style="float : right;"><a href="#">Samran Waheed</a></span></div>
                    <div style="text-align:right">Asked : Sep 20, 1999</div>


                    <div>
                        <h2 class="text-dark mb-4">Answers</h2>
                        <!-- Answer 1-->
                        <p class="text-dark mb-4">Inherited functions work slower than normal function as there is indirection.</p>
                        <div class="d-table w-100">
                            <button class="btn success">UpVote</button>
                            <button class="btn danger">DownVote</button>
                            <div class="d-table-cell tar">
                                <p style="text-align:right">Posted by: <span style="float : right;"><a href="#" >Samran Waheed</a></span></p>
                            </div>
                        </div>
                        <p style="text-align:right">Answered : Sep 20, 1999</p>

                        <hr>
                        <!-- Answer 2-->

                        <p class="text-dark mb-4">Often, data members in the base class are left unused which may lead to memory wastage.</p>
                        <div class="d-table w-100">
                            <button class="btn success">UpVote</button>
                            <button class="btn danger">DownVote</button>
                            <div class="d-table-cell tar">
                                <p style="text-align:right">Posted by : <span style="float : right;"><a href="#" >Sameen Akram</a></span></p>
                            </div>
                        </div>
                        <p style="text-align:right">Answered : Sep 20, 1999</p>

                        <hr>

                        <!-- Answer 3-->

                        <p class="text-dark mb-4">Inheritance increases the coupling between base class and derived class. A change in base class will affect all the child classes.</p>
                        <div class="d-table w-100">
                            <button class="btn1 success">UpVote</button>
                            <button class="btn1 danger">DownVote</button>
                            <div class="d-table-cell tar">
                                <p style="text-align:right">Posted by : <span style="float : right;"><a href="#" >Sameen Akram</a></span></p>
                            </div>
                        </div>
                        <p style="text-align:right">Answered : Sep 20, 1999</p>

                        <hr>

                        <div class="container-fluid">
                            <h3 class="text-dark mb-4">Answer this question</h3>

                            <div class="card shadow">

                                <div class="card-body">
                                    <div class="form-group">
                                        <input class="form-control form-control-user" type="text" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Your Answer" name="answer">
                                    </div>
                                    <button class="btn btn-primary text-white btn-user" type="submit" style="float:right">Post</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
            </footer>
        </div>
    </div>
</body>

</html>