package offline;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OffpostDAO {

	private Connection conn;	//db에 접근하는 객체
	private ResultSet rs;
	
	public OffpostDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/yearning";
			String dbID = "root";
			String dbPassword = "0331";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	public int getNext() {
		String SQL = "SELECT offpostID FROM offpost ORDER BY offpostID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //첫번째 게시물인 경우
	}
	
	public int getCount(int boardID) {
		String SQL = "SELECT COUNT(*) FROM offpost WHERE boardID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {	
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(int boardID, String offpostTitle, String userID, String offpostContent) {
		String SQL = "INSERT INTO offpost VALUES(?, ?, ?, ?, ?, ?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2, getNext());
			pstmt.setString(3, offpostTitle);
			pstmt.setString(4, userID);
			pstmt.setString(5, getDate());
			pstmt.setString(6, offpostContent);
			pstmt.setInt(7, 1);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Offpost> getList(int boardID, int pageNumber){
		String SQL = "SELECT * FROM offpost WHERE boardID = ? AND offpostID < ? AND offpostAvailable = 1 ORDER BY offpostID DESC LIMIT 10"; 
		ArrayList<Offpost> list = new ArrayList<Offpost>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Offpost offpost = new Offpost();
				offpost.setBoardID(rs.getInt(1));
				offpost.setOffpostID(rs.getInt(2));
				offpost.setOffpostTitle(rs.getString(3));
				offpost.setUserID(rs.getString(4));
				offpost.setOffpostDate(rs.getString(5));
				offpost.setOffpostContent(rs.getString(6));
				offpost.setOffpostAvailable(rs.getInt(7));
				list.add(offpost);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	public ArrayList<Offpost> searchList(int boardID, int pageNumber, String search){
		String SQL = "SELECT * FROM offpost WHERE boardID = ? AND offpostID < ? AND (offpostTitle like ? OR offpostContent like ?) AND offpostAvailable = 1 ORDER BY offpostID DESC LIMIT 10"; 
		ArrayList<Offpost> list = new ArrayList<Offpost>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2,  getNext() - (pageNumber - 1) * 10);
			pstmt.setString(3, "%"+search+"%");
			pstmt.setString(4, "%"+search+"%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Offpost offpost = new Offpost();
				offpost.setBoardID(rs.getInt(1));
				offpost.setOffpostID(rs.getInt(2));
				offpost.setOffpostTitle(rs.getString(3));
				offpost.setUserID(rs.getString(4));
				offpost.setOffpostDate(rs.getString(5));
				offpost.setOffpostContent(rs.getString(6));
				offpost.setOffpostAvailable(rs.getInt(7));
				list.add(offpost);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	
	public boolean nextPage (int boardID, int pageNumber) {
		String SQL = "SELECT * FROM offpost WHERE boardID = ? AND offpostID < ? AND offpostAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류
	}
	
	public boolean searchNextPage (int boardID, int pageNumber, String search) {
		String SQL = "SELECT * FROM offpost WHERE boardID = ? AND offpostID < ? AND (offpostTitle like ? OR offpostContent like ?) AND offpostAvailable = 1 ORDER BY offpostID DESC LIMIT 10"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			pstmt.setInt(2,  getNext() - (pageNumber - 1) * 10);
			pstmt.setString(3, "%"+search+"%");
			pstmt.setString(4, "%"+search+"%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류
	}
	
	public Offpost getOffpost(int offpostID) {
		String SQL = "SELECT * FROM offpost WHERE offpostID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  offpostID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Offpost offpost = new Offpost();
				offpost.setBoardID(rs.getInt(1));
				offpost.setOffpostID(rs.getInt(2));
				offpost.setOffpostTitle(rs.getString(3));
				offpost.setUserID(rs.getString(4));
				offpost.setOffpostDate(rs.getString(5));
				offpost.setOffpostContent(rs.getString(6));
				offpost.setOffpostAvailable(rs.getInt(7));
				return offpost;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int offpostID, String offpostTitle, String offpostContent) {
		String SQL = "UPDATE offpost SET offpostTitle = ?, offpostContent = ? WHERE offpostID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, offpostTitle);
			pstmt.setString(2, offpostContent);
			pstmt.setInt(3, offpostID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int offpostID) {
		String SQL = "DELETE FROM offpost WHERE offpostID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, offpostID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
