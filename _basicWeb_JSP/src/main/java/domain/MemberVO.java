package domain;

public class MemberVO {

	private String id;
	private String pwd;
	private String email;
	private int team;
	private String regdate;
	private String lastlogin;
	
	public MemberVO() {
	}

	// login : id, pwd
	public MemberVO(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	// join,modify : id, pwd, email,team
	public MemberVO(String id, String pwd, String email, int team) {
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.team = team;
	}

	// 전부
	public MemberVO(String id, String pwd, String email, int team, String regdate, String lastlogin) {
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.team = team;
		this.regdate = regdate;
		this.lastlogin = lastlogin;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTeam() {
		return team;
	}

	public void setTeam(int team) {
		this.team = team;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(String lastlogin) {
		this.lastlogin = lastlogin;
	}

	@Override
	public String toString() {
		return "memberVO [id=" + id + ", pwd=" + pwd + ", email=" + email + ", team=" + team + ", regdate=" + regdate
				+ ", lastlogin=" + lastlogin + "]";
	}
	
}
