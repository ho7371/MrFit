package org.kosta.MrFit.model;

public class ImageVO {
	private String ino;
	private String pno;
	private String url;
	public ImageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImageVO(String ino, String pno, String url) {
		super();
		this.ino = ino;
		this.pno = pno;
		this.url = url;
	}
	public String getIno() {
		return ino;
	}
	public void setIno(String ino) {
		this.ino = ino;
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
