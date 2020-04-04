package com.finalproject.mobang.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.user.dto.FavoriteDto;



@Repository
public class favoriteDaoImpl implements favoriteDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<FavoriteDto> selectList() {
		List<FavoriteDto> list=new ArrayList<FavoriteDto>();
		
		try {
			list=sqlSession.selectList(NAMESPACE+"selectList");
		} catch(Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}
		
		return list;
	}
	


	@Override
	public FavoriteDto selectOne(int myno) {
		
		FavoriteDto dto = new FavoriteDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", myno);
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insertRecent(FavoriteDto dto) {
		int res=0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertRecent", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int insertDibs(FavoriteDto dto) {
		int res=0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertDibs", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(FavoriteDto dto) {
		
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
