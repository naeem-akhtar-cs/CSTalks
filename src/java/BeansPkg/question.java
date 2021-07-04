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
public class question {
    private String statement;
    private String category;
    
    public question(){
        
    }
    
    public void setstatement(String statement){
        this.statement=statement;
    }
    
    public void setcategory(String category){
        this.category=category;
    }
    
    public String getstatement(){
        return statement;
    }
    
    public String getcategory(){
        return category;
    }
}
