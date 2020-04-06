package com.finalproject.mobang.user.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.user.dto.Criteria;
import com.finalproject.mobang.user.dto.FavoriteDto;
import com.finalproject.mobang.user.dto.ReviewDto;
@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	@Override
	public List<ReviewDto> selectListReview(Criteria cri ) {
		
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		try {
			list = sqlSessionTemplate.selectList(NAMESPACE + "selectListReview",cri);
		} catch (Exception e) {
			System.out.println("[error] selectListReview");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ReviewDto> selectListAgReview(Criteria cri) {
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		try {
			list = sqlSessionTemplate.selectList(NAMESPACE + "selectListAgReview",cri);
		} catch (Exception e) {
			System.out.println("[error] selectListAgReview");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insert(ReviewDto dto) {
		int res=0;
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"insert",dto);
			
		} catch (Exception e) {
			System.out.println("[error] : insertRecent ");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(ReviewDto dto) {
		
		int res =0;
		
		try {
			res = sqlSessionTemplate.delete(NAMESPACE+"delete",dto);
		} catch (Exception e) {
			System.out.println("[error] : deleteReview");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int listCountUser(String email) {
		return sqlSessionTemplate.selectOne(NAMESPACE+"listCountUser",email);
	}
	
	

}
