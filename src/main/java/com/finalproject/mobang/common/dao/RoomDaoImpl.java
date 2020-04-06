package com.finalproject.mobang.common.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.common.dto.AgentRoomListDto;
import com.finalproject.mobang.common.dto.Criteria;
import com.finalproject.mobang.common.dto.RoomDto;

@Repository
public class RoomDaoImpl implements RoomDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AgentRoomListDto> selectAgentList(Criteria cri,String email) {
		List<AgentRoomListDto> list = new ArrayList<AgentRoomListDto>();
		//System.out.println(email);
		int rowstart = cri.getRowStart();
		System.out.println("dao cri:"+cri);
		System.out.println(rowstart);
		int rowend = cri.getRowEnd();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd",cri.getRowEnd());
		
		//System.out.println(map);
		try {	// art+shift+z
			list = sqlSession.selectList(NAMESPACE+ "selectAgentList",map);
		} catch (Exception e) {
			System.out.println("[DAO error] : selectAgentList");
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public int listCount(String email) {
//		int res=0;
//		
//		try {
//			res=sqlSession.selectOne(NAMESPACE+"listCount",email);
//		} catch (Exception e) {
//			System.out.println("[room DAO error] : listcount");
//			e.printStackTrace();
//		}
//		
//		return res;
		return sqlSession.selectOne(NAMESPACE+"listCount",email);
	}

	@Override
	public RoomDto selectOne(int no_rm) {
		RoomDto dto = null;
		
		try {
			dto=sqlSession.selectOne(NAMESPACE+"selectOne", no_rm);
		} catch (Exception e) {
			System.out.println("[DAO error] : selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	// 방등록
	@Override
	public int insert(RoomDto dto) {
		int res=0;
		int no_rm=0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
			no_rm = dto.getNo_rm();      // key번호
			 
		} catch (Exception e) {
			System.out.println("[DAO error] : insert");
			e.printStackTrace();
		}
		
		return no_rm;
	}
	
	// 방 수정
	@Override
	public int update(RoomDto dto) {
		int res=0;
		
		try {
			res=sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("[DAO error] : update");
			e.printStackTrace();
		}
		return res;
	}
	
	// 방 삭제
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
	
	
	// insert후 selectone
//	@Override
//	public RoomDto insertcomplete(int no_rm) {
//		RoomDto dto = null;
//		
//		try {
//			dto=sqlSession.selectOne(NAMESPACE+"insertcomplete", no_rm);
//		} catch (Exception e) {
//			System.out.println("[DAO error] : insertcomplete");
//			e.printStackTrace();
//		}
//		
//		return dto;
//	}

}
