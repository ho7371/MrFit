package org.kosta.MrFit.model;

public class InquiryReplyVO {
	private String iqrno;
	private String content;
	private String regdate;
	private String security;
	
	public InquiryReplyVO() {
		super();
	}
	public InquiryReplyVO(String iqrno, String content, String regdate, String security, String iqno) {
		super();
		this.iqrno = iqrno;
		this.content = content;
		this.regdate = regdate;
		this.security = security;
	}
	public String getIqrno() {
		return iqrno;
	}
	public void setIqrno(String iqrno) {
		this.iqrno = iqrno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getSecurity() {
		return security;
	}
	public void setSecurity(String security) {
		this.security = security;
	}
	@Override
	public String toString() {
		return "InquiryReplyVO [iqrno=" + iqrno + ", content=" + content + ", regdate=" + regdate + ", security="
				+ security + "]";
	}
}
