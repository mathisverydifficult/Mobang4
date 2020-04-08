package com.finalproject.mobang.user.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.common.dto.AgentRoomListDto;
import com.finalproject.mobang.common.dto.Criteria;
import com.finalproject.mobang.user.dto.roomsearchDto;



@Repository
public class roomsearchDaoImpl implements roomsearchDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<roomsearchDto> dibList(String email) {		//찜한 방 리스트만
		List<roomsearchDto> list=new ArrayList<roomsearchDto>();
		
		try {
			list=sqlSession.selectList(NAMESPACE+"dibList", email);
		} catch(Exception e) {
			System.out.println("[error] : selectdibsList");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<roomsearchDto> recentList(String email) {		//최근 본 리스트만

		List<roomsearchDto> list=new ArrayList<roomsearchDto>();
		
		try {
			list=sqlSession.selectList(NAMESPACE+"recentList", email);
		} catch(Exception e) {
			System.out.println("[error] : selectrecentList");
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	@Override
	public List<roomsearchDto> selectsearchList(String keyword, String email) {	//keyword null이면 전체출력
		List<roomsearchDto> list=new ArrayList<roomsearchDto>();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("email", email);
		
		try {
			list=sqlSession.selectList(NAMESPACE+"selectsearchList",map);
		} catch(Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public roomsearchDto selectOne(int myno) {		//방 상세보기
		
		roomsearchDto dto = new roomsearchDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", myno);
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(roomsearchDto dto) {
		int res=0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(roomsearchDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update",dto);
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int myno) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete",myno);
		} catch (Exception e) {
			System.out.println("[error] : delete");
			e.printStackTrace();
		}
		
		return res;
	}
	
	// 방 상세보기에서 공인중개사가 등록한 다른 방을 검색하는 list
	@Override
	public List<AgentRoomListDto> selectAgentList(String email) {
		List<AgentRoomListDto> list = new ArrayList<AgentRoomListDto>();
		
		try {	// art+shift+z
			list = sqlSession.selectList(NAMESPACE+ "selectAgentList",email);
		} catch (Exception e) {
			System.out.println("[DAO error] : selectAgentList");
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
