package org.kosta.MrFit.model;

public class ProductDetailVO {
	private String pdno;
	private String pno;
	private String pcno;
	private String psno;
	private String color_name;
	private ProductSizeVO productSizeVO;
	public ProductDetailVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDetailVO(String pdno, String pno, String pcno, String psno, String color_name,
			ProductSizeVO productSizeVO) {
		super();
		this.pdno = pdno;
		this.pno = pno;
		this.pcno = pcno;
		this.psno = psno;
		this.color_name = color_name;
		this.productSizeVO = productSizeVO;
	}
	public String getPdno() {
		return pdno;
	}
	public void setPdno(String pdno) {
		this.pdno = pdno;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getPcno() {
		return pcno;
	}
	public void setPcno(String pcno) {
		this.pcno = pcno;
	}
	public String getPsno() {
		return psno;
	}
	public void setPsno(String psno) {
		this.psno = psno;
	}
	public String getColor_name() {
		return color_name;
	}
	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}
	public ProductSizeVO getProductSizeVO() {
		return productSizeVO;
	}
	public void setProductSizeVO(ProductSizeVO productSizeVO) {
		this.productSizeVO = productSizeVO;
	}
	@Override
	public String toString() {
		return "ProductDetailVO [pdno=" + pdno + ", pno=" + pno + ", pcno=" + pcno + ", psno=" + psno + ", color_name="
				+ color_name + ", productSizeVO=" + productSizeVO + "]";
	}
	
	
}
