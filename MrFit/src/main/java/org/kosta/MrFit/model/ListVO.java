package org.kosta.MrFit.model;

import java.util.List;

public class ListVO<T> {
	private List<T> list;
	private PagingBean0 pagingBean;
	public ListVO() {
		super();
	}
	public ListVO(List<T> list, PagingBean0 pagingBean) {
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
	public PagingBean0 getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean0 pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	

}
