<nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>

        <jsp:useBean id ="user" class = "BeansPkg.userprofile" scope="page"></jsp:useBean>
            <% 
                if(session.getAttribute("email")==null){
                    response.sendRedirect("index.jsp");
            }
            else{
                user.getData((String)session.getAttribute("email")); 
            }
            %>
        
        <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" method="POST" action="http://localhost:8080/CSTalks/addNote" name="add-note">
            <div class="input-group">
                <input class="bg-light form-control border-0 small" name="note" id="note1" type="text" placeholder="Add Note">
                <button class="btn btn-primary py-0" type="submit">+</button>        
            </div>
        </form>

        <ul class="navbar-nav flex-nowrap ml-auto">
            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                <div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" aria-labelledby="searchDropdown">
                    
                    <form class="form-inline mr-auto navbar-search w-100" method="POST" action="http://localhost:8080/CSTalks/addNote" name="add-note">
                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Add note">
                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                        </div>
                    </form>
                    
                </div>
            </li>

            <li class="nav-item dropdown no-arrow">
                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small"><jsp:getProperty name="user" property="fullName"/></span><img class="border rounded-circle img-profile" src="assets/img/avatars/avatar1.png"></a>
                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in"><a class="dropdown-item" href="user-profile.jsp"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a>

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