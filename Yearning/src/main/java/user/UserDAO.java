package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//DAO는 실제로 db에 접근해서 어떠한 데이터를 가져오거나 데이터를 넣는 역할을 하는 데이터 접근객체
public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public UserDAO() {
		try{
			String dbURL="jdbc:mysql://localhost:3306/yearning";
			String dbID = "root";
			String dbPassword = "0331";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); //sql Injection 공격 방어 수단 : 1번째 물음표에 userID 입력
			rs = pstmt.executeQuery(); // 쿼리 실행 
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword)) // rs.getString(1) : select된 첫번째 컬럼
					return 1; //로그인 성공
				else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디 없음 
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -2; //DB 오류 
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
}
