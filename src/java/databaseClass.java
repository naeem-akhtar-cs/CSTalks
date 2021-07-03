
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author naeem
 */
public class databaseClass {

    private Connection con;
    
    public databaseClass() {
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s = "jdbc:sqlserver://localhost:1433;databaseName=ap_project";
            this.con = DriverManager.getConnection(s, "user", "123");
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public Boolean DBSignUP(String fName, String lName, String useremail, String password, String repeatPassword) {
        
        Boolean check=true;
        
        try {

//            String str = "select* from common_user";
//            Statement stmt1 = con.createStatement();
//            ResultSet rs1 = stmt1.executeQuery(str);

//            String s1 = "select* from common_user where common_user.email=?";
//            
//            PreparedStatement PS = con.prepareStatement(s1);
//            
//            PS.setString(1, useremail);
//            
//            ResultSet rs = PS.executeQuery();
//            
//            rs.last();

           // if (rs.getRow() == 0) {//No User with this email

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
                LocalDateTime now = LocalDateTime.now();
                Statement stmt = con.createStatement();
                String s1 = "select max(ID) as ID from common_user";
                ResultSet rs = stmt.executeQuery(s1);
                rs.next();
                int user_ID = Integer.parseInt(rs.getString("ID")); //Getting Max Existing ID of Users
                System.out.println("Max ID is: " + user_ID);

                user_ID++;
                String insert = "insert into common_user (ID, email, fName, lName, date_joined, user_status, user_password)"
                        + " values(?,?,?,?,?,?,?)";

                PreparedStatement preparedStmt = con.prepareStatement(insert);

                preparedStmt.setInt(1, user_ID);
                preparedStmt.setString(2, useremail);
                preparedStmt.setString(3, fName);
                preparedStmt.setString(4, lName);
                preparedStmt.setString(5, dtf.format(now));
                preparedStmt.setInt(6, 1);
                preparedStmt.setString(7, password);

                preparedStmt.execute();
                con.close();
                
            // check=true;   
           // }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return check;
    }

    public Boolean DBSignin(String useremail, String password){
        
        Boolean check=false;
        
        try {
            Statement stmt = con.createStatement();
            
            String s1 = "select user_password from common_user where email='"+useremail+"'";
            
            ResultSet rs = stmt.executeQuery(s1);
            
            if(rs.next()){
            
            String pass=rs.getString("user_password");
            
            if(pass.equals(password)){
                check=true;
            }
            }
             } catch (SQLException ex) {
            Logger.getLogger(databaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
            return check;
    }
}
