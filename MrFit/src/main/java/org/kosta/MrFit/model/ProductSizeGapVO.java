
package org.kosta.MrFit.model;

public class ProductSizeGapVO {
	private String sizeGap1;
	private String sizeGap2;
	private String sizeGap3;
	private String sizeGap4;
	private String sizeGap5;
	public ProductSizeGapVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductSizeGapVO(String sizeGap1, String sizeGap2, String sizeGap3, String sizeGap4, String sizeGap5) {
		super();
		this.sizeGap1 = sizeGap1;
		this.sizeGap2 = sizeGap2;
		this.sizeGap3 = sizeGap3;
		this.sizeGap4 = sizeGap4;
		this.sizeGap5 = sizeGap5;
	}
	public String getSizeGap1() {
		return sizeGap1;
	}
	public void setSizeGap1(String sizeGap1) {
		this.sizeGap1 = sizeGap1;
	}
	public String getSizeGap2() {
		return sizeGap2;
	}
	public void setSizeGap2(String sizeGap2) {
		this.sizeGap2 = sizeGap2;
	}
	public String getSizeGap3() {
		return sizeGap3;
	}
	public void setSizeGap3(String sizeGap3) {
		this.sizeGap3 = sizeGap3;
	}
	public String getSizeGap4() {
		return sizeGap4;
	}
	public void setSizeGap4(String sizeGap4) {
		this.sizeGap4 = sizeGap4;
	}
	public String getSizeGap5() {
		return sizeGap5;
	}
	public void setSizeGap5(String sizeGap5) {
		this.sizeGap5 = sizeGap5;
	}
	@Override
	public String toString() {
		return "ProductSizeGapVO [sizeGap1=" + sizeGap1 + ", sizeGap2=" + sizeGap2 + ", sizeGap3=" + sizeGap3
				+ ", sizeGap4=" + sizeGap4 + ", sizeGap5=" + sizeGap5 + "]";
	}
	
}
