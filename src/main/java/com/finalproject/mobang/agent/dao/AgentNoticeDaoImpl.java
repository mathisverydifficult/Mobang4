package com.finalproject.mobang.agent.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.agent.dto.AgentNoticeDto;
import com.finalproject.mobang.agent.dto.Criteria;

@Repository
public class AgentNoticeDaoImpl implements AgentNoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AgentNoticeDto> selectList(Criteria cri) {
		List<AgentNoticeDto> list = new ArrayList<AgentNoticeDto>();

		try {	// art+shift+z
			list = sqlSession.selectList(NAMESPACE+ "selectList",cri);
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}

		return list;
	}

	// 게시물 총 개수
	@Override
	public int listCount() {
		return sqlSession.selectOne(NAMESPACE+"listCount");
	}
	
	@Override
	public AgentNoticeDto selectOne(int seq_nt) {
		AgentNoticeDto dto = null;
		
		try {
			dto=sqlSession.selectOne(NAMESPACE+"selectOne",seq_nt);
		} catch (Exception e) {
			System.out.println("[error] : selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(AgentNoticeDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(AgentNoticeDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int seq_nt) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
