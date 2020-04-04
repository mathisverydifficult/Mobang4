package com.finalproject.mobang.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.user.dto.FavoriteDto;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public int insertRecent(FavoriteDto dto) {
		
		int res=0;
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"insertRecent",dto);
			
		} catch (Exception e) {
			System.out.println("[error] : insertRecent ");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertDibs(FavoriteDto dto) {
		
		int res=0;
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"insertDibs",dto);
		} catch (Exception e) {
			System.out.println("[error] : insertDibs ");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int deleteDibs(FavoriteDto dto) {
		int res =0;
		
		try {
			res = sqlSessionTemplate.delete(NAMESPACE+"deletedibs",dto);
		} catch (Exception e) {
			System.out.println("[error] : deletedibs");
			e.printStackTrace();
		}
		return res;
		
	}

	
	@Override
	public int updateRoomEx(FavoriteDto dto) {
		
		int res =0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"updateRoomEx",dto);
		} catch (Exception e) {
			System.out.println("[error] : updateRoomEx");
			e.printStackTrace();
		}
		
		return res;
		
	}

	@Override
	public List<FavoriteDto> selectListDibs(String email) {
		
		List<FavoriteDto> list = new ArrayList<FavoriteDto>();
		try {
			list = sqlSessionTemplate.selectList(NAMESPACE + "selectListDibs",email);
		} catch (Exception e) {
			System.out.println("[error] selectListDibs");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FavoriteDto> selectListRecent(String email) {
		
		List<FavoriteDto> list = new ArrayList<FavoriteDto>();
		try {
			list = sqlSessionTemplate.selectList(NAMESPACE + "selectListRecent",email);
		} catch (Exception e) {
			System.out.println("[error] selectListRecent");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dibsCount(String email) {
		int count = 0;
		try {
			count = sqlSessionTemplate.selectOne(NAMESPACE + "dibsCount",email);
		} catch (Exception e) {
			System.out.println("[error]  Dibs count");
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public int recentCount(String email) {
		int count = 0;
		try {
			count = sqlSessionTemplate.selectOne(NAMESPACE + "recentCount",email);
		} catch (Exception e) {
			System.out.println("[error]  Recent count");
			e.printStackTrace();
		}
		return count;
	}

}
