package org.kosta.MrFit.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadVO {
	private String pno;
	private List<MultipartFile> files;
	
	public UploadVO() {
		super();
	}
	public UploadVO(String pno, List<MultipartFile> files) {
		super();
		this.pno = pno;
		this.files = files;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	@Override
	public String toString() {
		return "UploadVO [pno=" + pno + ", files=" + files + "]";
	}
}
	
