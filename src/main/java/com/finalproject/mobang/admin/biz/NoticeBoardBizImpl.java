package com.finalproject.mobang.admin.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.admin.dao.NoticeBoardDao;
import com.finalproject.mobang.admin.dto.Criteria;
import com.finalproject.mobang.agent.dto.AgentNoticeDto;


@Service
public class NoticeBoardBizImpl implements NoticeBoardBiz{
	@Autowired
	private NoticeBoardDao dao;

	@Override
	public List<AgentNoticeDto> selectList(Criteria cri) {
		return dao.selectList(cri);
	}

	@Override
	public int listCount() {
		return dao.listCount();
	}

	@Override
	public AgentNoticeDto selectOne(int seqNt) {
		return dao.selectOne(seqNt);
	}

	@Override
	public int insert(AgentNoticeDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(AgentNoticeDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int seqNt) {
		return dao.delete(seqNt);
	}
}
