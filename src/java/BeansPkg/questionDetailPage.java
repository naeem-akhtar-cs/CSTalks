
package BeansPkg;

import java.util.ArrayList;

/**
 *
 * @author naeem
 */

//This class has all the information related to detail of a question
public class questionDetailPage {
    private int ID;
    private String statement;
    private String postedBy;
    private String dateAsked;
    private String category;
    private ArrayList<answer> answers;
    
    public questionDetailPage(int ID, String statement, String postedBy, String dateAsked, 
            String category, ArrayList<answer> answers){
        this.ID=ID;
        this.statement=statement;
        this.postedBy=postedBy;
        this.dateAsked=dateAsked;
        this.category=category;
        this.answers=answers;
    }
    
    public int getNoAnswers(){
        return this.answers.size();
    }
    
    public int getQuestionID(){
        return this.ID;
    }
    
    public String getStatement(){
        return this.statement;
    }
    
    public String getpostedBy(){
        return this.postedBy;
    }
    
    public String getDateAsked(){
        return this.dateAsked;
    }
    
    public String getCategory(){
        return this.category;
    }
    
    public ArrayList<answer> getAnswer(int index){
        return this.answers;
    }
}
