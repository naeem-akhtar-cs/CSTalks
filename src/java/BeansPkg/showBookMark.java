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
public class showBookMark {
     private ArrayList<question> bookMarkList;
    private int index;
    
    public showBookMark(){
        this.index=0;
        this.bookMarkList=new ArrayList<>();
    }
    
    public void getData(String email){
        
        databaseClass DB=new databaseClass();
        
        ArrayList<HashMap<String, String>> bookMarks=DB.getBookMarks(email);
        
        for(int i=0;i<bookMarks.size();i++){
            HashMap<String, String> question=bookMarks.get(i);
            
            question ques=new question();
            
            ques.setstatement(question.get("statement"));
            ques.setcategory(question.get("category"));
            
            bookMarkList.add(ques);
        }
    }
    
    public String getstatement(){
        return bookMarkList.get(index).getstatement();
    }
    
    public String getcategory(){
         //This Approach of Tracking List is not Good
        return bookMarkList.get(index++).getcategory();
    }
    
    public int getcount(){
        return bookMarkList.size();
    }
    
    public void resetIndex(){
        index=0;
    }
    
}
