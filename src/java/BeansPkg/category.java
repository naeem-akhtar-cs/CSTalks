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
public class category {
    private String name;
    private String dateAdded;
    
    public category(String name, String dateAdded){
        this.name=name;
        this.dateAdded=dateAdded;
    }
    
    public String getname(){
        return name;
    }
    
   public String getDate(){
        return this.dateAdded;
    }
}
