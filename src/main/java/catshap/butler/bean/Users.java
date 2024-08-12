package catshap.butler.bean;

import java.sql.Timestamp;

public class Users {

	private int userNo;
	private int gradeNo;
	private String usid;
	private String uname;
	private String upass;
	private String unick;
	private String email;
	private String utelecom;
	private String uphone;
	private String ustatus;
	private String umailAddress;
	private String uaddress;
	private String udetailAddress;
	private Timestamp uregdate;
	private Timestamp uupdate;
	private String mgrCheck;
	private String mktAgree;
	private int utotalPrice;

	// 기본 생성자
	public Users() {
	}

	public Users(int userNo, int gradeNo, String usid, String uname, String upass, String unick, String email,
			String utelecom, String uphone, String ustatus, String umailAddress, String uaddress, String udetailAddress,
			Timestamp uregdate, Timestamp uupdate, String mgrCheck, String mktAgree, int utotalPrice) {
		super();
		this.userNo = userNo;
		this.gradeNo = gradeNo;
		this.usid = usid;
		this.uname = uname;
		this.upass = upass;
		this.unick = unick;
		this.email = email;
		this.utelecom = utelecom;
		this.uphone = uphone;
		this.ustatus = ustatus;
		this.umailAddress = umailAddress;
		this.uaddress = uaddress;
		this.udetailAddress = udetailAddress;
		this.uregdate = uregdate;
		this.uupdate = uupdate;
		this.mgrCheck = mgrCheck;
		this.mktAgree = mktAgree;
		this.utotalPrice = utotalPrice;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getUsid() {
		return usid;
	}

	public void setUsid(String usid) {
		this.usid = usid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getUnick() {
		return unick;
	}

	public void setUnick(String unick) {
		this.unick = unick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUtelecom() {
		return utelecom;
	}

	public void setUtelecom(String utelecom) {
		this.utelecom = utelecom;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUstatus() {
		return ustatus;
	}

	public void setUstatus(String ustatus) {
		this.ustatus = ustatus;
	}

	public String getUmailAddress() {
		return umailAddress;
	}

	public void setUmailAddress(String umailAddress) {
		this.umailAddress = umailAddress;
	}

	public String getUaddress() {
		return uaddress;
	}

	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}

	public String getUdetailAddress() {
		return udetailAddress;
	}

	public void setUdetailAddress(String udetailAddress) {
		this.udetailAddress = udetailAddress;
	}

	public Timestamp getUregdate() {
		return uregdate;
	}

	public void setUregdate(Timestamp uregdate) {
		this.uregdate = uregdate;
	}

	public Timestamp getUupdate() {
		return uupdate;
	}

	public void setUupdate(Timestamp uupdate) {
		this.uupdate = uupdate;
	}

	public String getMgrCheck() {
		return mgrCheck;
	}

	public void setMgrCheck(String mgrCheck) {
		this.mgrCheck = mgrCheck;
	}

	public String getMktAgree() {
		return mktAgree;
	}

	public void setMktAgree(String mktAgree) {
		this.mktAgree = mktAgree;
	}

	public int getUtatalPrice() {
		return utotalPrice;
	}

	public void setUtatalPrice(int utotalPrice) {
		this.utotalPrice = utotalPrice;
	}

	@Override
	public String toString() {
		return "Users [userNo=" + userNo + ", gradeNo=" + gradeNo + ", usid=" + usid + ", uname=" + uname + ", upass="
				+ upass + ", unick=" + unick + ", email=" + email + ", utelecom=" + utelecom + ", uphone=" + uphone
				+ ", ustatus=" + ustatus + ", umailAddress=" + umailAddress + ", uaddress=" + uaddress
				+ ", udetailAddress=" + udetailAddress + ", uregdate=" + uregdate + ", uupdate=" + uupdate
				+ ", mgrCheck=" + mgrCheck + ", mktAgree=" + mktAgree + ", utotalPrice=" + utotalPrice + "]";
	}

}
