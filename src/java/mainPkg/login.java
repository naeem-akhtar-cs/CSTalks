package mainPkg;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author naeem
 */

public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String email=request.getParameter("email");
        
        String password=request.getParameter("password");
        
        try (PrintWriter out = response.getWriter()) {
            
            databaseClass DB=new databaseClass();
            switch (DB.DBSignin(email, password)) {
                case 1:
                    //User login
                    
                    //ServletContext context=getServletContext();
                    //                request.setAttribute("databaseName", "ap");
//
//                RequestDispatcher RD=context.getRequestDispatcher("/user-profile.jsp");
//                RD.include(request, response);
//
                    
                    HttpSession session=request.getSession();
                    session.setAttribute("email", email);
                    response.sendRedirect("user-profile.jsp");
                    
                    break;
                    
            //Admin Login
                case 2:
                    HttpSession adminSession=request.getSession();
                    adminSession.setAttribute("adminEmail", email);
                    response.sendRedirect("admin-dashboard.jsp");
                    
                    break;
                    
                default:
                    response.sendRedirect("login.jsp");
                    break;
            }
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
