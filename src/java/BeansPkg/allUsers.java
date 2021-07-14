/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import java.util.ArrayList;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */
public class allUsers {
    private ArrayList<userprofile> allUsers;
    
    public allUsers(){
        databaseClass DB=new databaseClass();
        this.allUsers=DB.getAllUsers();
        
    }
    
    public int getSize(){
        return this.allUsers.size();
    }
    
    public int getID(int index){
        return allUsers.get(index).getID();
    }
    
    public String getemail(int index){
        return allUsers.get(index).getemail();
    }
    
    public String getfullName(int index){
        return allUsers.get(index).getfullName();
    }
    
    public String getage(int index){
        return allUsers.get(index).getage();
    }
    
    public String getuniversity(int index){
        return allUsers.get(index).getuniversity();
    }
    
    public String getcity(int index){
        return allUsers.get(index).getcity();
    }
    
  
    public String getDateJoined(int index){
        return allUsers.get(index).getDateJoined();
    }
}
