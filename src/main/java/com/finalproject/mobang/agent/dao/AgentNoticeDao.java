package com.finalproject.mobang.agent.dao;

import java.util.List;

import com.finalproject.mobang.agent.dto.AgentNoticeDto;
import com.finalproject.mobang.agent.dto.Criteria;

public interface AgentNoticeDao {
	String NAMESPACE = "notice.";
	
	public List<AgentNoticeDto> selectList(Criteria cri);	// 게시물 목록 조회
	public int listCount();						// 게시물 총 개수
	public AgentNoticeDto selectOne(int seq_nt);
	public int insert(AgentNoticeDto dto);
	public int update(AgentNoticeDto dto);
	public int delete(int seq_nt);
}
