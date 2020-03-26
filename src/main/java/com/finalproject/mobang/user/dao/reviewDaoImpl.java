package com.finalproject.mobang.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.user.dto.reviewDto;



@Repository
public class reviewDaoImpl implements reviewDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<reviewDto> selectList() {
		List<reviewDto> list=new ArrayList<reviewDto>();
		
		try {
			list=sqlSession.selectList(NAMESPACE+"selectList");
		} catch(Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public reviewDto selectOne(int myno) {
		
		reviewDto dto = new reviewDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectone", myno);
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(reviewDto dto) {
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
	public int update(reviewDto dto) {
		
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
