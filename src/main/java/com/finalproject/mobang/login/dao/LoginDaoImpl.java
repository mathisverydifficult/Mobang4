package com.finalproject.mobang.login.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.login.dto.LoginDto;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int userInsert(LoginDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"userinsert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : insert user");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int agentInsert(LoginDto dto) {
		int res = 0;
		
		System.out.println(dto.getEmail() + "  " + dto.getName() + "  " + dto.getPwd() + "  " + dto.getPhone());
		try {
			res = sqlSession.insert(NAMESPACE+"agentinsert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : agent user");
			e.printStackTrace();
		}
		
		return res;
	}

}
