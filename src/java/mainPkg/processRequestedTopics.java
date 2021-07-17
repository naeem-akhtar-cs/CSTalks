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
public class processRequestedTopics extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String topic = request.getParameter("topic");
        String selection = request.getParameter("actions");

        databaseClass DB = new databaseClass();
        if (selection.equals("add")) {
            DB.addTopic(topic);
            request.getSession().setAttribute("alert-message", "Topic approved");
        } 
        else{
             request.getSession().setAttribute("alert-message", "Topic deleted");
        }
        //delete request
        DB.deleteRequestedTopic(topic);
        
        response.sendRedirect("requested-topics.jsp");
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
