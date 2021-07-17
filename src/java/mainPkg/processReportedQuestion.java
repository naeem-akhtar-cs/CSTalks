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
public class processReportedQuestion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int questionID=Integer.parseInt(request.getParameter("questionID"));
        
        String selection = request.getParameter("actions");

        if (selection.equals("delete")) {
            new databaseClass().deleteQuestion(questionID);
            request.getSession().setAttribute("alert-message", "Question Deleted");
        } 
        else{
            request.getSession().setAttribute("alert-message", "Request Rejecteds");
        }
        //delete request
        new databaseClass().deleteReport(questionID);
        
        response.sendRedirect("delete-question-requests.jsp");
        
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
