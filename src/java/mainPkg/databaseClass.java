package mainPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
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

        Boolean check = true;

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

    public Boolean DBSignin(String useremail, String password) {

        Boolean check = false;

        try {
            Statement stmt = con.createStatement();

            String s1 = "select user_password from common_user where email='" + useremail + "'";

            ResultSet rs = stmt.executeQuery(s1);

            if (rs.next()) {

                String pass = rs.getString("user_password");

                if (pass.equals(password)) {
                    check = true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(databaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;
    }

    public HashMap<String, String> getUserData(String email) {

        HashMap<String, String> userData = new HashMap<>();

        try {

            String query = "select ID, email, fName, lName, useraddress, city, province from common_user where email=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, email);

            ResultSet RS = PS.executeQuery();
            RS.next();

            userData.put("ID", RS.getString("ID"));
            userData.put("email", RS.getString("email"));
            userData.put("fName", RS.getString("fName"));
            userData.put("lName", RS.getString("lName"));
            userData.put("address", RS.getString("useraddress"));
            userData.put("city", RS.getString("city"));
            userData.put("province", RS.getString("province"));

            this.con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return userData;
    }

    public ArrayList<HashMap<String, String>> getQuestions() {

        ArrayList<HashMap<String, String>> questions = new ArrayList<>();

        try {
            String query = "select question_statement, title as categoryTitle from questions join categories on "
                    + "questions.ID=categories.ID";

            PreparedStatement PS = con.prepareStatement(query);

            ResultSet RS = PS.executeQuery();

            while (RS.next()) {
                HashMap<String, String> question = new HashMap<>();

                question.put("statement", RS.getString("question_statement"));
                question.put("category", RS.getString("categoryTitle"));

                questions.add(question);

            }
            this.con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return questions;
    }

    public ArrayList<HashMap<String, String>> getBookMarks(String email) {

        ArrayList<HashMap<String, String>> questions = new ArrayList<>();

        try {
            String query = "select question_statement, title as categoryTitle from bookMarks join questions on "
                    + "bookMarks.ID=questions.ID join categories on questions.category=categories.ID join common_user on "
                    + "bookMarks.owner_id=common_user.ID where common_user.email=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, email);
            
            ResultSet RS = PS.executeQuery();

            while (RS.next()) {
                HashMap<String, String> question = new HashMap<>();

                question.put("statement", RS.getString("question_statement"));
                question.put("category", RS.getString("categoryTitle"));

                questions.add(question);
            }
            this.con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return questions;
    }
    
    public ArrayList<String> getCategories() {
        ArrayList<String> list = new ArrayList<>();

        try {
            String query = "select title from categories";

            PreparedStatement PS = con.prepareStatement(query);

            ResultSet RS = PS.executeQuery();

            while (RS.next()) {
               list.add(RS.getString("title"));
            }
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public void insertQuestion(String statement, String category){
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();
            
            Statement stmt = con.createStatement();
            String s1 = "select max(ID) as ID from questions";
            ResultSet rs = stmt.executeQuery(s1);
            rs.next();
            int question_ID = Integer.parseInt(rs.getString("ID")); //Getting Max Existing ID of Questions
            
            
            String query="select ID from categories where categories.title=?";
            
            PreparedStatement PS=con.prepareStatement(query);
            
            PS.setString(1, category);
            
            ResultSet RS=PS.executeQuery();
            
            RS.next();
            
            int categoryID=Integer.parseInt(RS.getString("ID"));
            
            String query2="insert into questions values(?,?,?,?)";
            
            PreparedStatement PS2=con.prepareStatement(query2);
            
            
            
            question_ID++;
            
            PS2.setInt(1, question_ID);
            PS2.setString(2, statement);
            PS2.setInt(3, categoryID);
            PS2.setString(4, dtf.format(now));
            
            PS2.executeQuery();
            
            con.close();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }
    
    public ArrayList<HashMap<String, String>> getNotes(String email){
        
        ArrayList<HashMap<String, String>> notes = new ArrayList<>();

        try {
            String query = "select note, date_added from notes join common_user on notes.owner_id=common_user.ID where common_user.email=?";
            
            PreparedStatement PS = con.prepareStatement(query);
            
            PS.setString(1, email);
            
            ResultSet RS = PS.executeQuery();

            while (RS.next()) {
                HashMap<String, String> myNote = new HashMap<>();

                myNote.put("note", RS.getString("note"));
                myNote.put("date", RS.getString("date_added"));

                notes.add(myNote);
            }
            this.con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return notes;
    }
    
    public void addRequestedTopic(String topic, String email){
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();
            
            
            String query="select ID from common_user where email=?";
            
            PreparedStatement PS=con.prepareStatement(query);
            
            PS.setString(1, email);
            
            ResultSet RS=PS.executeQuery();
            
            RS.next();
            
            int userID=Integer.parseInt(RS.getString("ID"));
            
            
            String query1="insert into requestedTopics values(?,?,?)";
            
            PreparedStatement PS1=con.prepareStatement(query1);
            
            PS1.setString(1, topic);
            PS1.setString(2, dtf.format(now));
            PS1.setInt(3, userID);
            
            
            PS1.executeQuery();
            
            con.close();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
