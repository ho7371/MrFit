package org.kosta.MrFit.model;

import java.util.List;

public class ProductVO {
	private String pno;
	private String name;
	private int price;
	private String content;
	private String category;
	private String status;
	private List<ProductDetailVO> productDetailList;
	private List<ImageVO> imageList;
	
	public ProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProductVO(String pno, String name, int price, String content, String category, String status,
			List<ProductDetailVO> productDetailList, List<ImageVO> imageList) {
		super();
		this.pno = pno;
		this.name = name;
		this.price = price;
		this.content = content;
		this.category = category;
		this.status = status;
		this.productDetailList = productDetailList;
		this.imageList = imageList;
	}
	
	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<ProductDetailVO> getProductDetailList() {
		return productDetailList;
	}

	public void setProductDetailList(List<ProductDetailVO> productDetailList) {
		this.productDetailList = productDetailList;
	}

	public List<ImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<ImageVO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "ProductVO [pno=" + pno + ", name=" + name + ", price=" + price + ", category=" + category +", status " +status+"]";
	}
}
