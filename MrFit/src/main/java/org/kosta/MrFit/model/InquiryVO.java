package org.kosta.MrFit.model;

public class InquiryVO {
	private String iqno;
	private String title;
	private String content;
	private String regdate;
	private String security;
	private String id;
	private InquiryReplyVO inquiryReplyVO;
	public InquiryVO() {
		super();
	}
	public InquiryVO(String iqno, String title, String content, String regdate, String security, String id,
			InquiryReplyVO inquiryReplyVO) {
		super();
		this.iqno = iqno;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.security = security;
		this.id = id;
		this.inquiryReplyVO = inquiryReplyVO;
	}
	public String getIqno() {
		return iqno;
	}
	public void setIqno(String iqno) {
		this.iqno = iqno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public InquiryReplyVO getInquiryReplyVO() {
		return inquiryReplyVO;
	}
	public void setInquiryReplyVO(InquiryReplyVO inquiryReplyVO) {
		this.inquiryReplyVO = inquiryReplyVO;
	}
	@Override
	public String toString() {
		return "InquiryVO [iqno=" + iqno + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", security=" + security + ", id=" + id + ", inquiryReplyVO=" + inquiryReplyVO + "]";
	}
}
