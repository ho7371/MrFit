package org.kosta.MrFit.model;

public class ImageVO {
	private String ino;
	private String pno;
	private String url;
	public ImageVO() {
		super();
	}
	public ImageVO(String image_no, String pno, String url) {
		super();
		this.ino = image_no;
		this.pno = pno;
		this.url = url;
	}
	public String getImage_no() {
		return ino;
	}
	public void setImage_no(String image_no) {
		this.ino = image_no;
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
		return "ImageVO [ino=" + ino + ", pno=" + pno + ", url=" + url + "]";
	}
}
