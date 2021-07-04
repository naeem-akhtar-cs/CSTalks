/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import java.util.ArrayList;
import java.util.HashMap;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */
public class questionshelper {
    
    private ArrayList<question> questionsList;
    private int index;
    
    public questionshelper(){
        
        index=0;
        
        databaseClass DB=new databaseClass();
        
        ArrayList<HashMap<String, String>> Questionslist=DB.getQuestions();
        
        questionsList=new ArrayList<>();
        
        for(int i=0;i<Questionslist.size();i++){
            HashMap<String, String> question=Questionslist.get(i);
            
            question ques=new question();
            
            ques.setstatement(question.get("statement"));
            ques.setcategory(question.get("category"));
            
            questionsList.add(ques);
        }
    }
    
    public String getstatement(){
        return questionsList.get(index).getstatement();
    }
    
    public String getcategory(){
         //This Approach of Tracking List is not Good
        return questionsList.get(index++).getcategory();
    }
    
    public int getcount(){
        return questionsList.size();
    }
    
    public void resetIndex(){
        index=0;
    }
}
