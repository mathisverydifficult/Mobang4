package com.finalproject.mobang.common.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.common.dto.AgentRoomListDto;
import com.finalproject.mobang.common.dto.Criteria;
import com.finalproject.mobang.common.dao.RoomDao;
import com.finalproject.mobang.common.dto.RoomDto;

@Service
public class RoomBizImpl implements RoomBiz {
	
	@Autowired
	private RoomDao dao;

	@Override
	public List<AgentRoomListDto> selectAgentList(Criteria cri,String email) {
		return dao.selectAgentList(cri,email);
	}

	@Override
	public int listCount(String email) {
		return dao.listCount(email);
	}

	@Override
	public RoomDto selectOne(int no_rm) {
		return dao.selectOne(no_rm);
	}

	@Override
	public int insert(RoomDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(RoomDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int no_rm) {
		return dao.delete(no_rm);
	}

//	@Override
//	public RoomDto insertcomplete(int no_rm) {
//		return dao.insertcomplete(no_rm);
//	}

}
