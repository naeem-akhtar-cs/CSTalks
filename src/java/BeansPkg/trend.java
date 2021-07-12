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
public class trend {

    private String topic;
    private int questionsCount;
    
    public trend(String topic, int questionsCount){
        this.topic=topic;
        this.questionsCount=questionsCount;
    }
    
    public String gettopic(){
        return this.topic;
    }
    
    public int getcount(){
        return this.questionsCount;
    }
}
