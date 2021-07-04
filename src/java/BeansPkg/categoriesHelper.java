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
public class categoriesHelper {
    
    private int index=0;
    private ArrayList<category> categoriesList;
    
    public categoriesHelper(){
        index=0;
        categoriesList=new ArrayList<>();
        
        databaseClass DB=new databaseClass();
        
        ArrayList<String> categories=DB.getCategories();
        
        
        for(int i=0;i<categories.size();i++){
            
            category category=new category();
            
            category.setname(categories.get(i));
            
            categoriesList.add(category);
        }
    }
    
    public String gettitle(){
        return categoriesList.get(index++).getname();
    }
    
    public int getcount(){
        return categoriesList.size();
    }
    
    public void resetIndex(){
        index=0;
    }
}
