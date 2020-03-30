package com.finalproject.mobang.admin.dao;

import java.util.List;

import com.finalproject.mobang.admin.dto.Criteria;
import com.finalproject.mobang.agent.dto.AgentNoticeDto;

public interface NoticeBoardDao {

	

	String NAMESPACE = 	"notice.";
	
	public List<AgentNoticeDto> selectList(Criteria cri);
	public int listCount();						// 게시물 총 개수
	public AgentNoticeDto selectOne(int seqNt);
	public int insert(AgentNoticeDto dto);
	public int update(AgentNoticeDto dto);
	public int delete(int seqNt);
	
	
}
