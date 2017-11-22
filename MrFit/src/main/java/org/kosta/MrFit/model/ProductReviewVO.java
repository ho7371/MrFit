package org.kosta.MrFit.model;

public class ProductReviewVO {
	private String rno;
	private String pdno;
	private String color_name;
	private String size_name;
	private String id;
	private String content;
	private String regdate;
	public ProductReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductReviewVO(String rno, String pdno, String color_name, String size_name, String id, String content,
			String regdate) {
		super();
		this.rno = rno;
		this.pdno = pdno;
		this.color_name = color_name;
		this.size_name = size_name;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public String getPdno() {
		return pdno;
	}
	public void setPdno(String pdno) {
		this.pdno = pdno;
	}
	public String getColor_name() {
		return color_name;
	}
	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}
	public String getSize_name() {
		return size_name;
	}
	public void setSize_name(String size_name) {
		this.size_name = size_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	@Override
	public String toString() {
		return "ProductReviewVO [rno=" + rno + ", pdno=" + pdno + ", color_name=" + color_name + ", size_name="
				+ size_name + ", id=" + id + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
}
