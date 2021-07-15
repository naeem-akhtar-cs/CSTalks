
package BeansPkg;

import java.util.ArrayList;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */
public class requestedTopicsHelper {

    private ArrayList<requestedTopic> requestedTopicsList;

    public requestedTopicsHelper() {
        databaseClass DB = new databaseClass();
        this.requestedTopicsList = DB.getRequestedTopics();
    }

    public String getTitle(int index) {
        return requestedTopicsList.get(index).getTitle();
    }

    public String getDateRequested(int index) {
        return requestedTopicsList.get(index).getDateRequested();
    }

    public String getRequestedBy(int index) {
        return requestedTopicsList.get(index).getRequestedBy();
    }

    public int getSize(){
        return requestedTopicsList.size();
    }
    
}
