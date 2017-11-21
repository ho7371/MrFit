package org.kosta.MrFit.model;

import java.util.List;

public class OrderVO {
	private String ono;
	private int totalprice;
	private String destination;
	private String ordertime;
	private String status;
	private MemberVO memberVO;
	private List<OrderProductVO> opList;
	public OrderVO() {
		super();
	}
	public OrderVO(String ono, int totalprice, String destination, String ordertime, String status, MemberVO memberVO,
			List<OrderProductVO> opList) {
		super();
		this.ono = ono;
		this.totalprice = totalprice;
		this.destination = destination;
		this.ordertime = ordertime;
		this.status = status;
		this.memberVO = memberVO;
		this.opList = opList;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public List<OrderProductVO> getOpList() {
		return opList;
	}
	public void setOpList(List<OrderProductVO> opList) {
		this.opList = opList;
	}
	@Override
	public String toString() {
		return "OrderVO [ono=" + ono + ", totalprice=" + totalprice + ", destination=" + destination + ", ordertime="
				+ ordertime + ", status=" + status + ", memberVO=" + memberVO + ", opList=" + opList + "]";
	}
	
}
