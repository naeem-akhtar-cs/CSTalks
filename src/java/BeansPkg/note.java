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
public class note {
    String note;
    String dateAdded;
    
    public note(){
        
    }
    
    public void setnote(String note){
        this.note=note;
    }
    
    public void setdate(String date){
        this.dateAdded=date;
    }
    
    public String getnote(){
        return this.note;
    } 
    
    public String getdate(){
        return this.dateAdded;
    }
}
