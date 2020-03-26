package com.finalproject.mobang.admin.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaBoardDto {

    // 글 번호 
    private int seqQ;

    // 글 그룹번호 
    private int groupseqQ;

    // 글 그룹순서 
    private int orderQ;

    // 글 제목 탭 
    private String titletQ;

    // 글 제목 
    private String titleQ;

    // 글 내용 
    private String contentQ;

    // 글 작성자 
    private String email;

    // 글 작성일자 
    private Date dateQ;
    
    // 파일 이름
    private String name;
    // 파일경로
	private String filePath;
	// 파일
	private MultipartFile mpfile;
    
    
    

    public QnaBoardDto() {
		super();
	}
    
    
    
	

	public QnaBoardDto(int seqQ, int groupseqQ, int orderQ, String titletQ, String titleQ, String contentQ,
			String email, Date dateQ, String filePath) {
		super();
		this.seqQ = seqQ;
		this.groupseqQ = groupseqQ;
		this.orderQ = orderQ;
		this.titletQ = titletQ;
		this.titleQ = titleQ;
		this.contentQ = contentQ;
		this.email = email;
		this.dateQ = dateQ;
		this.filePath = filePath;
	}





	public QnaBoardDto(int seqQ, int groupseqQ, int orderQ, String titletQ, String titleQ, String contentQ,
			String email, Date dateQ, String name, String filePath, MultipartFile mpfile) {
		super();
		this.seqQ = seqQ;
		this.groupseqQ = groupseqQ;
		this.orderQ = orderQ;
		this.titletQ = titletQ;
		this.titleQ = titleQ;
		this.contentQ = contentQ;
		this.email = email;
		this.dateQ = dateQ;
		this.name = name;
		this.filePath = filePath;
		this.mpfile = mpfile;
	}

	public int getSeqQ() {
        return seqQ;
    }

    public void setSeqQ(int seqQ) {
        this.seqQ = seqQ;
    }

    public int getGroupseqQ() {
        return groupseqQ;
    }

    public void setGroupseqQ(int groupseqQ) {
        this.groupseqQ = groupseqQ;
    }

    public int getOrderQ() {
        return orderQ;
    }

    public void setOrderQ(int orderQ) {
        this.orderQ = orderQ;
    }

    public String getTitletQ() {
        return titletQ;
    }

    public void setTitletQ(String titletQ) {
        this.titletQ = titletQ;
    }

    public String getTitleQ() {
        return titleQ;
    }

    public void setTitleQ(String titleQ) {
        this.titleQ = titleQ;
    }

    public String getContentQ() {
        return contentQ;
    }

    public void setContentQ(String contentQ) {
        this.contentQ = contentQ;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateQ() {
        return dateQ;
    }

    public void setDateQ(Date dateQ) {
        this.dateQ = dateQ;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public MultipartFile getMpfile() {
		return mpfile;
	}

	public void setMpfile(MultipartFile mpfile) {
		this.mpfile = mpfile;
	}
    
    

}