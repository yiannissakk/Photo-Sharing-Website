package photoshare;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * A data access object (DAO) to handle the Users table
 *
 * @author G. Zervas <cs460tf@bu.edu>
 */
public class NewUserDao {
  private static final String CHECK_EMAIL_STMT = "SELECT " +
      "COUNT(*) FROM Users WHERE email = ?";

  private static final String NEW_USER_STMT = "INSERT INTO " +
      "Users (email, password, firstName, lastName, birthDate, gender, hometownCity, hometownState,                   hometownCountry, currentCity, currentState, currentCountry, schoolName, major, classYear) VALUES               (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

  public boolean create(String email, String password, String firstName, String lastName, String birthDate,           String gender, String hometownCity, String hometownState, String hometownCountry, String currentCity,          String currentState, String currentCountry, String schoolName, String major, String classYear) {
    PreparedStatement stmt = null;
    Connection conn = null;
    ResultSet rs = null;
    try {
      conn = DbConnection.getConnection();
      stmt = conn.prepareStatement(CHECK_EMAIL_STMT);
      stmt.setString(1, email);
      rs = stmt.executeQuery();
      if (!rs.next()) {
        // Theoretically this can't happen, but just in case...
        return false;
      }
      int result = rs.getInt(1);
      if (result > 0) {
        // This email is already in use
        return false; 
      }
      
      try { stmt.close(); }
      catch (Exception e) { }

      stmt = conn.prepareStatement(NEW_USER_STMT);
      stmt.setString(1, email);
      stmt.setString(2, password);
      stmt.setString(3, firstName);
      stmt.setString(4, lastName);
      stmt.setString(5, birthDate);
      stmt.setString(6, gender);
      stmt.setString(7, hometownCity);
      stmt.setString(8, hometownState);
      stmt.setString(9, hometownCountry);
      stmt.setString(10, currentCity);
      stmt.setString(11, currentState);
      stmt.setString(12, currentCountry);
      stmt.setString(13, schoolName);
      stmt.setString(14, major);
      stmt.setString(15, classYear);
      
      stmt.executeUpdate();

      return true;
    } catch (SQLException e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    } finally {
      if (rs != null) {
        try { rs.close(); }
        catch (SQLException e) { ; }
        rs = null;
      }
      
      if (stmt != null) {
        try { stmt.close(); }
        catch (SQLException e) { ; }
        stmt = null;
      }
      
      if (conn != null) {
        try { conn.close(); }
        catch (SQLException e) { ; }
        conn = null;
      }
    }
  }
}