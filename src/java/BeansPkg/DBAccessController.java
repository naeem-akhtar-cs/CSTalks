/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import java.util.ArrayList;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */
public class DBAccessController {
    private ArrayList<questionDetailPage> questionsList;
    private ArrayList<note> notesList;
    private ArrayList<category> categoriesList;
    private ArrayList<userprofile> allUsers;
    private ArrayList<requestedTopic> requestedTopicsList;
    
    private int usersVisits;
    private int questionsAsked;
    private int questionsReported;
    private int questionsAnswered;
    private ArrayList<trend> trendingTopics;
    
    
    public DBAccessController(){
        questionsList=null;
    }
    
    public ArrayList<questionDetailPage> getQuestionsList(){
        
        if (questionsList == null) {
            databaseClass DB = new databaseClass();
            this.questionsList = DB.getQuestionDetails();
        }   
        return this.questionsList;
    }
    
}
