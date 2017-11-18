package org.kosta.MrFit.model;

import java.util.List;

public class ProductDetailVO {
	private String pdno;
	private String color;
	private String pno;
	private List<ProductSizeVO> sizeList;
	public ProductDetailVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDetailVO(String pdno, String color, String pno, List<ProductSizeVO> sizeList) {
		super();
		this.pdno = pdno;
		this.color = color;
		this.pno = pno;
		this.sizeList = sizeList;
	}
	public String getPdno() {
		return pdno;
	}
	public void setPdno(String pdno) {
		this.pdno = pdno;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
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
		return "ProductDetailVO [pdno=" + pdno + ", color=" + color + ", pno=" + pno + ", sizeList=" + sizeList + "]";
	}
	
	
	
}
