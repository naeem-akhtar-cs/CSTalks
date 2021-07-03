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
    public void init(ServletConfig config) throws ServletException
    {
        this.dataBaseName=config.getInitParameter("databaseName"); //Initializing Parameters
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String fName=request.getParameter("first_name");
        String lName=request.getParameter("last_name");
            
        String email=request.getParameter("email");
        
        String password=request.getParameter("password");
        String repeatPassword=request.getParameter("password_repeat");
        
        try (PrintWriter out = response.getWriter()) {
            //out.println("<h1>"+fName+"</br>"+lName+"</br>"+email+"</br>"+password+"</br>"+repeatPassword+"</br>"+"</h1>");
        
            databaseClass obj=new databaseClass();
            obj.DBSignUP(fName, lName, email, password, repeatPassword);
            
            response.sendRedirect("register.html");
            
//            if(obj.DBSignUP(fName, lName, email, password, repeatPassword)){
//                response.sendRedirect("user-profile.html");
//            }
//            else{
//                response.sendRedirect("register.html");
//            }
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
        System.out.println("POST");
        
            processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}