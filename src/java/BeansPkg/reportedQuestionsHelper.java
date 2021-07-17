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
public class reportedQuestionsHelper {

    private ArrayList<reportedQuestion> reportedList;

    public reportedQuestionsHelper() {
        databaseClass DB = new databaseClass();
        this.reportedList = DB.reportedQuestions();
    }

    public int getQuestionID(int index){
        return this.reportedList.get(index).getQuestionID();
    }
    
    public String getStatement(int index) {
        return this.reportedList.get(index).getStatement();
    }

    public String getDateReported(int index) {
        return this.reportedList.get(index).getDateReported();
    }

    public String getReportedBy(int index) {
        return this.reportedList.get(index).getReportedBy();
    }
    
    public int getSize(){
        return this.reportedList.size();
    }

}
