<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>

        <jsp:useBean id ="user" class = "BeansPkg.adminprofile" scope="page"></jsp:useBean>
            <% 
                if(session.getAttribute("adminEmail")==null){
                    response.sendRedirect("login.jsp");
            }
            else{
                user.getData((String)session.getAttribute("adminEmail")); 
            }
            %>
        
        <!-- Sending note without refreshing the page -->

        <script>
            function ajaxpost(){
              // (A) GET FORM DATA
              var data = new FormData();
              data.append("name", document.getElementById("note1").value);
             
              // (B) AJAX
              var xhr = new XMLHttpRequest();
              xhr.open("POST", "http://localhost:8080/CSTalks/addNote");
              // What to do when server responds
              xhr.onload = function(){ console.log(this.response); };
              xhr.send(data);
             
              // (C) PREVENT HTML FORM SUBMIT
              return false;
            }
        </script>


        <ul class="navbar-nav flex-nowrap ml-auto">
            <li class="nav-item dropdown no-arrow">
                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small"><jsp:getProperty name="user" property="fullName"/></span><img class="border rounded-circle img-profile" src="assets/img/avatars/avatar1.png"></a>
                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in"><a class="dropdown-item" href="admin-profile.jsp"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a>

                        <div class="dropdown-divider"></div>
                        
                        <form method="POST" action="http://localhost:8080/CSTalks/signout">
                            <button placeholder="Logout" type="submit" class="dropdown-item" class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400" name="Logout">
                            Logout</button>
                        </form>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>