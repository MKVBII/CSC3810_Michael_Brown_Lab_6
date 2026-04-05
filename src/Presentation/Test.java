package Presentation;

import DAL.DataMgr;
import DAL.DataProvider;

public class Test {
    public static void main(String[] args) {
        DataMgr.initialize("root", "booplyboopers");
        
        System.out.println(DataProvider.callGetRecipesByServingCount(3).toString());
        System.out.println(DataProvider.callGetRecipesByServingCount(0).toString());
    }
}
