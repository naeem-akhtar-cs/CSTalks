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
public class requestedTopic {

    private String statement;
    private String dateRequested;
    private String requestedBy;

    public requestedTopic(String statement, String dateRequested, String requestedBy) {
        this.statement = statement;
        this.dateRequested = dateRequested;
        this.requestedBy = requestedBy;
    }

    public String getTitle() {
        return this.statement;
    }

    public String getDateRequested() {
        return this.dateRequested;
    }

    public String getRequestedBy() {
        return this.requestedBy;
    }
}
