package com.finalproject.mobang.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.user.dto.roomsearchDto;



@Repository
public class roomsearchDaoImpl implements roomsearchDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<roomsearchDto> dibList() {
		List<roomsearchDto> list=new ArrayList<roomsearchDto>();
		
		try {
			list=sqlSession.selectList(NAMESPACE+"dibList");
		} catch(Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public List<roomsearchDto> selectsearchList(String keyword) {
		List<roomsearchDto> list=new ArrayList<roomsearchDto>();
		
		try {
			list=sqlSession.selectList(NAMESPACE+"selectsearchList",keyword);
		} catch(Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public roomsearchDto selectOne(int myno) {
		
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
	
}
