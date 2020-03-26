package com.finalproject.mobang.agent.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.agent.dao.AgentNoticeDao;
import com.finalproject.mobang.agent.dto.AgentNoticeDto;
import com.finalproject.mobang.agent.dto.Criteria;

@Service
public class AgentNoticeBizImpl implements AgentNoticeBiz {
	
	@Autowired
	private AgentNoticeDao dao;
	
	@Override
	public List<AgentNoticeDto> selectList(Criteria cri) {
		return dao.selectList(cri);
	}

	@Override
	public AgentNoticeDto selectOne(int seq_nt) {
		return dao.selectOne(seq_nt);
	}

	@Override
	public int insert(AgentNoticeDto dto) {
		return 0;
	}

	@Override
	public int update(AgentNoticeDto dto) {
		return 0;
	}

	@Override
	public int delete(int seq_nt) {
		return 0;
	}


	@Override
	public int listCount() {
		return dao.listCount();
	}
	
	
	
}
