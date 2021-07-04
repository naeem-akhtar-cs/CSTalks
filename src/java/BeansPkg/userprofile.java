/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import mainPkg.databaseClass;
import java.io.Serializable;
import java.util.HashMap;

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
    
    public void getData(String email){
        
     this.email=email;
        
     databaseClass obj=new databaseClass();
     
     HashMap<String, String> userData=obj.getUserData(email);
     
     this.ID=Integer.parseInt(userData.get("ID"));
     this.fName=userData.get("fName");
     this.lName=userData.get("lName");
     this.address=userData.get("address");
     this.city=userData.get("city");
     this.province=userData.get("province");
    }
    public int getID(){
        return ID;
    }
    
    public String getemail(){
        return email;
    }
    
    public String getfName(){
        return fName;
    }
    
    public String getlName(){
        return lName;
    }
    
    public String getfullName(){
        return fName+" "+lName;
    }
    
    public String getaddress(){
        return address;
    }
    
    public String getcity(){
        return city;
    }
    
    public String getprovince(){
        return province;
    }
    
    
    
}
