package org.kosta.MrFit.model;

public class OrderProductVO {
	private String ono;
	private String pdno;
	private int quantity;
	public OrderProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderProductVO(String ono, String pdno, int quantity) {
		super();
		this.ono = ono;
		this.pdno = pdno;
		this.quantity = quantity;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getPdno() {
		return pdno;
	}
	public void setPdno(String pdno) {
		this.pdno = pdno;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "OrderProductVO [ono=" + ono + ", pdno=" + pdno + ", quantity=" + quantity + "]";
	}
	
	
}
