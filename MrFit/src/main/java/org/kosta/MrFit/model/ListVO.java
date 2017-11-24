package org.kosta.MrFit.model;

import java.util.List;

public class ListVO<T> {
	private List<T> list;
	//private PagingBean0 pagingBean;	// 수정자 : 진호
	private PagingBean pagingBean;
	public ListVO() {
		super();
	}
	public ListVO(List<T> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
}
