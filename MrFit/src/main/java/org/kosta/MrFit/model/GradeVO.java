package org.kosta.MrFit.model;

public class GradeVO {
	private String grade;
	private double percent;
	public GradeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GradeVO(String grade, double percent) {
		super();
		this.grade = grade;
		this.percent = percent;
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
		return "GradeVO [grade=" + grade + ", percent=" + percent + "]";
	}
	

	
}
