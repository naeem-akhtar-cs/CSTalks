/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import java.io.Serializable;
import java.util.HashMap;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */
    public class adminprofile implements Serializable{
    
    private int ID;
    private String email;
    private String fName;
    private String lName;
    private String address;
    private String city;
    private String province;
    
    
    
    public adminprofile(){
        
    }
    
    public void getData(String email){
    
       
     databaseClass DB=new databaseClass();
     
     HashMap<String, String> userData=DB.getAdminData(email);
     
     this.ID=Integer.parseInt(userData.get("ID"));
     this.email=userData.get("email");
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
