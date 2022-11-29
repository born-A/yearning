package issue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import issue.Issue;

public class IssueDAO {
	private Connection conn;
	private ResultSet rs;
	
	
	public IssueDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);//현재 연결되는 객체를 이용해서 SQL을 실행 준비 단계로 만들어줌.
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "SELECT issueID FROM issue ORDER BY issueID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);//현재 연결되는 객체를 이용해서 SQL을 실행 준비 단계로 만들어줌.
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; // 첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	} 
	
	public int write(String issueTitle,String issueContent) {
		String SQL = "INSERT INTO issue VALUES (?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);//현재 연결되는 객체를 이용해서 SQL을 실행 준비 단계로 만들어줌.
			pstmt.setInt(1, getNext());
			pstmt.setString(2, issueTitle);
			pstmt.setString(3, getDate());
			pstmt.setString(4, issueContent);
			pstmt.setInt(5, 1);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Issue> getList(int pageNumber) {
        String SQL = "SELECT * FROM issue WHERE issueID < ? AND issueAvailable = 1 ORDER BY issueID DESC LIMIT 10";
		ArrayList<Issue> list = new ArrayList<Issue>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);//현재 연결되는 객체를 이용해서 SQL을 실행 준비 단계로 만들어줌.
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 9);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Issue issue = new Issue();
				issue.setIssueID(rs.getInt(1));
				issue.setIssueTitle(rs.getString(2));
				issue.setIssueDate(rs.getString(3));
				issue.setIssueContent(rs.getString(4));
				issue.setIssueAvailable(rs.getInt(5));
				list.add(issue);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Issue> searchList(int pageNumber, String search){
		String SQL = "SELECT * FROM issue WHERE issueID < ? AND (issueTitle like ? OR issueContent like ? ) AND issueAvailable = 1 ORDER BY issueID DESC LIMIT 10"; 
		ArrayList<Issue> list = new ArrayList<Issue>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Issue issue = new Issue();
				issue.setIssueID(rs.getInt(1));
				issue.setIssueTitle(rs.getString(2));
				issue.setIssueDate(rs.getString(3));
				issue.setIssueContent(rs.getString(4));
				issue.setIssueAvailable(rs.getInt(5));
				list.add(issue);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	
	public boolean nextPage(int pageNumber) { //페이징처
		String SQL = "SELECT * FROM issue WHERE issueID < ? AND issueAvailable = 1";
		ArrayList<Issue> list = new ArrayList<Issue>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);//현재 연결되는 객체를 이용해서 SQL을 실행 준비 단계로 만들어줌.
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Issue getissue(int issueID) {
		String SQL = "SELECT * FROM issue WHERE issueID = ?";
		ArrayList<Issue> list = new ArrayList<Issue>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);//현재 연결되는 객체를 이용해서 SQL을 실행 준비 단계로 만들어줌.
			pstmt.setInt(1,issueID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Issue issue = new Issue();
				issue.setIssueID(rs.getInt(1));
				issue.setIssueTitle(rs.getString(2));
				issue.setIssueDate(rs.getString(3));
				issue.setIssueContent(rs.getString(4));
				issue.setIssueAvailable(rs.getInt(5));
				return issue;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int issueID, String issueTitle, String issueContent) {	
		String SQL = "UPDATE issue SET issueTitle = ?, issueContent = ? WHERE issueID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, issueTitle);
			pstmt.setString(2, issueContent);
			pstmt.setInt(3, issueID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
	
	public int delete(int issueID) {
		String SQL = "UPDATE issue SET issueAvailable = 0 WHERE issueID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,issueID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
}
