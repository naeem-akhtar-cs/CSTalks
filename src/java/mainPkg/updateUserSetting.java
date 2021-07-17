/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainPkg;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author naeem
 */
public class updateUserSetting extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String userEmail = (String) request.getSession().getAttribute("email");

        String fName = request.getParameter("first_name");
        String lName = request.getParameter("last_name");

        String userAge = request.getParameter("age");
        int age = 0;

        try {
            age = Integer.parseInt(userAge);

            String university = request.getParameter("university");

            databaseClass DB = new databaseClass();

            DB.updateUserSetting(userEmail, fName, lName, age, university);

            request.getSession().setAttribute("alert-message", "User setting updated");
            
        } catch (Exception ex) {
            request.getSession().setAttribute("alert-message", "Age can not be a character");
        }

        response.sendRedirect("user-profile.jsp"); 
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
    }// </editor-fold>

}
