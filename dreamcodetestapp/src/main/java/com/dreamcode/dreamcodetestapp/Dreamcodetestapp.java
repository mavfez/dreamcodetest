package com.dreamcode.dreamcodetestapp;

import com.dreamcode.dreamcodetestapp.dto.Category;
import com.dreamcode.dreamcodetestapp.dto.Keyword;
import com.dreamcode.dreamcodetestapp.repository.DreamcodeTestRepo;
import java.util.List;

/**
 *
 * @author Mauricio Viveros
 */
public class Dreamcodetestapp {

    public static void main(String[] args) {

        printKeywords();
        
        printLevelCategory();
    }

    private static void printKeywords() {
        System.out.println("gets keywords for a given category.");
        DreamcodeTestRepo dcr = new DreamcodeTestRepo();
        List<Keyword> lstkw = dcr.getKeywords(6);
        for (Keyword kw : lstkw) {
            System.out.println("---Keyword---");
            System.out.println("Id: " + kw.getKeywordId());
            System.out.println("Description: " + kw.getDescription());
        }
    }
    
    private static void printLevelCategory() {
        System.out.println("");System.out.println("");
        System.out.println("gets the level of the category.");
        DreamcodeTestRepo dcr = new DreamcodeTestRepo();
        List<Category> lstkw = dcr.getLevelCategory();
        for (Category cat : lstkw) {
            System.out.println("");
            System.out.println("---Category with its level---");
            System.out.println("Category Id: " + cat.getCategoryId());
            System.out.println("Description: " + cat.getCategoryDescription());
            System.out.println("Level: " + cat.getLevel());
        }
    }
}
