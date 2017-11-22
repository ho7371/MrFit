package org.kosta.MrFit.model;

public class PointVO {
	private String id;
	private int updown;
	private String change_date;
	public PointVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PointVO(String id, int updown, String change_date) {
		super();
		this.id = id;
		this.updown = updown;
		this.change_date = change_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUpdown() {
		return updown;
	}
	public void setUpdown(int updown) {
		this.updown = updown;
	}
	public String getChange_date() {
		return change_date;
	}
	public void setChange_date(String change_date) {
		this.change_date = change_date;
	}
	@Override
	public String toString() {
		return "PointVO [id=" + id + ", updown=" + updown + ", change_date=" + change_date + "]";
	}
	
}
