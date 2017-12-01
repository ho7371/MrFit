package org.kosta.MrFit.model;

public class ProductQnaVO {
	private String pqno;	
	private String id;
	private String pno;
	private String content;
	private String regdate;
	private String security;
	public ProductQnaVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductQnaVO(String pqno, String id, String pno, String content, String regdate, String security) {
		super();
		this.pqno = pqno;
		this.id = id;
		this.pno = pno;
		this.content = content;
		this.regdate = regdate;
		this.security = security;
	}
	
	public String getPqno() {
		return pqno;
	}
	public void setPqno(String pqno) {
		this.pqno = pqno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
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
		return "ProductQNA [pqno=" + pqno + ", id=" + id + ", pno=" + pno + ", content=" + content + ", regdate="
				+ regdate + ", security=" + security + "]";
	}
	
}
