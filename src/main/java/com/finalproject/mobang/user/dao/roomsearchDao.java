package com.finalproject.mobang.user.dao;

import java.util.List;

import com.finalproject.mobang.user.dto.roomsearchDto;



public interface roomsearchDao {
	String NAMESPACE = "roomsearch.";
	
	public List<roomsearchDto> selectList();
	public roomsearchDto selectOne(int myno);
	public int insert(roomsearchDto dto);
	public int update(roomsearchDto dto);
	public int delete(int myno);
}
