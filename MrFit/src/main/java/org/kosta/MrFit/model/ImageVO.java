package org.kosta.MrFit.model;

public class ImageVO {
	private String image_no;
	private String pno;
	private String url;
	public ImageVO() {
		super();
	}
	public ImageVO(String image_no, String pno, String url) {
		super();
		this.image_no = image_no;
		this.pno = pno;
		this.url = url;
	}
	public String getImage_no() {
		return image_no;
	}
	public void setImage_no(String image_no) {
		this.image_no = image_no;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "ImageVO [image_no=" + image_no + ", pno=" + pno + ", url=" + url + "]";
	}
}
