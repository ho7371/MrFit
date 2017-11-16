package org.kosta.MrFit.model;

public class ProductDetailVO {
	private String pdetail_no;
	private String size;
	private String color;
	private String inventory;
	private String psize_no;
	private String pno;
	public ProductDetailVO() {
		super();
	}
	public ProductDetailVO(String pdetail_no, String size, String color, String inventory, String psize_no,
			String pno) {
		super();
		this.pdetail_no = pdetail_no;
		this.size = size;
		this.color = color;
		this.inventory = inventory;
		this.psize_no = psize_no;
		this.pno = pno;
	}
	
	
	public String getPdetail_no() {
		return pdetail_no;
	}
	public void setPdetail_no(String pdetail_no) {
		this.pdetail_no = pdetail_no;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}
	public String getPsize_no() {
		return psize_no;
	}
	public void setPsize_no(String psize_no) {
		this.psize_no = psize_no;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	@Override
	public String toString() {
		return "ProductDetailVO [pdetail_no=" + pdetail_no + ", size=" + size + ", color=" + color + ", inventory="
				+ inventory + ", psize_no=" + psize_no + ", pno=" + pno + "]";
	}
	
}
