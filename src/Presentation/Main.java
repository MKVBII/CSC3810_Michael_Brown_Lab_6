package Presentation;

import DAL.ConditionException;
import DAL.DataMgr;
import DAL.DataProvider;

import java.util.List;
import java.util.Scanner;

/**
 * Presentation layer for the MealPlanning application
 */
public class Main {

    public static void main(String[] args) throws ConditionException {
        if (args.length < 2) {
            System.out.println("Usage: java Presentation.Main <db_username> <db_password>");
            return;
        }

        DataMgr.initialize(args[0], args[1]);
        runMenuLoop();
    }

    private static void runMenuLoop() throws ConditionException {
        Scanner scanner = new Scanner(System.in);
        boolean running = true;

        while (running) {
            System.out.println("\n===== MealPlanning Menu =====");
            System.out.println("1. View all cookbooks");
            System.out.println("2. Search recipes by cookbook");
            System.out.println("3. Get recipes via stored procedure");
            System.out.println("4. View all recipes");
            System.out.println("5. Plan breakfast, lunch, and dinner for your family");
            System.out.println("6. Exit");
            System.out.print("Choose an option: ");

            String choice = scanner.nextLine().trim();

            switch (choice) {
                case "1":
                    printResults(DataProvider.getAllCookbooks(), "All Cookbooks");
                    break;
                case "2":
                    System.out.print("Enter cookbook name: ");
                    String cookbookName = scanner.nextLine().trim();
                    printResults(DataProvider.getRecipesByCookbook(cookbookName),
                        "Recipes in " + cookbookName);
                    break;
                case "3":
                    System.out.print("Enter cookbook name: ");
                    String cbName = scanner.nextLine().trim();
                    printResults(DataProvider.callGetRecipesStoredProcedure(cbName),
                        "Recipes (via stored procedure)");
                    break;
                case "4":
                    printResults(DataProvider.getAllRecipes(), "All Recipes");
                    break;
                case "5":
                    handleFamilyPlanning();
                case "6":
                    running = false;
                    break;
                default:
                    System.out.println("Invalid option, try again.");
            }
        }

        DataMgr.closeConnections();
        scanner.close();
        System.out.println("\nDone!");
    }

    private static void handleFamilyPlanning() throws ConditionException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("How many people are you trying to feed (must be between 1 and 6: ");

        List<String> availableMeals;

        // continue asking until we get a valid member count
        while (true) {
            int familyMemberCount = scanner.nextInt();
            if (familyMemberCount >= 6 || familyMemberCount >= 1) {
                availableMeals = DataProvider.callGetRecipesByServingCount(familyMemberCount);
                
                System.out.println("The following are meals that will feed your family: " + availableMeals.toString() + "\nWhich would you like for breakfast?: ");
                String breakfastChoice = scanner.nextLine();
                assertTrue("Chosen meal should be among the list provided", availableMeals.contains(breakfastChoice));
                
                System.out.println("Which would you like for lunch?: ");
                String lunchChoice = scanner.nextLine();
                assertTrue("Chosen meal should be among the list provided", availableMeals.contains(lunchChoice));
                
                System.out.println("Which would you like for dinner?: ");
                String dinnerChoice = scanner.nextLine();
                assertTrue("Chosen meal should be among the list provided", availableMeals.contains(dinnerChoice));
               
                System.out.println("Your meal plan:\nBreakfast: " + breakfastChoice + "\nLunch: " + lunchChoice + "\nDinner: " + dinnerChoice);
                break;
            }            
            System.out.println("Family member count must be between 1 and 6 (inclusive)");
        }
    }

    private static void printResults(List<String> results, String header) {
        System.out.println("\n-- " + header + " --");
        if (results.isEmpty()) {
            System.out.println("No results found.");
            return;
        }
        for (String result : results) {
            System.out.println(result);
        }
    }

    private static void assertTrue(String message, boolean condition) throws ConditionException {
        if (!condition) {
            throw new ConditionException(message);
        }
    }
}
