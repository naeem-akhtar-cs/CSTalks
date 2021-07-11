
package BeansPkg;

import java.util.ArrayList;
import java.util.HashMap;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */

//This class has all the information related to detail of a page

public class questionDetailPage {
    private String statement;
    private String postedBy;
    private String dateAsked;
    private ArrayList<answer> answers;
    
    public questionDetailPage(){
        
    }
    
    public void getData(String question){
        databaseClass DB=new databaseClass();
        
        HashMap questionData=DB.getQuestionDetails(question);
        
        this.statement=(String)questionData.get("statement");
        this.postedBy=(String)questionData.get("postedBy");
        this.dateAsked=(String)questionData.get("dateAsked");
        this.answers=(ArrayList<answer>)questionData.get("answers");
    }
}
