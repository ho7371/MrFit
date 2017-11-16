package org.kosta.MrFit.model;

public class GradeVO {
	private String grade_no;
	private String grade;
	private double percent;
	
	public GradeVO() {
		super();
	}

	public GradeVO(String grade_no, String grade, double percent) {
		super();
		this.grade_no = grade_no;
		this.grade = grade;
		this.percent = percent;
	}

	public String getGrade_no() {
		return grade_no;
	}

	public void setGrade_no(String grade_no) {
		this.grade_no = grade_no;
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
		return "GradeVO [grade_no=" + grade_no + ", grade=" + grade + ", percent=" + percent + "]";
	}
	
}
