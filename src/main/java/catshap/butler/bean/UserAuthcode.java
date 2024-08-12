package catshap.butler.bean;

import java.sql.Timestamp;

public class UserAuthcode {

	private int userno;
	private String usid;
	private String uauthcode;
	private Timestamp uauthcoderegdate;

	public UserAuthcode() {
	}

	public UserAuthcode(int userno, String usid, String uauthcode, Timestamp uauthcoderegdate) {
		super();
		this.userno = userno;
		this.usid = usid;
		this.uauthcode = uauthcode;
		this.uauthcoderegdate = uauthcoderegdate;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUsid() {
		return usid;
	}

	public void setUsid(String usid) {
		this.usid = usid;
	}

	public String getUauthcode() {
		return uauthcode;
	}

	public void setUauthcode(String uauthcode) {
		this.uauthcode = uauthcode;
	}

	public Timestamp getUauthcoderegdate() {
		return uauthcoderegdate;
	}

	public void setUauthcoderegdate(Timestamp uauthcoderegdate) {
		this.uauthcoderegdate = uauthcoderegdate;
	}

	@Override
	public String toString() {
		return "UserAuthcode [userno=" + userno + ", usid=" + usid + ", uauthcode=" + uauthcode + ", uauthcoderegdate="
				+ uauthcoderegdate + "]";
	}

}
