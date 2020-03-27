package com.finalproject.mobang.user.dao;

import java.util.List;

import com.finalproject.mobang.user.dto.reviewDto;



public interface reviewDao {
	String NAMESPACE = "myreview.";
	
	public List<reviewDto> selectList();
	public reviewDto selectOne(int myno);
	public int insert(reviewDto dto);
	public int update(reviewDto dto);
	public int delete(int myno);
}
