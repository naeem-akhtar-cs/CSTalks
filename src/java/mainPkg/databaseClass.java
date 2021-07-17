package mainPkg;

import BeansPkg.answer;
import BeansPkg.category;
import BeansPkg.note;
import BeansPkg.questionDetailPage;
import BeansPkg.requestedTopic;
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
            //Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //this.con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ap_project","user","123");
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
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();
            Statement stmt = con.createStatement();

            String s2 = "select ID from common_user where email=?";
            PreparedStatement PS2 = con.prepareStatement(s2);
            PS2.setString(1, useremail);

            ResultSet rs2 = PS2.executeQuery();

            if (rs2.next()) { //Email already in use
                check = false;
            } else { //if Email does not exists

                String s1 = "select max(ID) as ID from common_user";
                ResultSet rs = stmt.executeQuery(s1);
                rs.next();
                int user_ID = rs.getInt("ID"); //Getting Max Existing ID of Users
                //System.out.println("Max ID is: " + user_ID);

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

                preparedStmt.executeUpdate();

                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return check;
    }

    //Topic means Category
    public void addTopic(String topic) {

        try {
            String s1 = "select max(ID) as ID from categories";

            PreparedStatement PS = con.prepareStatement(s1);

            ResultSet rs = PS.executeQuery(s1);
            rs.next();
            int categoryID = rs.getInt("ID"); //Getting Max Existing ID of Category

            String query = "insert into categories values(?,?,?)";

            PreparedStatement PS1 = con.prepareStatement(query);

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();

            categoryID++;

            PS1.setInt(1, categoryID);
            PS1.setString(2, topic);
            PS1.setString(3, dtf.format(now));

            PS1.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public int DBSignin(String useremail, String password) {

        int check = 0;

        try {
            Statement stmt = con.createStatement();

            String s1 = "select user_password, ID from common_user where email='" + useremail + "' and user_status=1";

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

    public ArrayList<userprofile> getAllUsers() {
        ArrayList<userprofile> allUsers = new ArrayList<>();

        try {

            String query = "select ID, email, fName, lName, age, university, useraddress, city, province, date_joined from common_user";

            PreparedStatement PS = con.prepareStatement(query);
            ResultSet RS = PS.executeQuery();

            while (RS.next()) {

                allUsers.add(new userprofile(RS.getInt("ID"), RS.getString("email"),
                        RS.getString("fName"), RS.getString("lName"), RS.getString("age"),
                        RS.getString("university"), RS.getString("useraddress"),
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

            String query4 = "select count(*) as eachCount, title from questions as ques join categories "
                    + "on ques.category=categories.ID group by ques.category, categories.title "
                    + "order by eachCount desc limit 5";

            PreparedStatement PS4 = con.prepareStatement(query4);

            ResultSet RS4 = PS4.executeQuery();

            ArrayList<trend> trendingTopics = new ArrayList<>();

            while (RS4.next()) {
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

    public ArrayList<category> getCategories() {
        ArrayList<category> list = new ArrayList<>();

        try {
            String query = "select title, dateAdded from categories";

            PreparedStatement PS = con.prepareStatement(query);

            ResultSet RS = PS.executeQuery();

            while (RS.next()) {
                list.add(new category(RS.getString("title"), RS.getString("dateAdded")));
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

            int ownerID = RS5.getInt("ID");

            Statement stmt = con.createStatement();
            String s1 = "select max(ID) as ID from questions";
            ResultSet rs = stmt.executeQuery(s1);
            rs.next();
            int question_ID = rs.getInt("ID"); //Getting Max Existing ID of Questions

            String query = "select ID from categories where categories.title=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, category);

            ResultSet RS = PS.executeQuery();

            RS.next();

            int categoryID = RS.getInt("ID");

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

    public Boolean addNote(String email, String note) {

        if (note.length() <= 5) {
            return false;
        } else {
            try {
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
                LocalDateTime now = LocalDateTime.now();

                String query = "select ID from common_user where common_user.email=?";

                PreparedStatement PS = con.prepareStatement(query);

                PS.setString(1, email);

                ResultSet RS = PS.executeQuery();

                RS.next();

                int ownerID = RS.getInt("ID");

                String query2 = "select max(ID) as ID from notes";

                PreparedStatement PS2 = con.prepareStatement(query2);

                ResultSet RS2 = PS2.executeQuery();

                RS2.next();

                int maxNoteID = RS2.getInt("ID");

                maxNoteID++;

                String query1 = "insert into notes (ID, owner_id, note, date_added) values(?, ?, ?, ?)";

                PreparedStatement PS1 = con.prepareStatement(query1);

                PS1.setInt(1, maxNoteID);
                PS1.setInt(2, ownerID);
                PS1.setString(3, note);
                PS1.setString(4, dtf.format(now));

                PS1.executeUpdate();

                con.close();

            } catch (Exception ex) {
                ex.printStackTrace();
            }

            return true;
        }
    }

    public ArrayList<note> getNotes(String email) {

        ArrayList<note> notesList = new ArrayList<>();

        try {
            String query = "select notes.ID, note, date_added from notes join common_user "
                    + "on notes.owner_id=common_user.ID where common_user.email=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, email);

            ResultSet RS = PS.executeQuery();

            while (RS.next()) {
                notesList.add(new note(RS.getInt("ID"), RS.getString("note"), RS.getString("date_added")));
            }

            this.con.close();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return notesList;
    }

    public void deleteNote(int ID) {
        try {

            String query = "delete from notes where ID=" + ID;
            PreparedStatement PS = con.prepareStatement(query);

            PS.executeUpdate();

            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<requestedTopic> getRequestedTopics() {

        ArrayList<requestedTopic> requestedTopicsList = new ArrayList<>();

        try {
            String query = "select title, dateRequested, fName, lName from requestedTopics left join common_user "
                    + "on requestedTopics.requestedBy=common_user.ID";

            PreparedStatement PS = con.prepareStatement(query);

            ResultSet RS = PS.executeQuery();

            while (RS.next()) {

                requestedTopicsList.add(new requestedTopic(RS.getString("title"),
                        RS.getString("dateRequested"), RS.getString("fName") + " "
                        + RS.getString("lName")));
            }
            this.con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return requestedTopicsList;
    }

    //Adding topic in the list of requests to add topic (to be approved by admin)
    public void addRequestedTopic(String topic, String email) {
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();

            String query = "select ID from common_user where email=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, email);

            ResultSet RS = PS.executeQuery();

            RS.next();

            int userID = RS.getInt("ID");

            String query1 = "insert into requestedTopics values(?,?,?)";

            PreparedStatement PS1 = con.prepareStatement(query1);

            PS1.setString(1, topic);
            PS1.setString(2, dtf.format(now));
            PS1.setInt(3, userID);

            PS1.executeUpdate();

            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<questionDetailPage> getQuestionDetails() {

        ArrayList<questionDetailPage> questionsDetails = new ArrayList<>();

        try {

            String questionQuery = "select questions.ID as questionID, question_statement, categories.title as category, date_added, fName, lName from questions left join common_user "
                    + "on questions.askedBy=common_user.ID left join categories on questions.category=categories.ID";

            PreparedStatement PS1 = con.prepareStatement(questionQuery);

            ResultSet RS1 = PS1.executeQuery();

            while (RS1.next()) {

                int questionID = RS1.getInt("questionID");

                String statement = RS1.getString("question_statement");

                String category = RS1.getString("category");

                String dateAsked = RS1.getString("date_added");

                String postedBy = RS1.getString("fName") + " " + RS1.getString("lName");

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

                questionsDetails.add(new questionDetailPage(questionID, statement, postedBy, dateAsked, category, answers));
            }

            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return questionsDetails;
    }

    public void deleteQuestion(int questionID) {

        try {
            String query2 = "delete from questions where ID=?";

            PreparedStatement PS2 = con.prepareStatement(query2);
            PS2.setInt(1, questionID);

            PS2.executeUpdate();

            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteRequestedTopic(String topic) {
        try {
            String query = "delete from requestedTopics where title=?";

            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, topic);

            PS.executeUpdate();

            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void susupendUser(int ID) {
        try {
            String query = "update common_user set user_status=0 where ID=" + ID;
            PreparedStatement PS = con.prepareStatement(query);
            PS.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(databaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removeUser(String email) {
        try {

            String emailQuery = "select ID from common_user where common_user.email=?";

            PreparedStatement PS5 = con.prepareStatement(emailQuery);

            PS5.setString(1, email);

            ResultSet RS5 = PS5.executeQuery();

            RS5.next();

            int ownerID = RS5.getInt("ID");

            //Delete from user table
            String query = "delete from common_user where ID=" + ownerID;
            PreparedStatement PS = con.prepareStatement(query);
            PS.executeUpdate();

            //Entries from other tables will be deleted via on delete cascade
            con.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void updateUserSetting(String email, String fName, String lName, int age, String university) {
        try {
            String query = "update common_user set fName=?, lName=?, age=?, university=? where email=?";
            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, fName);
            PS.setString(2, lName);
            PS.setInt(3, age);
            PS.setString(4, university);
            PS.setString(5, email);

            PS.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(databaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateUserAddress(String email, String address, String city, String province) {
        try {
            String query = "update common_user set useraddress=?, city=?, province=? where email=?";
            PreparedStatement PS = con.prepareStatement(query);

            PS.setString(1, address);
            PS.setString(2, city);
            PS.setString(3, province);
            PS.setString(4, email);

            PS.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(databaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addAnswer(int questionID, String ownerEmail, String answer) {

        try {
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            LocalDateTime now = LocalDateTime.now();
            
            
            ResultSet rs = con.createStatement().executeQuery("select max(ID) as ID from answers");
            rs.next();
            int maxAnswerID = rs.getInt("ID"); //Getting Max Existing ID of answer
            
            PreparedStatement PS1 = con.prepareStatement("select ID from common_user where email=?");
            
            PS1.setString(1, ownerEmail);
            ResultSet rs1=PS1.executeQuery();
            
            rs1.next();
            int ownerID = Integer.parseInt(rs1.getString("ID")); //Getting Max Existing ID of Users
            
            maxAnswerID++;
            String query = "insert into answers values(?, ?, ?, ?, ?)";
            
            PreparedStatement PS=con.prepareStatement(query);
            
            PS.setInt(1, maxAnswerID);
            PS.setString(2, answer);
            PS.setInt(3, ownerID);
            PS.setString(4, dtf.format(now));
            PS.setInt(5, questionID);
            
            PS.executeUpdate();
            
            con.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(databaseClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
