package catshap.butler.bean;

import java.sql.Timestamp;

public class ReviewView {
	
	private int prodNo;
    private int userNo;
    private String uname;
    private int rewviewNo;
    private String revTitle;
    private String revText;
    private Timestamp revRegDate;
    private int revScore;
    
    public ReviewView() {
    	
    }

	public ReviewView(int prodNo, int userNo, String uname, int rewviewNo, String revTitle, String revText,
			Timestamp revRegDate, int revScore) {
		super();
		this.prodNo = prodNo;
		this.userNo = userNo;
		this.uname = uname;
		this.rewviewNo = rewviewNo;
		this.revTitle = revTitle;
		this.revText = revText;
		this.revRegDate = revRegDate;
		this.revScore = revScore;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getRewviewNo() {
		return rewviewNo;
	}

	public void setRewviewNo(int rewviewNo) {
		this.rewviewNo = rewviewNo;
	}

	public String getRevTitle() {
		return revTitle;
	}

	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}

	public String getRevText() {
		return revText;
	}

	public void setRevText(String revText) {
		this.revText = revText;
	}

	public Timestamp getRevRegDate() {
		return revRegDate;
	}

	public void setRevRegDate(Timestamp revRegDate) {
		this.revRegDate = revRegDate;
	}

	public int getRevScore() {
		return revScore;
	}

	public void setRevScore(int revScore) {
		this.revScore = revScore;
	}

	
    
    
}
