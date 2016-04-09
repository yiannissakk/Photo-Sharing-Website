package photoshare;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

private static final String INSERT_COMMENT_STMT = "INSERT INTO Comments text, owner_id VALUES (?, ?)";
public class NewCommentDao {
public boolean create(String text, int owner_id) {
    PreparedStatement stmt = null;
    Connection conn = null;
    try {
      conn = DbConnection.getConnection();
      stmt = conn.prepareStatement(INSERT_COMMENT_STMT);
      stmt.setString(1, text);
      stmt.setInt(2, owner_id);
      stmt.executeUpdate();
      
      stmt.close();
      stmt = null;
 
      conn.close();
      conn = null;
      
    } catch (SQLException e) {
      e.printStackTrace();
      throw new RuntimeException(e);
    } finally {
      if (stmt != null) {
        try { stmt.close(); } catch (SQLException e) { ; }
        stmt = null;
      }
      if (conn != null) {
        try { conn.close(); } catch (SQLException e) { ; }
        conn = null;
      }
    }
    return true;
  }
}