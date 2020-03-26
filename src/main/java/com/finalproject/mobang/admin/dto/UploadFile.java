package com.finalproject.mobang.admin.dto;


import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	private String email;
	private String name;
	private String desc;
	private MultipartFile mpfile;
	
	
	
	
	public UploadFile() {
		super();
	}
	
	
	
	public UploadFile(String email, String name, String desc, MultipartFile mpfile) {
		super();
		this.email = email;
		this.name = name;
		this.desc = desc;
		this.mpfile = mpfile;
	}



	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public MultipartFile getMpfile() {
		return mpfile;
	}
	public void setMpfile(MultipartFile mpfile) {
		this.mpfile = mpfile;
	}
	
	
}
