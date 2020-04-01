package com.finalproject.mobang.common.dao;

import java.util.List;

import com.finalproject.mobang.common.dto.Criteria;
import com.finalproject.mobang.common.dto.RoomDto;

public interface RoomDao {
	
	String NAMESPACE="room.";
	
	public List<RoomDto> selectAgentList(Criteria cri,String email);		// 공인중개사 올린방 목록 조회(email로 조건준 리스트)
	public int listCount(String email);								// 게시물 총 개수
	public RoomDto selectOne(int no_rm);
	public int insert(RoomDto dto);
	public int update(RoomDto dto);
	public int delete(int no_rm);	

}
