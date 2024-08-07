package catshap.butler.bean;

import java.sql.Timestamp;

public class UserAuthcode {

	private int userno;
	private String usid;
	private int uautocode;
	private Timestamp uautocoderegdate;

	public UserAuthcode() {
	}

	public UserAuthcode(int userno, String usid, int uautocode, Timestamp uautocoderegdate) {
		super();
		this.userno = userno;
		this.usid = usid;
		this.uautocode = uautocode;
		this.uautocoderegdate = uautocoderegdate;
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

	public int getUautocode() {
		return uautocode;
	}

	public void setUautocode(int uautocode) {
		this.uautocode = uautocode;
	}

	public Timestamp getUautocoderegdate() {
		return uautocoderegdate;
	}

	public void setUautocoderegdate(Timestamp uautocoderegdate) {
		this.uautocoderegdate = uautocoderegdate;
	}

	@Override
	public String toString() {
		return "UserAuthcode [userno=" + userno + ", usid=" + usid + ", uautocode=" + uautocode + ", uautocoderegdate="
				+ uautocoderegdate + "]";
	}

}
