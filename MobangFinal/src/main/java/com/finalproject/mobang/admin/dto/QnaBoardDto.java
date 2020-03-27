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
    
    
    
    
    

    public QnaBoardDto() {
		super();
	}
    
    
    
	

	public QnaBoardDto(int seqQ, int groupseqQ, int orderQ, String titletQ, String titleQ, String contentQ,
			String email, Date dateQ) {
		super();
		this.seqQ = seqQ;
		this.groupseqQ = groupseqQ;
		this.orderQ = orderQ;
		this.titletQ = titletQ;
		this.titleQ = titleQ;
		this.contentQ = contentQ;
		this.email = email;
		this.dateQ = dateQ;
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

    

}