package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Handles connections to the MealPlanning database
 */
public class DataMgr {

    private static Connection mealPlanningConnection;

    private static final String HOST = "localhost";
    private static final String PORT = "3306";

    private static String user;
    private static String password;

    /**
     * sets the credentials used for all database connections
     * @param user database username
     * @param password database password
     */
    public static void initialize(String user, String password) {
        DataMgr.user = user;
        DataMgr.password = password;
    }

    /**
     * takes a database name and returns a connection to that database
     * @param databaseName name of the database we're trying to connect to
     * @return connection to that database
     * @throws SQLException if the database doesn't exist or can't be connected to
     */
    private static Connection getConnection(String databaseName) throws SQLException {
        String url = "jdbc:mysql://" + HOST + ":" + PORT + "/" + databaseName;
        return DriverManager.getConnection(url, user, password);
    }

    /**
     * gets the connection for the MealPlanning database
     * @return a connection to the MealPlanning database
     * @throws SQLException if the database doesn't exist or can't be connected to
     */
    public static Connection getMealPlanningConnection() throws SQLException {
        if (mealPlanningConnection == null || mealPlanningConnection.isClosed()) {
            mealPlanningConnection = getConnection("MealPlanning");
        }
        return mealPlanningConnection;
    }

    /**
     * cleanup, closes the connections
     */
    public static void closeConnections() {
        try {
            if (mealPlanningConnection != null && !mealPlanningConnection.isClosed()) {
                mealPlanningConnection.close();
            }
        } catch (SQLException e) {
            System.out.println("Error closing connections: " + e.getMessage());
        }
    }
}
