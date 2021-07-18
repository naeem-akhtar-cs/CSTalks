package mainPkg;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author naeem
 */
public class signup extends HttpServlet {

    String dataBaseName;

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.dataBaseName = config.getInitParameter("databaseName"); //Initializing Parameters
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String fName = request.getParameter("first_name");
        String lName = request.getParameter("last_name");

        String email = request.getParameter("email");

        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("password_repeat");

        //Server Side Authentication
        if(!password.equals(repeatPassword)){ //If Password and RepeatPassword are not same
            request.getSession().setAttribute("alert-message", "Password and RepeatPassword must be same");
            response.sendRedirect("register.jsp");
        }
        else if(fName.isEmpty() || lName.isEmpty() || email.isEmpty()){
            request.getSession().setAttribute("alert-message", "Please fill are the fields");
            response.sendRedirect("register.jsp");
        }
        else{
        databaseClass obj = new databaseClass();
        
        if(obj.DBSignUP(fName, lName, email, password, repeatPassword)){ //Data Inserted

        request.getSession().setAttribute("alert-message", "Signup SUCCESSFULL!! Please login");
        response.sendRedirect("index.jsp");
        }
        else{ //Data not Inserted returned false
            request.getSession().setAttribute("alert-message", "Email provided already exists");
            response.sendRedirect("register.jsp");
        }
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
        System.out.println("POST");

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
