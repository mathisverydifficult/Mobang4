package com.finalproject.mobang.agent.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.agent.dto.AgentAccountDto;

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

}
