package photoshare;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewLikeDao {

	private static final String NEW_LIKE_STMT = "INSERT INTO Likes (useridL, pictureidL) VALUES (?, ?)";
	
	public boolean create(int useridL, int pictureidL) {
        PreparedStatement stmt = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DbConnection.getConnection();
            stmt = conn.prepareStatement(NEW_LIKE_STMT);
            stmt.setInt(1, useridL);
            stmt.setInt(2, pictureidL);
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