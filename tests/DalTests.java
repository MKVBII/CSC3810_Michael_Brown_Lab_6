import DAL.DataMgr;
import DAL.DataProvider;

import org.junit.*;
import java.util.List;

import static org.junit.Assert.*;

public class DalTests {

    @BeforeClass
    public static void setup() {
        // Initialize with your database credentials
        DataMgr.initialize("root", "booplyboopers");
    }

    @AfterClass
    public static void teardown() {
        DataMgr.closeConnections();
    }

    @Test
    public void testGetReciplesByValidServingSize() {
        List<String> recipes = DataProvider.callGetRecipesByServingCount(3);
        assertNotNull(recipes);
        assertFalse("Recipes list shouldn't be empty", recipes.isEmpty());
    }

    @Test
    public void testGetReciplesByInvalidServingSize() {
        List<String> recipes = DataProvider.callGetRecipesByServingCount(0);
        assertNull(recipes);
    }

    @Test
    public void testGetAllCookbooks() {
        List<String> cookbooks = DataProvider.getAllCookbooks();
        assertNotNull(cookbooks);
        assertFalse("Cookbooks list should not be empty", cookbooks.isEmpty());
    }

    @Test
    public void testGetRecipesByValidCookbook() {
        List<String> recipes = DataProvider.getRecipesByCookbook("Dude Diet");
        assertNotNull(recipes);
        assertFalse("Dude Diet should have recipes", recipes.isEmpty());
    }

    @Test
    public void testGetRecipesByInvalidCookbook() {
        List<String> recipes = DataProvider.getRecipesByCookbook("NonExistentCookbook");
        assertNotNull(recipes);
        assertTrue("Non-existent cookbook should return no recipes", recipes.isEmpty());
    }

    @Test
    public void testGetAllRecipes() {
        List<String> recipes = DataProvider.getAllRecipes();
        assertNotNull(recipes);
        assertFalse("Recipes list should not be empty", recipes.isEmpty());
    }

}
