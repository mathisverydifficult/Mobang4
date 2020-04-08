package com.finalproject.mobang.agent.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.agent.dto.AgentAccountDto;
import com.finalproject.mobang.agent.dto.AgentProductDto;
import com.finalproject.mobang.agent.dto.AgentReviewDto;

@Repository
public class AgentMypageDaoImpl implements AgentMypageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 계정관리
	@Override
	public AgentAccountDto selectAccount(String email) {
		AgentAccountDto dto = null;
		
		try {
			dto=sqlSession.selectOne(NAMESPACE+"selectAccount", email);
		} catch (Exception e) {
			System.out.println("[dao error] : 마이페이지 계정관리");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 상품관리
	@Override
	public  List<AgentProductDto> selectProductList(String email) {
		
		List<AgentProductDto> list = new ArrayList<AgentProductDto>();
		
		//System.out.println("dao email : " + email);
		
		try {
			list=sqlSession.selectList(NAMESPACE+"productList", email);
		} catch (Exception e) {
			System.out.println("[dao error] : 마이페이지 상품관리");
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	// 리뷰관리
	@Override
	public List<AgentReviewDto> selectReviewList(String agemail) {
		
		List<AgentReviewDto> list = new ArrayList<AgentReviewDto>();
		
		System.out.println("dao 리뷰관리 email : "+agemail);
		try {
			list=sqlSession.selectList(NAMESPACE+"reviewList", agemail);
		} catch (Exception e) {
			System.out.println("[dao error] : 마이페이지 리뷰관리");
			e.printStackTrace();
		}
		
		System.out.println(list);
		
		return list;
	}
	
	// 문의 관리
	@Override
	public List<AgentReviewDto> selectQnaList(String email) {
		
		List<AgentReviewDto> list = new ArrayList<AgentReviewDto>();
		
		System.out.println("dao 문의관리 email : "+email);
		try {
			list=sqlSession.selectList(NAMESPACE+"qnaList", email);
		} catch (Exception e) {
			System.out.println("[dao error] : 마이페이지 문의관리");
			e.printStackTrace();
		}
		
		System.out.println(list);
		
		return list;
	}

}
