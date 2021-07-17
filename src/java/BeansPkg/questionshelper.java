package BeansPkg;

import java.util.ArrayList;
import javax.inject.Scope;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */
public class questionshelper {

    private ArrayList<questionDetailPage> questionsList;

    public questionshelper() {

        DBAccessController controller = new DBAccessController();

        questionsList = controller.getQuestionsList();
    }

    public int getQuestionID(int index) {
        return this.questionsList.get(index).getQuestionID();
    }

    public String getStatement(int index) {
        return this.questionsList.get(index).getStatement();
    }

    public String getpostedBy(int index) {
        return this.questionsList.get(index).getpostedBy();
    }

    public String getDateAsked(int index) {
        return this.questionsList.get(index).getDateAsked();
    }

    public String getCategory(int index) {
        return this.questionsList.get(index).getCategory();
    }

    public int getSize() {
        return this.questionsList.size();
    }

    //Number of answers of that particular question
    public ArrayList<answer> getAnswers(int index) {
        return questionsList.get(index).getAnswer(index);
    }
}
