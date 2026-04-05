package DAL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Provides queries for the MealPlanning database
 */
public class DataProvider {

    public static List<String> callGetRecipesByServingCount(int servingCount) {
        List<String> recipes = new ArrayList<>();
        try {
            Connection conn = DataMgr.getMealPlanningConnection();
            CallableStatement cs = conn.prepareCall("{CALL getRecipesByServingCount(?)}");
            cs.setInt(1, servingCount);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                recipes.add(rs.getString("RecipeName"));
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error in callGetRecipesByServingCount: " + e.getMessage());
        }
        return recipes;
    }

    /**
     * retrieves all cookbooks from the Cookbook table
     * @return list of formatted cookbook strings
     */
    public static List<String> getAllCookbooks() {
        List<String> cookbooks = new ArrayList<>();
        try {
            Connection conn = DataMgr.getMealPlanningConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Cookbook");
            while (rs.next()) {
                cookbooks.add(rs.getString("CookbookName")
                    + " | IsBook: " + rs.getBoolean("IsBook")
                    + " | Website: " + rs.getString("Website"));
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error in getAllCookbooks: " + e.getMessage());
        }
        return cookbooks;
    }

    /**
     * searches for recipes belonging to a specific cookbook
     * @param cookbookName inputted cookbook name
     * @return list of formatted recipe strings
     */
    public static List<String> getRecipesByCookbook(String cookbookName) {
        List<String> recipes = new ArrayList<>();
        try {
            Connection conn = DataMgr.getMealPlanningConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT RecipeName, TotalServings FROM Recipe WHERE CookbookName = ?");
            ps.setString(1, cookbookName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                recipes.add(rs.getString("RecipeName")
                    + " | Servings: " + rs.getInt("TotalServings"));
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error in getRecipesByCookbook: " + e.getMessage());
        }
        return recipes;
    }

    /**
     * calls the getRecipes stored procedure for a given cookbook
     * @param cookbookName inputted cookbook name
     * @return list of recipe names
     */
    public static List<String> callGetRecipesStoredProcedure(String cookbookName) {
        List<String> recipes = new ArrayList<>();
        try {
            Connection conn = DataMgr.getMealPlanningConnection();
            CallableStatement cs = conn.prepareCall("{CALL getRecipes(?)}");
            cs.setString(1, cookbookName);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                recipes.add(rs.getString("RecipeName"));
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error in callGetRecipes: " + e.getMessage());
        }
        return recipes;
    }

    /**
     * retrieves all recipes from the Recipe table
     * @return list of formatted recipe strings
     */
    public static List<String> getAllRecipes() {
        List<String> recipes = new ArrayList<>();
        try {
            Connection conn = DataMgr.getMealPlanningConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT RecipeName, TotalServings FROM Recipe");
            while (rs.next()) {
                recipes.add(rs.getString("RecipeName")
                    + " | Servings: " + rs.getInt("TotalServings"));
            }
            rs.close();
        } catch (SQLException e) {
            System.out.println("Error in getAllRecipes: " + e.getMessage());
        }
        return recipes;
    }
}
