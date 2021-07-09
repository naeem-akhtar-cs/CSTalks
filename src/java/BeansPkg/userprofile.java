/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import mainPkg.databaseClass;
import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.net.URI;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import javax.ws.rs.core.EntityTag;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Link;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.NewCookie;
import javax.ws.rs.core.Response;

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
    
       
     databaseClass obj=new databaseClass();
     
     HashMap<String, String> userData=obj.getUserData(email);
     
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
