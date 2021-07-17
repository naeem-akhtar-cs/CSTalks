/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

/**
 *
 * @author naeem
 */
public class reportedQuestion {
    private int questionID;
    private String statement;
    private String dateReported;
    private String reportedBy;
    
    public reportedQuestion(int questionID, String statement, String dateReported, String reportedBy){
        this.questionID=questionID;
        this.statement=statement;
        this.dateReported=dateReported;
        this.reportedBy=reportedBy;
    }
    public int getQuestionID(){
        return this.questionID;
    }
    
    public String getStatement(){
        return this.statement;
    }
    
    public String getDateReported(){
        return this.dateReported;
    }
    
    public String getReportedBy(){
        return this.reportedBy;
    }
}
