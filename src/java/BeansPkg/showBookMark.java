/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeansPkg;

import java.util.ArrayList;
import java.util.HashMap;
import mainPkg.databaseClass;

/**
 *
 * @author naeem
 */
public class showBookMark {

    private ArrayList<HashMap<String, String>> bookMarkList;

    public showBookMark() {

    }

    public void getData(String email) {

        databaseClass DB = new databaseClass();

        this.bookMarkList = DB.getBookMarks(email);
    }

    public String getstatement(int index) {
        return bookMarkList.get(index).get("statement");
    }

    public String getcategory(int index) {
        return bookMarkList.get(index).get("category");
    }

    public int getcount() {
        return bookMarkList.size();
    }
}
