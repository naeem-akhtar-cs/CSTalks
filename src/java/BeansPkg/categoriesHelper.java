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
    
    private ArrayList<category> categoriesList;
    
    public categoriesHelper(){
        categoriesList=new ArrayList<>();
        
        databaseClass DB=new databaseClass();
        
        this.categoriesList=DB.getCategories();
    }
    
    public String gettitle(int index){
        return categoriesList.get(index).getname();
    }
    
    public String getDateAdded(int index){
        return categoriesList.get(index).getDate();
    }
    
    public int getcount(){
        return categoriesList.size();
    }
    
}
