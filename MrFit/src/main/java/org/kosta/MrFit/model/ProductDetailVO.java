package org.kosta.MrFit.model;

import java.util.List;

public class ProductDetailVO {
	private String pdno;
	private String size;
	private String color;
	private String inventory;
	private String psno;
	private String pno;
	private List<ProductSizeVO> sizeList;
	public ProductDetailVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDetailVO(String pdno, String size, String color, String inventory, String psno, String pno,
			List<ProductSizeVO> sizeList) {
		super();
		this.pdno = pdno;
		this.size = size;
		this.color = color;
		this.inventory = inventory;
		this.psno = psno;
		this.pno = pno;
		this.sizeList = sizeList;
	}
	public String getPdno() {
		return pdno;
	}
	public void setPdno(String pdno) {
		this.pdno = pdno;
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
	public String getPsno() {
		return psno;
	}
	public void setPsno(String psno) {
		this.psno = psno;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public List<ProductSizeVO> getSizeList() {
		return sizeList;
	}
	public void setSizeList(List<ProductSizeVO> sizeList) {
		this.sizeList = sizeList;
	}
	@Override
	public String toString() {
		return "ProductDetailVO [pdno=" + pdno + ", size=" + size + ", color=" + color + ", inventory=" + inventory
				+ ", psno=" + psno + ", pno=" + pno + ", sizeList=" + sizeList + "]";
	}
	
}
