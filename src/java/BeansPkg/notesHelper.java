/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import java.util.ArrayList;
import java.util.HashMap;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */
public class notesHelper {
    private ArrayList<note> notesList;
    private int index;
    
    public notesHelper(){
        this.index=0;
        this.notesList=new ArrayList<>();
    }
    
    public void getData(String email){
        
        databaseClass DB=new databaseClass();
        
        ArrayList<HashMap<String, String>> list=DB.getNotes(email);
        
        for(int i=0;i<list.size();i++){
            HashMap<String, String> note=list.get(i);
            
            note myNote=new note();
            
            myNote.setnote(note.get("note"));
            myNote.setdate(note.get("date"));
            
            notesList.add(myNote);
        }
    }
    
    public String getnote(){
        return notesList.get(index).getnote();
    }
    
    public String getdate(){
         //This Approach of Tracking List is not Good
        return notesList.get(index++).getdate();
    }
    
    
    public int getcount(){
        return notesList.size();
    }
    
    public void resetIndex(){
        index=0;
    }
}
