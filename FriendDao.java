package photoshare;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NewFriendDao {

	private static final String LIST_ALL_FRIENDS_ID_SQL = "SELECT userid2 FROM Friends WHERE userid1 = ?";

	private static final String LIST_ALL_FRIENDS_SQL = "SELECT DISTINCT firstname, lastname FROM Users U, ("+LIST_ALL_FRIENDS_ID_SQL + ") F WHERE U.userid = F.userid2"

	private static final String NEW_FRIEND_STMT = "INSERT INTO Friends (userid1,userid2) VALUES (?, ?)";

	public boolean newFriend(int userid1, int userid2) {
		PreparedStatement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DbConnection.getConnection();
			stmt = conn.prepareStatement(CHECK_FRIEND_STMT);
			stmt.setInt(1, userid1);
			stmt.setInt(2, userid2);
			rs = stmt.executeQuery();
			if (!rs.next()) {
				return false;
			}
			int result = rs.getInt(1);
			if (result > 0) {
				return false;
			}
			if (userid1 == userid2) {
				return false; 
			}
			try { stmt.close(); }
			catch (Exception e) { }
			stmt = conn.prepareStatement(NEW_USER_STMT);
			stmt.setString(1, userid1);
			stmt.setString(2, userid2);
			stmt.executeUpdate();
			return true;
		} 
		catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		finally {
			if (rs != null) {
				try { rs.close();
				}
				catch (SQLException e) { ; }
				rs = null;
			}
			if (stmt != null) {
				try { stmt.close();
				}
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

	public List<String> listFriendsNames (int userid1) {
		PreparedStatement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		List<String> friendsNames = new ArrayList<String>();
		try {
			conn = DbConnection.getConnection();
			stmt = conn.prepareStatement(LIST_ALL_FRIENDS_SQL);
			stmt.setInt(1, userid1);
			rs = stmt.executeQuery();
			while (rs.next()){
				friendsNames.add("<b>Name:</b> " + rs.getString(1) + " " + rs.getString(2));
			}
			rs.close();
			rs = null;
			stmt.close();
			stmt = null;
			conn.close();
			conn = null;
		}
		catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		finally {
			if (rs != null) {
				try { rs.close(); } catch (SQLException e) { ; }
				rs = null;
			}
			if (stmt != null) {
				try { stmt.close(); } catch (SQLException e) { ; }
				stmt = null;
			}
			if (conn != null) {
				try { conn.close(); } catch (SQLException e) { ; }
				conn = null;
			}
		}
		return friendsNames;
	}
}
