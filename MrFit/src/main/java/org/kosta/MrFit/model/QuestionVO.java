package org.kosta.MrFit.model;

public class QuestionVO {
	private String qno;
	private String question;
	public QuestionVO() {
		super();
	}
	public QuestionVO(String qno, String question) {
		super();
		this.qno = qno;
		this.question = question;
	}
	public String getQno() {
		return qno;
	}
	public void setQno(String qno) {
		this.qno = qno;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	@Override
	public String toString() {
		return "QuestionVO [qno=" + qno + ", question=" + question + "]";
	}
	
	
	

}
