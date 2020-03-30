package com.finalproject.mobang.user.dto;

import java.sql.Date;

public class ReviewDto {

	 // 글 작성자 
    private String email;

    // 공인중개사 
    private String agemail;

    // 리뷰내용 
    private String rcontent;

    // 별점 
    private String star;

    // 작성날짜 
    private Date rdate;
    
    

    public ReviewDto() {
		super();
	}

	public ReviewDto(String email, String agemail, String rcontent, String star, Date rdate) {
		super();
		this.email = email;
		this.agemail = agemail;
		this.rcontent = rcontent;
		this.star = star;
		this.rdate = rdate;
	}

	public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAgemail() {
        return agemail;
    }

    public void setAgemail(String agemail) {
        this.agemail = agemail;
    }

    public String getRcontent() {
        return rcontent;
    }

    public void setRcontent(String rcontent) {
        this.rcontent = rcontent;
    }

    public String getStar() {
        return star;
    }

    public void setStar(String star) {
        this.star = star;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }
	
}
