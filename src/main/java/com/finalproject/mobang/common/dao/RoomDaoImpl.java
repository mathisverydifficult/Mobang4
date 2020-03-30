package com.finalproject.mobang.common.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.agent.dto.Criteria;
import com.finalproject.mobang.common.dto.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<RoomDto> selectAgentList(Criteria cri) {
		List<RoomDto> list = new ArrayList<RoomDto>();

		try {	// art+shift+z
			list = sqlSession.selectList(NAMESPACE+ "selectAgentList",cri);
		} catch (Exception e) {
			System.out.println("[DAO error] : selectAgentList");
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public int listCount() {
		return sqlSession.selectOne(NAMESPACE+"listCount");
	}

	@Override
	public RoomDto selectOne(int no_rm) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	// 방등록
	@Override
	public int insert(RoomDto dto) {
		int res=0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[DAO error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(RoomDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no_rm) {
		int res=0;
		
		try {
			res=sqlSession.delete(NAMESPACE+"delete", no_rm);
		} catch (Exception e) {
			System.out.println("[DAO error] : delete");
			e.printStackTrace();
		}
		
		return res;
	}

}
