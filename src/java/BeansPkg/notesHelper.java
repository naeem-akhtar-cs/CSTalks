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
public class notesHelper {

    private ArrayList<note> notesList;

    public notesHelper() {

    }

    public void getData(String email) {
        databaseClass DB = new databaseClass();
        this.notesList = DB.getNotes(email);
    }

    public int getID(int index) {
        return notesList.get(index).getID();
    }

    public String getnote(int index) {
        return notesList.get(index).getnote();
    }

    public String getdate(int index) {
        return notesList.get(index).getdate();
    }

    public int getSize() {
        return notesList.size();
    }

}
