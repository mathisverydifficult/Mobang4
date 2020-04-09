package com.finalproject.mobang.user.biz;

import java.util.List;

import com.finalproject.mobang.common.dto.AgentRoomListDto;
import com.finalproject.mobang.user.dto.roomsearchDto;

public interface roomsearchBiz {
	
	public List<roomsearchDto> dibList(String email);
	public List<roomsearchDto> selectsearchList(String keyword, String email, List<String> roomArray, List<String> rentArray);
	public List<roomsearchDto> selectList(String keyword, List<String> roomArray, List<String> rentArray);
	public roomsearchDto selectOne(int myno);
	public int insert(roomsearchDto dto);
	public int update(roomsearchDto dto);
	public int delete(int myno);
	public List<roomsearchDto> recentList(String email);
	public List<AgentRoomListDto> selectAgentList(String email);
	
}
