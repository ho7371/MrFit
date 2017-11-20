package org.kosta.MrFit.model;

public class MemberSizeVO {
	private String id;
	private int shoulder;
	private int chest;
	private int sleeve;
	private int armhole;
	private int toplength;
	private int waist;
	private int crotch;
	private int thigh;
	private int hem;
	private int bottomlength;
	public MemberSizeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberSizeVO(String id, int shoulder, int chest, int sleeve, int armhole, int toplength, int waist,
			int crotch, int thigh, int hem, int bottomlength) {
		super();
		this.id = id;
		this.shoulder = shoulder;
		this.chest = chest;
		this.sleeve = sleeve;
		this.armhole = armhole;
		this.toplength = toplength;
		this.waist = waist;
		this.crotch = crotch;
		this.thigh = thigh;
		this.hem = hem;
		this.bottomlength = bottomlength;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getShoulder() {
		return shoulder;
	}
	public void setShoulder(int shoulder) {
		this.shoulder = shoulder;
	}
	public int getChest() {
		return chest;
	}
	public void setChest(int chest) {
		this.chest = chest;
	}
	public int getSleeve() {
		return sleeve;
	}
	public void setSleeve(int sleeve) {
		this.sleeve = sleeve;
	}
	public int getArmhole() {
		return armhole;
	}
	public void setArmhole(int armhole) {
		this.armhole = armhole;
	}
	public int getToplength() {
		return toplength;
	}
	public void setToplength(int toplength) {
		this.toplength = toplength;
	}
	public int getWaist() {
		return waist;
	}
	public void setWaist(int waist) {
		this.waist = waist;
	}
	public int getCrotch() {
		return crotch;
	}
	public void setCrotch(int crotch) {
		this.crotch = crotch;
	}
	public int getThigh() {
		return thigh;
	}
	public void setThigh(int thigh) {
		this.thigh = thigh;
	}
	public int getHem() {
		return hem;
	}
	public void setHem(int hem) {
		this.hem = hem;
	}
	public int getBottomlength() {
		return bottomlength;
	}
	public void setBottomlength(int bottomlength) {
		this.bottomlength = bottomlength;
	}
	@Override
	public String toString() {
		return "MemberSizeVO [id=" + id + ", shoulder=" + shoulder + ", chest=" + chest + ", sleeve=" + sleeve
				+ ", armhole=" + armhole + ", toplength=" + toplength + ", waist=" + waist + ", crotch=" + crotch
				+ ", thigh=" + thigh + ", hem=" + hem + ", bottomlength=" + bottomlength + "]";
	}
	
	
}
