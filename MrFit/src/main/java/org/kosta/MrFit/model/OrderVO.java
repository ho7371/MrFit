package org.kosta.MrFit.model;

public class OrderVO {
	private String ono;
	private int totalprice;
	private String ordertime;
	private String status;
	private String destination;
	private MemberVO memberVO;
	private OrderProductVO orderProductVO;
	public OrderVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderVO(String ono, int totalprice, String ordertime, String status, String destination, MemberVO memberVO,
			OrderProductVO orderProductVO) {
		super();
		this.ono = ono;
		this.totalprice = totalprice;
		this.ordertime = ordertime;
		this.status = status;
		this.destination = destination;
		this.memberVO = memberVO;
		this.orderProductVO = orderProductVO;
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
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public OrderProductVO getOrderProductVO() {
		return orderProductVO;
	}
	public void setOrderProductVO(OrderProductVO orderProductVO) {
		this.orderProductVO = orderProductVO;
	}
	@Override
	public String toString() {
		return "OrderVO [ono=" + ono + ", totalprice=" + totalprice + ", ordertime=" + ordertime + ", status=" + status
				+ ", destination=" + destination + ", memberVO=" + memberVO + ", orderProductVO=" + orderProductVO
				+ "]";
	}
	
	
	
}
