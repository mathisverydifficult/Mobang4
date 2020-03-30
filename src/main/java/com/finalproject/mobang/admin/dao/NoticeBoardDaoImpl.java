package com.finalproject.mobang.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.admin.dto.Criteria;
import com.finalproject.mobang.agent.dto.AgentNoticeDto;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//전체글 리스트
	@Override
	public List<AgentNoticeDto> selectList(Criteria cri) {
		List<AgentNoticeDto> list = new ArrayList<AgentNoticeDto>();

		try {	// art+shift+z
			list = sqlSessionTemplate.selectList(NAMESPACE+ "selectList",cri);
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}

		return list;
	}

	// 게시물 총 개수
	@Override
	public int listCount() {
		return sqlSessionTemplate.selectOne(NAMESPACE+"listCount");
	}

	
	@Override
	public AgentNoticeDto selectOne(int seqNt) {
		AgentNoticeDto dto = null;
		
		try {
			dto = sqlSessionTemplate.selectOne(NAMESPACE+"selectOne",seqNt);
		} catch (Exception e) {
			System.out.println("[error] : Notice  selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public int insert(AgentNoticeDto dto) {
		int res=0;
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"insert",dto);
			
			
		} catch (Exception e) {
			System.out.println("[error] : Notice insert ");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int update(AgentNoticeDto dto) {
		int res =0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"update",dto);
		} catch (Exception e) {
			System.out.println("[error] : Notice update");
			e.printStackTrace();
		}
		
		return res;
	}
	
	// 글 삭제
	@Override
	public int delete(int seqQ) {
		int res =0;
		
		try {
			res = sqlSessionTemplate.delete(NAMESPACE+"delete",seqQ);
		} catch (Exception e) {
			System.out.println("[error] : Notice delete");
			e.printStackTrace();
		}
		return res;
	}

	
	
	// 게시글 숫자 세주는
//	@Override
//	public int listCount() {
//		List<QnaBoardDto> list = new ArrayList<QnaBoardDto>();
//		int count = 0;
//		try {
//			list = sqlSessionTemplate.selectList(NAMESPACE + "selectList");
//			count = list.size();
//		} catch (Exception e) {
//			System.out.println("[error] Qna selectList count");
//			e.printStackTrace();
//		}
//		return count;
//	}



	


	

}
