package offline;

public class Offpost {
	private int boardID;
	private int offpostID;
	private String offpostTitle;
	private String userID;
	private String offpostDate;
	private String offpostContent;
	private int offpostAvailable;
	public int getOffpostID() {
		return offpostID;
	}
	public void setOffpostID(int offpostID) {
		this.offpostID = offpostID;
	}
	public String getOffpostTitle() {
		return offpostTitle;
	}
	public void setOffpostTitle(String offpostTitle) {
		this.offpostTitle = offpostTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getOffpostDate() {
		return offpostDate;
	}
	public void setOffpostDate(String offpostDate) {
		this.offpostDate = offpostDate;
	}
	public String getOffpostContent() {
		return offpostContent;
	}
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public void setOffpostContent(String offpostContent) {
		this.offpostContent = offpostContent;
	}
	public int getOffpostAvailable() {
		return offpostAvailable;
	}
	public void setOffpostAvailable(int offpostAvailable) {
		this.offpostAvailable = offpostAvailable;
	}
}
