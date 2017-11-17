package org.kosta.MrFit.model;

public class GradeVO {
	private String gno;
	private String grade;
	private double percent;
	public GradeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GradeVO(String gno, String grade, double percent) {
		super();
		this.gno = gno;
		this.grade = grade;
		this.percent = percent;
	}
	public String getGno() {
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public double getPercent() {
		return percent;
	}
	public void setPercent(double percent) {
		this.percent = percent;
	}
	@Override
	public String toString() {
		return "GradeVO [gno=" + gno + ", grade=" + grade + ", percent=" + percent + "]";
	}
	

	
}
