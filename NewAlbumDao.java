package photoshare;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewAlbumDao{

  private static final String INSERT_ALBUM_SQL = "INSERT INTO " +
      "albums (name, user_id, dateofcreation) VALUES (?, ?, ?)";

  public boolean create(String name, int user_id) {
    PreparedStatement stmt = null;
    Connection conn = null;
    ResultSet rs = null;
    try{      
      DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
      Date dateofcreation = new Date();
      conn = DbConnection.getConnection();
      stmt = conn.prepareStatement(INSERT_ALBUM_SQL);
      stmt.setString(1, name);
      stmt.setInt(2, user_id);
      stmt.setString(3, dateFormat.format(dateofcreation));
      stmt.executeUpdate();
      stmt.close();
      stmt = null;
      conn.close();
      conn = null;
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

  private static final String GET_USERID_SQL = "SELECT " +
      "user_id FROM Users WHERE email = ?";

  public int getUserId(String email) {
    PreparedStatement stmt = null;
    Connection conn = null;
    ResultSet rs = null;
    int user_id = -1;
    try{
      conn = DbConnection.getConnection();
      stmt = conn.prepareStatement(GET_USERID_SQL);
      stmt.setString(1, email);
      
      rs = stmt.executeQuery();
      if(rs.next()) {
        user_id = rs.getInt(1);
      }
      rs.close();
      rs = null;
      stmt.close();
      stmt = null;
      conn.close();
      conn = null;
      return user_id;
    }
    catch (SQLException e) {
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

	private static final String DELETE_ALBUM_SQL = "DELETE FROM Albums WHERE albumid = ?";

  public boolean deleteAlbum(int albumid { 
    PreparedStatement stmt = null;
    Connection conn = null;
    ResultSet rs = null;
    try{      
      conn = DbConnection.getConnection();
      stmt = conn.prepareStatement(DELETE_ALBUM_SQL);
      stmt.setInt(1, albumID);
      stmt.executeUpdate();
      stmt.close();
      stmt = null;
      conn.close();
      conn = null;
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