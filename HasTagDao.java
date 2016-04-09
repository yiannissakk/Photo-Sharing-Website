package photoshare;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HasTagDao {
	private static final String INSERT_TAG = "INSERT INTO hasatag (tag, pictureidT) VALUES (?, ?)";

	public boolean create(int tag, int pictureidT) {
        PreparedStatement stmt = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DbConnection.getConnection();
            stmt = conn.prepareStatement(INSERT_TAG);
            stmt.setInt(1, tag);
            stmt.setInt(2, pictureidT);
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