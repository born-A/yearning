package post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostDAO {
	private Connection conn;
	private ResultSet rs;
	
	
	public PostDAO() {
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
		String SQL = "SELECT postID FROM POST ORDER BY postID DESC";
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
	
	public int write(String postTitle, String userID, String postContent) {
		String SQL = "INSERT INTO post VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);//현재 연결되는 객체를 이용해서 SQL을 실행 준비 단계로 만들어줌.
			pstmt.setInt(1, getNext());
			pstmt.setString(2, postTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, postContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public ArrayList<Post> getList(int pageNumber) {
        String SQL = "SELECT * FROM POST WHERE postID < ? AND postAvailable = 1 ORDER BY postID DESC LIMIT 10";
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);//현재 연결되는 객체를 이용해서 SQL을 실행 준비 단계로 만들어줌.
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 9);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Post post = new Post();
				post.setPostID(rs.getInt(1));
				post.setPostTitle(rs.getString(2));
				post.setUserID(rs.getString(3));
				post.setPostDate(rs.getString(4));
				post.setPostContent(rs.getString(5));
				post.setPostAvailable(rs.getInt(6));
				list.add(post);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) { //페이징처
		String SQL = "SELECT * FROM post WHERE PostID < ? AND postAvailable = 1";
		ArrayList<Post> list = new ArrayList<Post>();
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
	
	public Post getPost(int postID) {
		String SQL = "SELECT * FROM post WHERE PostID = ?";
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);//현재 연결되는 객체를 이용해서 SQL을 실행 준비 단계로 만들어줌.
			pstmt.setInt(1,postID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Post post = new Post();
				post.setPostID(rs.getInt(1));
				post.setPostTitle(rs.getString(2));
				post.setUserID(rs.getString(3));
				post.setPostDate(rs.getString(4));
				post.setPostContent(rs.getString(5));
				post.setPostAvailable(rs.getInt(6));
				return post;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int postID, String postTitle, String postContent) {	
		String SQL = "UPDATE post SET postTitle = ?, postContent = ? WHERE postID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, postTitle);
			pstmt.setString(2, postContent);
			pstmt.setInt(3, postID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
	
	public int delete(int postID) {
		String SQL = "UPDATE post SET postAvailable = 0 WHERE postID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,postID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //DB 오류 
	}
}
