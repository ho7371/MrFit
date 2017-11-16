package org.kosta.MrFit.model;

public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String phone;
	private String address;
	private String email;
	private GradeVO gradeVO;
	private int point;
	private int totalSpent;
	private String auth;
	
	public MemberVO() {
		super();
	}

	public MemberVO(String id, String password, String name, String phone, String address, String email,
			GradeVO gradeVO, int point, int totalSpent, String auth) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.gradeVO = gradeVO;
		this.point = point;
		this.totalSpent = totalSpent;
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public GradeVO getGradeVO() {
		return gradeVO;
	}

	public void setGradeVO(GradeVO gradeVO) {
		this.gradeVO = gradeVO;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotalSpent() {
		return totalSpent;
	}

	public void setTotalSpent(int totalSpent) {
		this.totalSpent = totalSpent;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone + ", address="
				+ address + ", email=" + email + ", gradeVO=" + gradeVO + ", point=" + point + ", totalSpent="
				+ totalSpent + ", auth=" + auth + "]";
	}
}
