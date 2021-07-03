/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import java.io.Serializable;

/**
 *
 * @author naeem
 */
public class userprofile implements Serializable{
    
    int ID;
    String email;
    String fName;
    String lName;
    String address;
    String city;
    String province;
    
    
    public userprofile(){
        
    }
    
    
    
    public int getID(){
        return ID;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getFName(){
        return fName;
    }
    
    public String getLName(){
        return lName;
    }
    
    public String getAddress(){
        return address;
    }
    
    public String getCity(){
        return city;
    }
    
    public String getProvince(){
        return province;
    }
    
    
    
}
