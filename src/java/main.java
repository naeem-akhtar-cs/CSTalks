/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author naeem
 */
public class main {
    
    
    
    
    
    public static void main(String srgs[]){
        
        String fName="naeem";
        String lName="akhtar";
        String email="naeemakhtar78756@gmail.com";
        String password="234";
        String repeatPassword="234";
        
        databaseClass obj=new databaseClass();
        obj.DBSignUP(fName, lName, email, password, repeatPassword);
        
        System.out.println("Data Inserted SUCCESSFULLY");
    }
}