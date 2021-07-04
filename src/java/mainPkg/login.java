package mainPkg;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
            
            databaseClass obj=new databaseClass();
            if(obj.DBSignin(email, password)){
                
                ServletContext context=getServletContext();
                
                //RequestDispatcher RD=context.getRequestDispatcher("/user-profile.jsp");
                //RD.include(request, response);
                
                HttpSession session=request.getSession();
                session.setAttribute("email", email);
                
                response.sendRedirect("user-profile.jsp");
            }
            else{
                response.sendRedirect("login.jsp");
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
