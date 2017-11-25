package org.kosta.MrFit.model;

public class NoteVO {
	private int note_no;
	private String content;
	private String send_date;
	private String id;
	public NoteVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoteVO(int note_no, String content, String send_date, String id) {
		super();
		this.note_no = note_no;
		this.content = content;
		this.send_date = send_date;
		this.id = id;
	}
	public int getNote_no() {
		return note_no;
	}
	public void setNote_no(int note_no) {
		this.note_no = note_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "NoteVO [note_no=" + note_no + ", content=" + content + ", send_date=" + send_date + ", id=" + id + "]";
	}
	
	
}
