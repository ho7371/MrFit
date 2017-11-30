package org.kosta.MrFit.model;

public class PointVO {
	private String point_no;
	private String id;
	private int updown;
	private String change_date;
	private String status;
	public PointVO() {
		super();
	}
	public PointVO(String point_no, String id, int updown, String change_date, String status) {
		super();
		this.point_no = point_no;
		this.id = id;
		this.updown = updown;
		this.change_date = change_date;
		this.status = status;
	}
	public String getPoint_no() {
		return point_no;
	}
	public void setPoint_no(String point_no) {
		this.point_no = point_no;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "PointVO [point_no=" + point_no + ", id=" + id + ", updown=" + updown + ", change_date=" + change_date
				+ ", status=" + status + "]";
	}
	
}
