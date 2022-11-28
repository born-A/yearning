package comment;

public class Comment {
	private int commentID;
	private int postID;
	private String userID;
	private String commentDate;
	private String commentText;
	private int commentAvilable;

	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getPostID() {
		return postID;
	}
	public void setPostID(int bbsID) {
		this.postID = bbsID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public int getCommentAvilable() {
		return commentAvilable;
	}
	public void setCommentAvilable(int commentAvilable) {
		this.commentAvilable = commentAvilable;
	}
}
