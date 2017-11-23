package org.kosta.MrFit.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadVO {
	private String pno;
	private List<MultipartFile> file;
	
	public UploadVO() {
		super();
	}
	public UploadVO(String pno, List<MultipartFile> file) {
		super();
		this.pno = pno;
		this.file = file;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "UploadVO [pno=" + pno + ", file=" + file + "]";
	}
}
	
