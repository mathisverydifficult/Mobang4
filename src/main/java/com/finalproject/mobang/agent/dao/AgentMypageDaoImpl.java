package com.finalproject.mobang.agent.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.agent.dto.AgentAccountDto;
import com.finalproject.mobang.agent.dto.AgentProductDto;

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

	@Override
	public  List<AgentProductDto> selectProductList(String email) {
		
		List<AgentProductDto> list = new ArrayList<AgentProductDto>();
		
		System.out.println("dao email : " + email);
		
		try {
			list=sqlSession.selectList(NAMESPACE+"productList", email);
		} catch (Exception e) {
			System.out.println("[dao error] : 마이페이지 상품관리");
			e.printStackTrace();
		}
		
		
		return list;
	}

}
