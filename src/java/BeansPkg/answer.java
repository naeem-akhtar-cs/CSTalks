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
public class answer {

    private String statement;
    private String answerBy;
    private String answerDate;

    public answer(String answer, String answerBy, String answerDate) {
        this.statement = answer;
        this.answerBy = answerBy;
        this.answerDate = answerDate;
    }

        public String getStatement() {
        return this.statement;
    }

    public String getAnsweredBy() {
        return this.answerBy;
    }
    
        public String getAnsweredDate(){
        return this.answerDate;
    }
}
