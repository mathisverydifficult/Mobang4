package com.finalproject.mobang.user.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.common.dto.AgentRoomListDto;
import com.finalproject.mobang.user.dao.roomsearchDao;
import com.finalproject.mobang.user.dto.roomsearchDto;



@Service
public class roomsearchBizImpl implements roomsearchBiz {

	@Autowired
	private roomsearchDao dao;
	
	@Override
	public List<roomsearchDto> dibList(String email) {
		return dao.dibList(email);
	}
	
	@Override
	public List<roomsearchDto> selectsearchList(String keyword, String email) {
		return dao.selectsearchList(keyword, email);
	}

	@Override
	public roomsearchDto selectOne(int myno) {
		return dao.selectOne(myno);
	}

	@Override
	public int insert(roomsearchDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(roomsearchDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int myno) {
		return dao.delete(myno);
	}

	@Override
	public List<roomsearchDto> recentList(String email) {
		return dao.recentList(email);
	}

	@Override
	public List<AgentRoomListDto> selectAgentList(String email) {
		return dao.selectAgentList(email);
	}

}
