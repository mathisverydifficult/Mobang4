package com.finalproject.mobang.agent.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.finalproject.mobang.agent.dto.AgentAccountDto;

public class AgentPayDaoImpl implements AgentPayDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public AgentAccountDto selectAccount(String email) {
		AgentAccountDto dto = null;
		
		try {
			dto=sqlSession.selectOne(NAMESPACE+"selectAccount", email);
		} catch (Exception e) {
			System.out.println("[dao error] : Pay 로그인 객체");
			e.printStackTrace();
		}
		
		return dto;
	}
}
