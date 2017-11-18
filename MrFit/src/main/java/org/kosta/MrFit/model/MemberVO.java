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
	private String status;
	private String answer;
	private String qno;
	public MemberVO() {
		super();
	}
	public MemberVO(String id, String password, String name, String phone, String address, String email,
			GradeVO gradeVO, int point, int totalSpent, String status, String answer, String qno) {
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
		this.status = status;
		this.answer = answer;
		this.qno = qno;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQno() {
		return qno;
	}
	public void setQno(String qno) {
		this.qno = qno;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone + ", address="
				+ address + ", email=" + email + ", gradeVO=" + gradeVO + ", point=" + point + ", totalSpent="
				+ totalSpent + ", status=" + status + ", answer=" + answer + ", qno=" + qno + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((answer == null) ? 0 : answer.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gradeVO == null) ? 0 : gradeVO.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + point;
		result = prime * result + ((qno == null) ? 0 : qno.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + totalSpent;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVO other = (MemberVO) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (answer == null) {
			if (other.answer != null)
				return false;
		} else if (!answer.equals(other.answer))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gradeVO == null) {
			if (other.gradeVO != null)
				return false;
		} else if (!gradeVO.equals(other.gradeVO))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (point != other.point)
			return false;
		if (qno == null) {
			if (other.qno != null)
				return false;
		} else if (!qno.equals(other.qno))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (totalSpent != other.totalSpent)
			return false;
		return true;
	}
	
	
	
}
