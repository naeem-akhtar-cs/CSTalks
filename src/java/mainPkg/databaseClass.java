package mainPkg;

import BeansPkg.answer;
import BeansPkg.questionDetailPage;
import BeansPkg.trend;
import BeansPkg.userprofile;
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

            //Local Database Connection
            /*Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        this.con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ap_project","user","123");
             */
            //Amazon Remote Database Connection
            Class.forName("com.mysql.jdbc.Driver");
            this.con = DriverManager.getConnection("jdbc:mysql://ls-2443773d57df68ead19c2450b12c6e6268f31f3f.c1whsvsm4xkg.ap-southeast-1.rds.amazonaws.com:3306/ap_project?characterEncoding=latin1&useConfigs=maxPerformance", "user", "Kz<)K{3&JIg~_vnXgL=y~5>JZDci*Bmp");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public Boolean DBSignUP(String fName, String lName, String useremail, String password, String repeatPassword) {

        Boolean check = true;

        try {

            //First CHeck if email entered already exists or not
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

    public int DBSignin(String useremail, String password) {

        int check = 0;

        try {
            Statement stmt = con.createStatement();

            String s1 = "select user_password, ID from common_user where email='" + useremail + "'";

            ResultSet rs = stmt.executeQuery(s1);

            if (rs.next()) {

                String pass = rs.getString("user_password");
                int userID = rs.getInt("ID");

                if (pass.equals(password)) {
                    check = 1;

                    String addUser = "insert into userLogins values(?, ?)";
                    PreparedStatement PS = con.prepareStatement(addUser);

                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH/mm/ss");
                    LocalDateTime now = LocalDateTime.now();

                    PS.setInt(1, userID);
                    PS.setString(2, dtf.format(now));

                    PS.executeUpdate();

                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(databaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (check == 0) { //Check credentials for admin
            try {
                Statement stmt = con.createStatement();

                String s1 = "select user_password from admin_user where email='" + useremail + "'";

                ResultSet rs = stmt.executeQuery(s1);

                if (rs.next()) {

                    String pass = rs.getString("user_password");

                    if (pass.equals(password)) {
                        check = 2;
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

            try {
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return check;
    }

    public HashMap<String, String> getUserData(String email) {

        HashMap<String, String> userData = new HashMap<>();

        try {

            String query = "select ID, email, fName, lName, age, university, useraddress, city, province from common_user where email=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, email);

            ResultSet RS = PS.executeQuery();
            RS.next();

            userData.put("ID", RS.getString("ID"));
            userData.put("email", RS.getString("email"));
            userData.put("fName", RS.getString("fName"));
            userData.put("lName", RS.getString("lName"));
            userData.put("age", RS.getString("age"));
            userData.put("university", RS.getString("university"));
            
            userData.put("address", RS.getString("useraddress"));
            userData.put("city", RS.getString("city"));
            userData.put("province", RS.getString("province"));

            this.con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return userData;
    }

    public ArrayList<userprofile> getAllUsers(){
        ArrayList<userprofile> allUsers=new ArrayList<>();
        
        try {

            String query = "select ID, email, fName, lName, age, university, useraddress, city, province, date_joined from common_user";

            PreparedStatement PS = con.prepareStatement(query);
            ResultSet RS = PS.executeQuery();
            
            
            while(RS.next()){

            allUsers.add(new userprofile(RS.getInt("ID"),RS.getString("email"),
                    RS.getString("fName"),RS.getString("lName"),RS.getInt("age"),
                    RS.getString("university"),RS.getString("useraddress"),
                    RS.getString("city"), RS.getString("province"), RS.getString("date_joined")));
            }
            
            this.con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allUsers;
    }
    
    public HashMap<String, String> getAdminData(String email) {

        HashMap<String, String> userData = new HashMap<>();

        try {

            String query = "select ID, email, fName, lName, useraddress, city, province from admin_user where email=?";

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

    public HashMap getWebsiteStatistics() {

        HashMap webData = new HashMap<>();

        try {

            String query = "select count(*) as usersVisits from userLogins";

            PreparedStatement PS = con.prepareStatement(query);

            ResultSet RS = PS.executeQuery();
            RS.next();

            webData.put("usersVisits", RS.getInt("usersVisits"));

            
            
            String query1 = "select count(*) as questionsCount from questions";

            PreparedStatement PS1 = con.prepareStatement(query1);

            ResultSet RS1 = PS1.executeQuery();
            RS1.next();

            webData.put("questionsCount", RS1.getInt("questionsCount"));

            
            
            String query2 = "select count(*) as answersCount from answers";

            PreparedStatement PS2 = con.prepareStatement(query2);

            ResultSet RS2 = PS2.executeQuery();
            RS2.next();

            webData.put("answersCount", RS2.getInt("answersCount"));

            
            
            String query3 = "select count(*) as reportedCount from reportedQuestions";

            
            PreparedStatement PS3 = con.prepareStatement(query3);

            ResultSet RS3 = PS3.executeQuery();
            RS3.next();

            webData.put("reportedCount", RS3.getInt("reportedCount"));
            
            String query4="select count(*) as eachCount, title from questions as ques join categories "
                    + "on ques.category=categories.ID group by ques.category, categories.title "
                    + "order by eachCount desc limit 5";
            
            PreparedStatement PS4 = con.prepareStatement(query4);

            ResultSet RS4 = PS4.executeQuery();
            
            ArrayList<trend> trendingTopics=new ArrayList<>();
            
            while(RS4.next()){
                trendingTopics.add(new trend(RS4.getString(2), RS4.getInt(1)));
            }
            
            webData.put("trendingTopics", trendingTopics);
            
            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return webData;
    }

    public ArrayList<HashMap<String, String>> getQuestions() {

        ArrayList<HashMap<String, String>> questions = new ArrayList<>();

        try {
            String query = "select question_statement, title as categoryTitle from questions "
                    + "left join categories on questions.category=categories.ID";

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

    public void insertQuestion(String email, String statement, String category) {
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();

            String emailQuery = "select ID from common_user where common_user.email=?";

            PreparedStatement PS5 = con.prepareStatement(emailQuery);

            PS5.setString(1, email);

            ResultSet RS5 = PS5.executeQuery();

            RS5.next();

            int ownerID = Integer.parseInt(RS5.getString("ID"));
            
            Statement stmt = con.createStatement();
            String s1 = "select max(ID) as ID from questions";
            ResultSet rs = stmt.executeQuery(s1);
            rs.next();
            int question_ID = Integer.parseInt(rs.getString("ID")); //Getting Max Existing ID of Questions

            String query = "select ID from categories where categories.title=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, category);

            ResultSet RS = PS.executeQuery();

            RS.next();

            int categoryID = Integer.parseInt(RS.getString("ID"));

            String query2 = "insert into questions values(?,?,?,?,?)";

            PreparedStatement PS2 = con.prepareStatement(query2);

            question_ID++;

            PS2.setInt(1, question_ID);
            PS2.setString(2, statement);
            PS2.setInt(3, categoryID);
            PS2.setString(4, dtf.format(now));
            PS2.setInt(5, ownerID);
            
            
            PS2.executeUpdate();

            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void addNote(String email, String note) {
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();

            String query = "select ID from common_user where common_user.email=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, email);

            ResultSet RS = PS.executeQuery();

            RS.next();

            int ownerID = Integer.parseInt(RS.getString("ID"));

            String query1 = "insert into notes values(?,?,?)";

            PreparedStatement PS1 = con.prepareStatement(query1);

            PS1.setInt(1, ownerID);
            PS1.setString(2, note);
            PS1.setString(3, dtf.format(now));

            PS1.executeUpdate();

            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public ArrayList<HashMap<String, String>> getNotes(String email) {

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

    public void addRequestedTopic(String topic, String email) {
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();

            String query = "select ID from common_user where email=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, email);

            ResultSet RS = PS.executeQuery();

            RS.next();

            int userID = Integer.parseInt(RS.getString("ID"));

            String query1 = "insert into requestedTopics values(?,?,?)";

            PreparedStatement PS1 = con.prepareStatement(query1);

            PS1.setString(1, topic);
            PS1.setString(2, dtf.format(now));
            PS1.setInt(3, userID);

            PS1.executeQuery();

            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public HashMap getQuestionDetails(String question) {

        HashMap questionDetail = new HashMap<>();

        try {

            String IDQuery = "select ID from questions where questions.question_statement=?";

            PreparedStatement PS = con.prepareStatement(IDQuery);

            PS.setString(1, question);

            ResultSet RS = PS.executeQuery();

            RS.next();

            int questionID = RS.getInt("ID");

            String questionQuery = "select question_statement, date_added, fName, lName from questions left join common_user "
                    + "on questions.askedBy=common_user.ID where questions.ID=?";

            PreparedStatement PS1 = con.prepareStatement(questionQuery);

            PS1.setInt(1, questionID);

            ResultSet RS1 = PS1.executeQuery();
            RS1.next();

            String statement = RS1.getString("question_statement");
            //RS1.next();

            String dateAsked = RS1.getString("date_added");
            //RS1.next();

            String postedByFName = RS1.getString("fName");
            //RS1.next();

            String postedByLName = RS1.getString("lName");
            //RS1.next();

            String answerQuery = "select statement, fName, lName, dateAnswered from answers left join "
                    + "common_user on answers.ownerID=common_user.ID where answers.questionID=?";

            PreparedStatement PS3 = con.prepareStatement(answerQuery);

            PS3.setInt(1, questionID);

            ResultSet RS3 = PS3.executeQuery();

            ArrayList<answer> answers = new ArrayList<>();

            while (RS3.next()) {
                answer ans = new answer(RS3.getString("statement"),
                        RS3.getString("fName") + " " + RS3.getString("lName"), RS3.getString("dateAnswered"));
                answers.add(ans);
            }

            questionDetail.put("dateAsked", dateAsked);
            questionDetail.put("postedBy", postedByFName + " " + postedByLName);
            questionDetail.put("statement", statement);
            questionDetail.put("answers", answers);

            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return questionDetail;
    }
}
