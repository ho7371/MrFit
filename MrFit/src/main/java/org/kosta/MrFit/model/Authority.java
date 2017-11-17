package org.kosta.MrFit.model;

import java.io.Serializable;

public class Authority implements Serializable {

	private static final long serialVersionUID = -4113136543947339799L;
	private String id;
	private String auth;
	public Authority() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Authority(String id, String auth) {
		super();
		this.id = id;
		this.auth = auth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Authority [id=" + id + ", auth=" + auth + "]";
	}
	
	
	
}
