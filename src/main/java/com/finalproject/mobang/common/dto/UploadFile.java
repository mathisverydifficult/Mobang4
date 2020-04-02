package com.finalproject.mobang.common.dto;

import org.springframework.web.multipart.MultipartFile;
// DB에 넣는 용도뿐만 아니라 파일저장할 때도 사용함
public class UploadFile {
	private int seqQ;
	private String name;
	private String content;
	private MultipartFile mpfile;
	private String filepath;
	
	
	
	public UploadFile() {
		super();
	}
	
	
	// 사용할 컬럼들만
	public UploadFile(int seqQ, String name, String content) {
		super();
		this.seqQ = seqQ;
		this.name = name;
		this.content = content;
	}





	public int getSeqQ() {
		return seqQ;
	}

	public void setSeqQ(int seqQ) {
		this.seqQ = seqQ;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile getMpfile() {
		return mpfile;
	}
	public void setMpfile(MultipartFile mpfile) {
		this.mpfile = mpfile;
	}


	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	
	
}
