
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
    int age;
    String university;
    String dateJoined;
    
    public userprofile(){
        
    }
    
    public userprofile(int ID, String email, String fName, String lName, 
            int age, String university, String address, String city, String province, String dateJoined){
        this.ID=ID;
        this.email=email;
        this.fName=fName;
        this.lName=lName;
        this.age=age;
        this.university=university;
        this.address=address;
        this.city=city;
        this.province=province;
        this.dateJoined=dateJoined;
    }
    
    public void getData(String email){
    
       
     databaseClass obj=new databaseClass();
     
     HashMap<String, String> userData=obj.getUserData(email);
     
     this.ID=Integer.parseInt(userData.get("ID"));
     this.email=userData.get("email");
     this.fName=userData.get("fName");
     this.lName=userData.get("lName");
     this.age=Integer.parseInt(userData.get("age"));
     this.university=userData.get("university");
     
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
    
    public int getage(){
        return age;
    }
    
    public String getuniversity(){
        return university;
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
    
    public String getDateJoined(){
        return dateJoined;
    }
    
}
