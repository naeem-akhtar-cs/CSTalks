/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */
public class websiteStatistics implements Serializable {

    private int usersVisits;
    private int questionsAsked;
    private int questionsReported;
    private int questionsAnswered;
    private ArrayList<trend> trendingTopics;

    private int index;

    public websiteStatistics() {

        index = 0;

        databaseClass DB = new databaseClass();
        HashMap webData = DB.getWebsiteStatistics();

        this.usersVisits = (int) webData.get("usersVisits");
        this.questionsAsked = (int) webData.get("questionsCount");
        this.questionsReported = (int) webData.get("reportedCount");
        this.questionsAnswered = (int) webData.get("answersCount");

        this.trendingTopics = (ArrayList<trend>) webData.get("trendingTopics");
    }

    public int getUserVisits() {
        return this.usersVisits;
    }

    public int getQuestionsAsked() {
        return this.questionsAsked;
    }

    public int getQuestionsReported() {
        return this.questionsReported;
    }

    public int getQuestionsAnswered() {
        return this.questionsAnswered;
    }

    public String gettopic(int index) {
        return trendingTopics.get(index - 1).gettopic();
    }

    public int getpercentage(int index) {

        int count = trendingTopics.get(index - 1).getcount();
        return (int) (100.0 * count / questionsAsked);

    }

    public void resetindex() {
        this.index = 0;
    }
}
