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
    int ID;
    String note;
    String dateAdded;
    
    public note(int ID, String note, String date){
        this.ID=ID;
        this.note=note;
        this.dateAdded=date;
    }
    
    public int getID(){
        return this.ID;
    } 
    
    public String getnote(){
        return this.note;
    } 
    
    public String getdate(){
        return this.dateAdded;
    }
}
