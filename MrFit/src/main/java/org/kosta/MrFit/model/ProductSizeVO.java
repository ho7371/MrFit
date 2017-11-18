package org.kosta.MrFit.model;

public class ProductSizeVO {
private String psno;
private int size1;
private int size2;
private int size3;
private int size4;
private int size5;
private String size_type;
private int inventory;
private int pdno;
public ProductSizeVO() {
	super();
	// TODO Auto-generated constructor stub
}
public ProductSizeVO(String psno, int size1, int size2, int size3, int size4, int size5, String size_type,
		int inventory, int pdno) {
	super();
	this.psno = psno;
	this.size1 = size1;
	this.size2 = size2;
	this.size3 = size3;
	this.size4 = size4;
	this.size5 = size5;
	this.size_type = size_type;
	this.inventory = inventory;
	this.pdno = pdno;
}
public String getPsno() {
	return psno;
}
public void setPsno(String psno) {
	this.psno = psno;
}
public int getSize1() {
	return size1;
}
public void setSize1(int size1) {
	this.size1 = size1;
}
public int getSize2() {
	return size2;
}
public void setSize2(int size2) {
	this.size2 = size2;
}
public int getSize3() {
	return size3;
}
public void setSize3(int size3) {
	this.size3 = size3;
}
public int getSize4() {
	return size4;
}
public void setSize4(int size4) {
	this.size4 = size4;
}
public int getSize5() {
	return size5;
}
public void setSize5(int size5) {
	this.size5 = size5;
}
public String getSize_type() {
	return size_type;
}
public void setSize_type(String size_type) {
	this.size_type = size_type;
}
public int getInventory() {
	return inventory;
}
public void setInventory(int inventory) {
	this.inventory = inventory;
}
public int getPdno() {
	return pdno;
}
public void setPdno(int pdno) {
	this.pdno = pdno;
}
@Override
public String toString() {
	return "ProductSizeVO [psno=" + psno + ", size1=" + size1 + ", size2=" + size2 + ", size3=" + size3 + ", size4="
			+ size4 + ", size5=" + size5 + ", size_type=" + size_type + ", inventory=" + inventory + ", pdno=" + pdno
			+ "]";
}


}
