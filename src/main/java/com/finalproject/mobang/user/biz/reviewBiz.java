package com.finalproject.mobang.user.biz;

import java.util.List;

import com.finalproject.mobang.user.dto.reviewDto;

public interface reviewBiz {
	
	public List<reviewDto> selectList();
	public reviewDto selectOne(int myno);
	public int insert(reviewDto dto);
	public int update(reviewDto dto);
	public int delete(int myno);
}
